import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient, HttpParams } from '@angular/common/http';
import { catchError, map, Observable, of, throwError } from 'rxjs';
import { NotificationService } from './notification.service';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  readonly BASE_URL = environment.BASE_URL;

  constructor(
    private http: HttpClient,
    private notificationService: NotificationService
  ) { }

  saveOrder(data: any): Observable<any> {
    return this.http.post(`${this.BASE_URL}/order`, data);
  }

  updateOrder(data: any): Observable<any> {
    return this.http.put(`${this.BASE_URL}/order`, data);

  }

  getDepartaments(): Observable<any[]> {
    const cached = localStorage.getItem('departaments');

    if (cached) {
      return of(JSON.parse(cached));
    } else {
      return this.http.get<{ success: boolean, data: any[] }>(`${this.BASE_URL}/department`).pipe(
        map(response => {
          if (response && response.success && Array.isArray(response.data)) {
            localStorage.setItem('departaments', JSON.stringify(response.data));
            return response.data;
          } else {
            this.notificationService.showError("Erro al obtener los departamentos");
            throw new Error('Respuesta inválida del backend');
          }
        }),
        catchError(err => {
          this.notificationService.showError("Erro al obtener los departamentos");
          return throwError(() => err);
        })
      );
    }
  }

  getCompanies(): Observable<any[]> {
    const cached = localStorage.getItem('companies');

    if (cached) {
      return of(JSON.parse(cached));
    } else {
      return this.http.get<{ success: boolean, data: any }>(`${this.BASE_URL}/company`).pipe(
        map(response => {
          if (response && response.success) {
            localStorage.setItem('companies', JSON.stringify(response.data.result));
            return response.data.result;
          } else {
            this.notificationService.showError("Erro al obtener las empresas");
            throw new Error('Respuesta inválida del backend');
          }
        }),
        catchError(err => {
          this.notificationService.showError("Erro al obtener las empresas");
          return throwError(() => err);
        })
      );
    }
  }

  getMunicipalities(idDepartament: number): Observable<any[]> {
    return this.http.get<{ success: boolean, data: any[] }>(`${this.BASE_URL}/municipality?idDepartament=${idDepartament}`).pipe(
      map(response => {
        if (response && response.success) {
          return response.data;
        } else {
          this.notificationService.showError("Error al obtener los municipios");
          throw new Error("Respuesta inválida del backend");
        }
      }), catchError(err => {
        this.notificationService.showError("Error al obtener los municipios");
        return throwError(() => err);
      })
    )
  }

  getAllOrders(page: number = 1, limit: number = 10, orderStatus: number, search: string = '') {
    let params = new HttpParams()
      .set('page', page.toString())
      .set('limit', limit.toString())
      .set('orderStatus', orderStatus.toString());

    if (search) {
      params = params.set('search', search);
    }

    return this.http.get<any>(`${this.BASE_URL}/order`, { params });

}

markSend(idOrder: number) {
  return this.http.put<{ success: boolean }>(`${this.BASE_URL}/order/markSend`, { idOrder }).pipe(
    map(response => {
      return response.success;
    }),
    catchError(err => {
      this.notificationService.showError("Error al marcar la orden como enviada");
      return throwError(() => err);
    })
  )
}

generateTicket(idOrder: number) {
  return this.http.post(`${this.BASE_URL}/order/generateTicket`, { idOrder });
}

deleteOrder(idOrder: number) {
  return this.http.delete(`${this.BASE_URL}/order`, { params: { idOrder } }).pipe(
    map((response: any) => {
      if (response.success) {
        return response.success;
      } else {
        this.notificationService.showError("Error al eliminar la orden")
      }
    }),
    catchError(err => {
      this.notificationService.showError("Error al eliminar la orden");
      return throwError(() => err);
    })
  )
}




}
