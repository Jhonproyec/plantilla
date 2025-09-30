import { inject, Injectable } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { first, map } from 'rxjs';


export const authGuard: CanActivateFn = () => {
  const authService = inject(AuthService);
  const router = inject(Router);

  return authService.isAuthenticated$.pipe(
    first(),
    map(isAuthenticated => {
      if(isAuthenticated){
        return true;
      }else{
        router.navigate(['/login']);
        return false;
      }
    })
  )
  
};
