import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, map, Observable, throwError } from 'rxjs';
import { environment } from '../../../environments/environment';
import { NotificationService } from './notification.service';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  readonly BASE_URL = environment.BASE_URL;
  
  constructor(
    private http: HttpClient,
    private notificationService: NotificationService
  ) { }

  getKpi(): Observable<any> {
    return this.http.get(`${this.BASE_URL}/dashboard/kpi`).pipe(
      map((response: any) => {
        if (response.success) {
          return response.data;
        } else {
          this.notificationService.showError("Error al obtener información del dashboard");
          throw new Error('Respuesta inválida del backend');
        }
      }), 
      catchError((error: any) => {
        this.notificationService.showError("Error al obtener información del dashboard");
        return throwError(() => error);
      })
    );
  }
}