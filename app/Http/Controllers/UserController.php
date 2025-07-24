<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Cache;
use App\Jobs\ProcessUserBatch;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
        // echo "hii";
    }

   public function index(Request $request)
{

    
    $user = $request->user();
    
    if ($user->hasRole('SuperAdmin')) {
        //$users = Cache::remember('users:superadmin', now()->addMinutes(30), function () {
            return User::with('roles')->get();
       // });
        //return response()->json($users);
    }

    if ($user->hasRole('Admin')) {
        $users = User::whereDoesntHave('roles', function($query) {
            $query->whereIn('name', ['SuperAdmin', 'Admin']);
        })->with('roles')->get();
        return response()->json($users);
    }

    

    if ($user->hasRole('User')) {
        return response()->json([$user->load('roles')]);
    }

    return response()->json(['error' => 'No Data Found'], 403);
}
    

   public function store(Request $request)
{
    // Verify admin or superadmin access
    if (!Gate::allows('isAdmin') && !Gate::allows('isSuperAdmin')) {
        return response()->json(['error' => 'Unauthorized'], 403);
    }

    // Validate input
    $validator = Validator::make($request->all(), [
        'users' => 'required|array',
        'users.*.name' => 'required|string',
        'users.*.email' => 'required|email|unique:users,email',
        'users.*.password' => 'required|string|min:6',
        'users.*.role' => ['required', Rule::in(['User', 'Admin'])],
    ]);

    if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()], 400);
    }

    // Additional role restrictions for Admin (can't create other Admins)
    if (Gate::allows('isAdmin')) {
        foreach ($request->users as $userData) {
            if ($userData['role'] === 'Admin') {
                return response()->json([
                    'error' => 'Admins cannot create other Admins'
                ], 403);
            }
        }
    }

    ProcessUserBatch::dispatch($request->users);

    return response()->json([
        'message' => 'Users are being processed in the background'
    ], 202);
}

   public function update(Request $request, $id)
{
    if (!Gate::allows('isAdmin') && !Gate::allows('isSuperAdmin')) {
        return response()->json(['error' => 'Unauthorized'], 403);
    }

    $user = User::findOrFail($id);

    // Admins can't update other admins or super admins
    if (Gate::allows('isAdmin') && ($user->hasRole('Admin') || $user->hasRole('SuperAdmin'))) {
        return response()->json(['error' => 'Unauthorized'], 403);
    }

    $validator = Validator::make($request->all(), [
        'name' => 'sometimes|string',
        'email' => 'sometimes|email|unique:users,email,' . $user->id,
        'password' => 'sometimes|string|min:6',
    ]);

    if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()], 400);
    }

    $data = $request->only(['name', 'email']);

    // ✅ Hash the password using Hash::make()
    if ($request->filled('password')) {
        $data['password'] = Hash::make($request->password);
    }

    $user->update($data);

    return response()->json($user);
}

   public function destroy($id)
    {
        if (!Gate::allows('isSuperAdmin')) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $user = User::findOrFail($id);
        
        // This will perform a soft delete
        $user->delete();

        return response()->json([
            'message' => 'User soft deleted successfully',
            'user' => $user
        ]);
    }
}
