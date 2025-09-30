import { CommonModule } from '@angular/common';
import { Component, Inject, OnInit, signal } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MAT_DIALOG_DATA, MatDialog, MatDialogModule } from '@angular/material/dialog';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTableModule } from '@angular/material/table';
import { MatChipsModule } from '@angular/material/chips';
import { User } from '../../core/models/user.model';
import { UserService } from '../../core/services/user.service';
import { CreateUserDialog } from './create-user-dialog/create-user-dialog';
import { MatPaginatorModule, PageEvent } from '@angular/material/paginator';
import { ConfirmDialogService } from '../../core/services/confirm-dialog.service';

@Component({
  selector: 'app-usuarios',
  imports: [
    CommonModule,
    MatCardModule,
    MatTableModule,
    MatButtonModule,
    MatIconModule,
    MatChipsModule,
    MatMenuModule,
    MatDialogModule,
    MatProgressSpinnerModule,
    MatPaginatorModule
  ],
  templateUrl: './usuarios.html',
  styleUrl: './usuarios.css',
  standalone: true
})
export class Usuarios implements OnInit {
  users = signal<User[]>([]);
  isLoading = signal(false);
  displayedColumns: string[] = ['name', 'email', 'role', 'status', 'actions'];
  totalOrders = 0;
  pageSize = 10;
  pageIndex = 0;

  constructor(
    private userService: UserService,
    private dialog: MatDialog,
    private confirmationService: ConfirmDialogService
  ) { }

  ngOnInit(): void {
    this.loadUsers();
    // console.log("USER", this.user);
  }

  loadUsers(page: number = 1, limit: number = this.pageSize): void {
    this.isLoading.set(true);
    this.userService.getUsers(page, limit).subscribe({
      next: (users: any) => {
        this.users.set(users.users);
        this.totalOrders = users.users.total;
        this.isLoading.set(false);
      },
      error: () => {
        this.isLoading.set(false);
      }
    });
  }

  onPageChange(event: PageEvent) {
    this.pageIndex = event.pageIndex;
    this.pageSize = event.pageSize;
    this.loadUsers(this.pageIndex + 1, this.pageSize);
  }

  openCreateUserDialog(data: any = null): void {
    const dialogRef = this.dialog.open(CreateUserDialog, {
      width: '800px',
      maxWidth: '100vw',
      disableClose: true,
      data: data
    });
    dialogRef.afterClosed().subscribe(result => {
      const user = result.user;
      if (result && data == null) {
        this.users.update(users => {
          return [user, ...users];
        });
      } else {
        this.users.update(users => {
          const idx = users.findIndex(u => u.idUser === user.idUser);
          if (idx != -1) {
            const newUsers = [...users];
            newUsers[idx] = user;
            return newUsers;
          }else {return []}
        })
      }
    });
  }


  deleteUser(user: User): void {
    this.confirmationService.confirmDelete("¿Está seguro de eliminar este usuario?").subscribe(confirmed => {
      if (confirmed) {
        this.userService.deleteUser(user.idUser).subscribe({
          next: (response) => {
            if (response) {
              this.users.set(
                this.users().filter(u => u.idUser !== user.idUser)
              );
            }
          },
          error: (error) => {
            console.log(error);
          }
        })
      }
    })
  }

  getUserInitials(user: User): string {
    return `${user.firstName.charAt(0)}${user.lastName.charAt(0)}`.toUpperCase();
  }

  getRoleLabel(role: number): string {
    const roleLabels: { [key: string]: string } = {
      'ADMIN': 'Administrador',
      'SELLER': 'Vendedor',
    };
    return roleLabels[role];
  }



}
