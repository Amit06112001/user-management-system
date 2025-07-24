<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Role;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Carbon;

class AdminSeeder extends Seeder
{
    public function run()
    {
        // First ensure the Admin role exists
        $adminRole = Role::firstOrCreate(
            ['name' => 'Admin'],
            ['created_at' => Carbon::now(), 'updated_at' => Carbon::now()]
        );

        // Create or update the admin user
        $admin = User::updateOrCreate(
            ['email' => 'admin@example.com'],
            [
                'name' => 'Admin',
                'password' => Hash::make('password'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]
        );

        // Assign the Admin role to the user
        $admin->roles()->syncWithoutDetaching([$adminRole->id]);
    }
}