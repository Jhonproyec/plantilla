import { CommonModule } from '@angular/common';
import { Component, Inject, OnInit, signal } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSelectModule } from '@angular/material/select';
import { UserService } from '../../../core/services/user.service';
import { CreateUserRequest } from '../../../core/models/user.model';

@Component({
  selector: 'app-create-user-dialog',
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatButtonModule,
    MatIconModule,
    MatProgressSpinnerModule
  ],
  templateUrl: './create-user-dialog.html',
  styleUrl: './create-user-dialog.css'
})
export class CreateUserDialog implements OnInit {
  createUserForm: FormGroup;
  isLoading = signal(false);
  error = signal<string>('');
  hidePassword = signal(true);

  roles = [
    { value: 'ADMIN', label: 'Administrador' },
    { value: 'SELLER', label: 'Vendedor' }
  ];

  constructor(
    private fb: FormBuilder,
    private userService: UserService,
    private dialogRef: MatDialogRef<CreateUserDialog>,
    @Inject(MAT_DIALOG_DATA) public user: any
  ) {
    this.createUserForm = this.fb.group({
      userId: [''],
      firstName: ['', [Validators.required, Validators.minLength(2)]],
      lastName: ['', [Validators.required, Validators.minLength(2)]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(8)]],
      repeatPassword: ['', [Validators.required, Validators.minLength(8)]],
      role: ['', [Validators.required]]
    });
  }
  ngOnInit(): void {
    if(this.user != null || this.user != undefined){
      this.setForm();
    }
  }

  onSubmit(): void {
    if (this.createUserForm.valid) {

      const userData: CreateUserRequest = this.createUserForm.value;
      if (this.user == null || this.user == undefined) {
        if (this.validatePassword()) {
          this.isLoading.set(true);
          this.error.set('');

          this.userService.createUser(userData).subscribe({
            next: (user) => {
              this.isLoading.set(false);
              this.dialogRef.close(user);
            },
            error: (error) => {
              this.isLoading.set(false);
              if (error.error.details) {
                error.error.details.forEach((e: any) => {
                  this.error.set(e.message);
                })
              } else {
                this.error.set(error.error.message);
              }
            }
          });
        } else {
          this.isLoading.set(false);
          this.error.set("Las contraseñas ingresadas no coinciden");
        }
      } else {
        this.userService.updateUser(userData).subscribe({
          next: (user) => {
            this.isLoading.set(false);
            this.dialogRef.close(user);
          },
          error: (error) => {
            this.isLoading.set(false);
            if (error.error.details) {
              error.error.details.forEach((e: any) => {
                this.error.set(e.message);
              })
            } else {
              this.error.set(error.error.message);
            }
          }
        });
      }




    }
  }

  validatePassword(): boolean {
    const password = this.createUserForm.get('password')?.value;
    const repeatPassword = this.createUserForm.get('repeatPassword')?.value;
    return password === repeatPassword
  }

  onCancel(): void {
    this.dialogRef.close();
  }

  togglePasswordVisibility(): void {
    this.hidePassword.set(!this.hidePassword());
  }

  getFieldError(fieldName: string): string {
    const field = this.createUserForm.get(fieldName);
    if (field?.errors && field.touched) {
      if (field.errors['required']) {
        return '*Este campo es requerido';
      }
      if (field.errors['email']) {
        return '*Ingresa un email válido';
      }
      if (field.errors['minlength']) {
        const minLength = field.errors['minlength'].requiredLength;
        return `*Debe tener al menos ${minLength} caracteres`;
      }
    }
    return '';
  }

  setForm() {
    this.createUserForm.patchValue({
      ...this.user,
      userId: this.user.idUser
    });
    this.createUserForm.get('password')?.clearValidators();
    this.createUserForm.get('password')?.updateValueAndValidity();

    this.createUserForm.get('repeatPassword')?.clearValidators();
    this.createUserForm.get('repeatPassword')?.updateValueAndValidity();
  }


}
