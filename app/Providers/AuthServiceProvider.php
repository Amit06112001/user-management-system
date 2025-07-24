<?php

namespace App\Providers;

// use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;


class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot()
    {
        $this->registerPolicies();

        // For Passport v11+
        Passport::loadKeysFrom(storage_path('oauth'));

        Gate::define('isSuperAdmin', function ($user) {
            return $user->hasRole('SuperAdmin');
        });

        Gate::define('isAdmin', function ($user) {
            return $user->hasRole('Admin');
        });

        Gate::define('isUser', function ($user) {
            return $user->hasRole('User');
        });
    }
}
