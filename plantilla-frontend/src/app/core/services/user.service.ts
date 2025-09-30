import { Injectable } from '@angular/core';
import { catchError, delay, map, Observable, of, throwError } from 'rxjs';
import { CreateUserRequest, User } from '../models/user.model';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { NotificationService } from './notification.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  readonly BASE_URL = environment.BASE_URL;

  constructor(
    private http: HttpClient,
    private notificationService: NotificationService
  ) { }
  getUsers(page: number, limit: number): Observable<User[]> {
    return this.http.get(`${this.BASE_URL}/user`, {
      params: {
        page: page.toString(),
        limit: limit.toString()
      }
    }).pipe(
      map((response: any) => {
        if (response.success) {
          return response.data;
        } else {
          this.notificationService.showError("Error al obtener los usuarios");
          console.log(response);
        }
      }),
      catchError(error => {
        this.notificationService.showError("Error al obtener los usuarios");
        return throwError(() => error.error);
      })
    )
  }

  createUser(userData: CreateUserRequest): Observable<any> {
    return this.http.post(`${this.BASE_URL}/auth/register`, userData).pipe(
      map((response: any) => {
        if (response.success) {
          this.notificationService.showSuccess("Usuario creado exitosamente");
          return response.data;
        } else {
          this.notificationService.showError("Error al crear el usuario");
          console.log(response);
        }
      }),
      catchError(error => {
        this.notificationService.showError("Error al crear el usuario");
        return throwError(() => error.error);
      })
    )
  }

  updateUser(userData: any):Observable<any>{
    return this.http.put(`${this.BASE_URL}/user/profile`, userData).pipe(  
      map((response:any) => {
        if(response.success){
          this.notificationService.showSuccess("Usuario editado correctamente");
          return response.data;
        }else{
          this.notificationService.showError("Error al actualizar el usuario");
          return of();
        }
      }),
      catchError(error => {
        this.notificationService.showError("Error al crear el usuario");
        return throwError(() => error.error);
      })
    )
  }

  deleteUser(userId:number):Observable<any>{
    return this.http.delete(`${this.BASE_URL}/user`, {params: {userId}}).pipe(
      map((response:any) => {
        if(response.success){
          this.notificationService.showSuccess("Usuario eliminado correctamente");
          return response.success;
        }else{
          console.log(response);
          this.notificationService.showError("Error al eliminar el usuario");
        }
      }),catchError((error:any) =>{
        this.notificationService.showError("Error al eliminar el usuario");
        console.log(error);
        return throwError(() => error);
      })
    )
    // const userIndex = this.mockUsers.findIndex(u => u.idUser === id);
    // this.mockUsers.splice(userIndex, 1);
    // return of(void 0).pipe(delay(500));
  }

}
