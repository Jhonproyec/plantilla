import { CommonModule } from '@angular/common';
import { Component, importProvidersFrom, Inject, OnInit, signal } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MAT_DIALOG_DATA, MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSelectChange, MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatMomentDateModule } from '@angular/material-moment-adapter';
import { OrderService } from '../../../core/services/order.service';
import { NotificationService } from '../../../core/services/notification.service';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { forkJoin } from 'rxjs';
import moment from 'moment';
import { MatChipInputEvent } from '@angular/material/chips';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { MatChipGrid, MatChipRow, MatChipRemove, MatChipInput } from '@angular/material/chips';

@Component({
  selector: 'app-create-pedido-dialog',
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatButtonModule,
    MatIconModule,
    MatProgressSpinnerModule,
    MatDatepickerModule,
    MatMomentDateModule,
    MatAutocompleteModule,

    MatChipGrid,
    MatChipRow,
    MatChipRemove,
    MatChipInput,
  ],
  standalone: true,
  templateUrl: './create-pedido-dialog.html',
  styleUrl: './create-pedido-dialog.css'
})
export class CreatePedidoDialog implements OnInit {
  isLoading = signal(false);
  today = new Date();
  formOrder: FormGroup;
  departaments: Array<any> = [];
  municipalities: Array<any> = [];
  companies: Array<any> = [];
  orderTags: string[] = [];
  separatorKeysCodes: number[] = [ENTER, COMMA];
  constructor(
    private fb: FormBuilder,
    private dialogRef: MatDialogRef<CreatePedidoDialog>,
    private orderService: OrderService,
    private notificationService: NotificationService,
    @Inject(MAT_DIALOG_DATA) public pedido: any
  ) {
    this.formOrder = this.fb.group({
      idOrder: [''],
      orderDate: ['', Validators.required],
      fullName: ['', Validators.required],
      address: ['', Validators.required],
      idDepartament: ['', Validators.required],
      idMunicipality: ['', Validators.required],
      orderDetails: ['', Validators.required],
      orderType: ['', Validators.required],
      paymentType: ['', Validators.required],
      paymentAmount: [''],
      orderStatus: ['0', Validators.required],
      phone: ['', Validators.required],
      createdBy: ['1', Validators.required],
      idCompany: ['', Validators.required],
      nit: [''],
      phoneTwo: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.formOrder.get('paymentType')?.valueChanges.subscribe(value => {
      const paymentAmountControl = this.formOrder.get('paymentAmount');

      if (value === 'RECIBE_PAGO') {
        paymentAmountControl?.setValidators([Validators.required, Validators.min(1)]);
      } else {
        paymentAmountControl?.clearValidators();
        paymentAmountControl?.reset(); // 👉 limpia el valor al ocultarlo
      }

      paymentAmountControl?.updateValueAndValidity();
    });

    const existingValue = this.formOrder.get('orderDetails')?.value;
    if (existingValue) {
      this.orderTags = existingValue.split(', ').filter((tag: string) => tag.trim());
    }

    forkJoin({
      departaments: this.orderService.getDepartaments(),
      companies: this.orderService.getCompanies()
    }).subscribe({
      next: ({ departaments, companies }) => {
        this.departaments = departaments;
        this.companies = companies;

        if (this.pedido) {
          this.patchFormData(this.pedido);
        }
      }
    });
  }

  getCompanies() {
    this.orderService.getCompanies().subscribe({
      next: (res) => {
        this.companies = res;
      }, error: (error) => {
        console.log("El error", error);
      }
    })
  }

  addTag(event: MatChipInputEvent): void {
    const value = (event.value || '').trim();

    if (value) {
      this.orderTags.push(value);
      this.updateFormControl();
    }

    event.chipInput!.clear();
  }

  removeTag(tag: string): void {
    const index = this.orderTags.indexOf(tag);
    if (index >= 0) {
      this.orderTags.splice(index, 1);
      this.updateFormControl();
    }
  }

  private updateFormControl(): void {
    this.formOrder.get('orderDetails')?.setValue(this.orderTags.join(', '));
  }

  async saveOrder() {
    this.isLoading.set(true);
    if (this.formOrder.valid) {
      const order = this.formOrder.getRawValue()
      const payload = {
        ...order,
        orderDate: order.orderDate
          ? order.orderDate.toISOString()
          : null
      };
      if (this.pedido == null || this.pedido == undefined) {
        this.orderService.saveOrder(payload).subscribe({
          next: (res: any) => {
            this.dialogRef.close(res);
            this.notificationService.showSuccess('Pedido creado correctamente');
            this.isLoading.set(false);
          },
          error: (error) => {
            this.isLoading.set(false);
            this.notificationService.showError("Error al actualizar el pedido")
            console.log("El error", error);
          }
        });
      } else {
        this.orderService.updateOrder(payload).subscribe({
          next: (res: any) => {
            this.isLoading.set(false);
            this.dialogRef.close(res);
            this.notificationService.showSuccess("Pedido creado correctament");
          },
          error: (error) => {
            this.isLoading.set(false);
            this.notificationService.showError("Error al actualizar el pedido")
            console.log("Error", error);
          }
        })
      }
    }
  }

  getDepartaments() {
    this.orderService.getDepartaments().subscribe({
      next: (res: any) => {
        this.departaments = res;
      },
      error: (error) => {
        this.notificationService.showError("Error al obtener los departamentos");
      }
    })
  }

  getMunicipalities(e: MatSelectChange) {
    this.orderService.getMunicipalities(e.value).subscribe({
      next: (res: any) => {
        this.municipalities = res.result;
      }
    })
  }

  onCancel() {
    this.dialogRef.close();
  }

  getFieldError(fieldName: string): string {
    const field = this.formOrder.get(fieldName);
    if (field?.errors && field.touched) {
      if (field.errors['required']) {
        return '*Este campo es requerido';
      }
      if (field.errors['minlength']) {
        const minLength = field.errors['minlength'].requiredLength;
        return `*Debe tener al menos ${minLength} caracteres`;
      }
    }
    return '';
  }


  private patchFormData(pedido: any) {
    this.formOrder.patchValue({
      ...pedido,
      orderDate: moment(pedido.orderDate),
      idDepartament: pedido.municipality.departament.idDepartament.toString(),
      idCompany: pedido.company.idCompany.toString(),
    });
    this.orderTags = pedido.orderDetails;

    this.orderService.getMunicipalities(pedido.municipality.departament.idDepartament).subscribe({
      next: (res: any) => {
        this.municipalities = res.result;
        this.formOrder.patchValue({ idMunicipality: pedido.municipality.idMunicipality.toString() });
      }
    });
  }
}
