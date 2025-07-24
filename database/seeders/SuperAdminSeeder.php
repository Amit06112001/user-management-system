<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;
use App\Models\Role;
class SuperAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
   public function run()
    {
        // Ensure SuperAdmin role exists
        $superAdminRole = Role::firstOrCreate(
            ['name' => 'SuperAdmin'],
            ['created_at' => Carbon::now(), 'updated_at' => Carbon::now()]
        );

        // Create SuperAdmin user
        $superAdmin = User::updateOrCreate(
            ['email' => 'superadmin@example.com'],
            [
                'name' => 'Super Admin',
                'password' => Hash::make('password'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]
        );

        // Assign role
        $superAdmin->roles()->syncWithoutDetaching([$superAdminRole->id]);
    }
}
