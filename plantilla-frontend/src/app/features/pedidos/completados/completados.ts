import { ChangeDetectorRef, Component, NgZone, OnInit, signal } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { OrderService } from '../../../core/services/order.service';
import { MatPaginatorModule, PageEvent } from '@angular/material/paginator';
import { CommonModule } from '@angular/common';
import { MatInputModule } from "@angular/material/input";
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { debounceTime, distinctUntilChanged } from 'rxjs';

@Component({
  selector: 'app-completados',
  imports: [
    CommonModule,
    MatIconModule,
    MatButtonModule,
    MatCardModule,
    MatProgressSpinnerModule,
    MatTableModule,
    MatMenuModule,
    MatPaginatorModule,
    MatInputModule,
    ReactiveFormsModule
  ],
  templateUrl: './completados.html',
  styleUrl: './completados.css'
})
export class Completados implements OnInit {
  displayedColumns: string[] = ['date', 'origin', 'company', 'name', 'address', 'details', 'payment', 'total', 'actions'];
  dataSource = new MatTableDataSource<any>([]);
  totalOrders = 0;
  pageSize = 10;
  pageIndex = 0;
  orderStatus = 1;

  // Variables para el modal
  showTicketModal = false;
  ticketImage = '';
  ticketFilename = '';
  isGeneratingTicket = false;

  // Control para el buscador
  searchControl = new FormControl('');
  currentSearchTerm = '';


  constructor(
    private orderService: OrderService,
    private cdr: ChangeDetectorRef,
    private zone: NgZone
  ) { }

  ngOnInit(): void {
    this.loadOrders();
    this.setupSearch();
  }

  setupSearch(): void {
    this.searchControl.valueChanges.pipe(
      debounceTime(450), // Espera 300ms después de que el usuario deje de escribir
      distinctUntilChanged() // Solo procesa si el valor cambió
    ).subscribe(searchTerm => {
      this.currentSearchTerm = searchTerm || '';
      this.pageIndex = 0; // Resetear a la primera página al buscar
      this.loadOrders(1, this.pageSize);
    });
  }

  loadOrders(page: number = 1, limit: number = this.pageSize) {
    this.orderService.getAllOrders(page, limit, this.orderStatus, this.currentSearchTerm).subscribe(res => {
      if (res.success) {
        this.dataSource.data = res.data.orders;
        this.totalOrders = res.data.total;
      }
    });
  }

  onPageChange(event: PageEvent) {
    this.pageIndex = event.pageIndex;
    this.pageSize = event.pageSize;
    this.loadOrders(this.pageIndex + 1, this.pageSize);
  }

  // Método para limpiar la búsqueda
  clearSearch(): void {
    this.searchControl.setValue('');
  }



  generateTicket(idOrder: number) {
    this.isGeneratingTicket = true;
    this.cdr.detectChanges();

    this.orderService.generateTicket(idOrder).subscribe({
      next: (response: any) => {
        this.isGeneratingTicket = false;
        this.cdr.detectChanges();

        if (response?.success && response?.imageBase64) {
          this.zone.run(() => {
            // Esto fuerza que Angular detecte cambios en otro ciclo
            this.ticketImage = response.imageBase64;
            this.ticketFilename = response.filename || `ticket_${Date.now()}.png`;
            this.showTicketModal = true;
            this.cdr.detectChanges();
          });
        } else {
          alert('Error al generar el ticket: ' + (response?.error || 'Datos incompletos'));
        }
      },
      error: (error) => {
        this.isGeneratingTicket = false;
        this.cdr.detectChanges();
        alert('Error al conectar con el servidor: ' + error.message);
      }
    });
  }

  // Cerrar modal de ticket
  closeModal(event?: Event) {
    if (!event || event.target === event.currentTarget) {
      this.showTicketModal = false;
      this.ticketImage = '';
      this.ticketFilename = '';
      this.cdr.detectChanges(); // actualizar vista
    }
  }

  // Imprimir ticket
  printTicket() {
  if (!this.ticketImage) return;

  const printWindow = window.open('', '_blank', 'width=600,height=800');
  if (!printWindow) return alert('No se pudo abrir la ventana de impresión');

  printWindow.document.write(`
    <!DOCTYPE html>
    <html>
      <head>
        <title>Imprimir Ticket</title>
        <style>
          @page { size: auto; margin: 0; } /* elimina márgenes de página */
          body { margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; }
          .ticket-container { text-align: center; }
          .ticket-image {
            width: 100%; /* ancho máximo disponible */
            max-width: 440px; /* opcional, ancho real de tu ticket */
            height: auto; 
            page-break-inside: avoid; /* evita que se corte en dos páginas */
          }
        </style>
      </head>
      <body>
        <div class="ticket-container">
          <img src="${this.ticketImage}" alt="Ticket" class="ticket-image">
        </div>
        <script>
          window.onload = function() {
            setTimeout(() => window.print(), 500);
          };
          window.onafterprint = function() { window.close(); };
        </script>
      </body>
    </html>
  `);

  printWindow.document.close();
}


  // Descargar ticket
  downloadTicket() {
    if (!this.ticketImage) return;

    const link = document.createElement('a');
    link.href = this.ticketImage;
    link.download = this.ticketFilename;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }


}
