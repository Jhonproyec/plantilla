import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { inject } from '@angular/core';
import { first, map } from 'rxjs';

export const roleGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const allowedRoles = route.data['roles'] as string[] | undefined;

  return authService.currentUser$.pipe(
    first(),
    map(user => {
      if (!user) {
        router.navigate(['/login']);
        return false;
      }

      if (!allowedRoles || allowedRoles.includes(user.role)) {
        return true;
      }

      router.navigate(['/dashboard/pedidos-completados']);
      return false;
    })
  );
};
