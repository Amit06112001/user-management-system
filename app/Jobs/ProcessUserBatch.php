<?php

namespace App\Jobs;

use App\Models\User;
use App\Models\Role;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Hash;

class ProcessUserBatch implements ShouldQueue
{
     use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

      protected $users;

    /**
     * Create a new job instance.
     */
   public function __construct($users)
    {
        $this->users = $users;
    }

    /**
     * Execute the job.
     */
   public function handle()
    {
        foreach ($this->users as $userData) {
            $user = User::create([
                'name' => $userData['name'],
                'email' => $userData['email'],
                'password' => Hash::make($userData['password']),
            ]);

            $role = Role::where('name', $userData['role'])->first();
            if ($role) {
                $user->assignRole($role);
            }
        }
    }
}
