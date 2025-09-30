import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth-guard';
import { roleGuard } from './core/guards/role-guard-guard';

export const routes: Routes = [
    {
        path: 'login',
        loadComponent: () => import('./features/auth/login/login').then(m => m.Login)
    },
    {
        path: 'dashboard',
        loadComponent: () => import("./layout/main-layout/main-layout").then(m => m.MainLayout),
        canActivate: [authGuard], // solo autenticación
        children: [
            {
                path: '',
                loadComponent: () => import('./features/dashboard/dashboard').then(m => m.Dashboard),
                canActivate: [roleGuard],
                data: { roles: ['ADMIN'] }
            },
            {
                path: 'pedidos-pendientes',
                loadComponent: () => import('./features/pedidos/pendientes/pendientes').then(m => m.Pendientes),
                canActivate: [roleGuard],
                data: { roles: ['ADMIN', 'SELLER'] }
            },
            {
                path: 'pedidos-completados',
                loadComponent: () => import('./features/pedidos/completados/completados').then(m => m.Completados),
                canActivate: [roleGuard],
                data: { roles: ['ADMIN', 'SELLER'] }
            },
            {
                path: 'usuarios',
                loadComponent: () => import('./features/usuarios/usuarios').then(m => m.Usuarios),
                canActivate: [roleGuard],
                data: { roles: ['ADMIN'] }
            }
        ]
    },
    {
        path: '',
        redirectTo: '/dashboard',
        pathMatch: 'full'
    },
    {
        path: '**',
        redirectTo: '/dashboard'
    }
];
