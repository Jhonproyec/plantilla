import { Injectable, signal } from '@angular/core';
import { BehaviorSubject, catchError, delay, map, Observable, of, tap, throwError } from 'rxjs';
import { User } from '../models/user.model';
import { Router } from '@angular/router';
import { AuthResponse, ForgotPasswordRequest, LoginRequest } from '../models/auth.model';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { NotificationService } from './notification.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private readonly TOKEN_KEY = 'token_key';
  private readonly USER_KEY = 'user_key';

  private isAuthenticatedSubject = new BehaviorSubject<boolean | null>(false);
  private currentUserSubject = new BehaviorSubject<User | null>(null);

  public isAuthenticated$ = this.isAuthenticatedSubject.asObservable();
  public currentUser$ = this.currentUserSubject.asObservable();

  public isLoggedIn = signal(false);
  readonly BASE_URL = environment.BASE_URL;

  constructor(
    private router: Router,
    private http: HttpClient,
    private notificationService: NotificationService,
  ) { }

  login(credentials: LoginRequest): Observable<any> {
    return this.http.post(`${this.BASE_URL}/auth/login`, credentials).pipe(
      map((response: any) => {
        const res: AuthResponse = {
          token: response.data.tokens.accessToken,
          expiresIn: 3600,
          user: response.data.user
        }
        this.setAuthData(res.token, res.user);
        return res;
      }),
      catchError((error) => {
        this.notificationService.showError("Error al iniciar sesión");
        return throwError(() => error.error);
      })
    )
  }


  private setAuthData(token: string, user: User): void {
    localStorage.setItem(this.TOKEN_KEY, token),
      localStorage.setItem(this.USER_KEY, JSON.stringify(user));
    this.isAuthenticatedSubject.next(true);
    this.currentUserSubject.next(user);
    this.isLoggedIn.set(true);
  }

  forgotPassword(request: ForgotPasswordRequest): Observable<{ message: string }> {
    // Simulación - Reemplazar con llamada HTTP real
    return of({ message: 'Se ha enviado un enlace de recuperación a tu correo electrónico' }).pipe(
      delay(2000)
    );
  }

  logout(): void {
    localStorage.removeItem(this.TOKEN_KEY);
    localStorage.removeItem(this.USER_KEY);
    this.isAuthenticatedSubject.next(false);
    this.currentUserSubject.next(null);
    this.isLoggedIn.set(false);
    this.router.navigate(['/login']);
  }

  checkoutStatus(): void {
    if (typeof window === 'undefined') return;
    const token = localStorage.getItem(this.TOKEN_KEY);
    const userData = localStorage.getItem(this.USER_KEY);

    if (token && userData) {
      try {
        const user: User = JSON.parse(userData);
        this.isAuthenticatedSubject.next(true);
        this.currentUserSubject.next(user);
        this.isLoggedIn.set(true);
      } catch (error) {
        this.logout();
      }
    }
  }

  getToken(): string | null {
    return localStorage.getItem(this.TOKEN_KEY);
  }

  getCurrentUser(): User | null {
    return this.currentUserSubject.value;
  }

}
