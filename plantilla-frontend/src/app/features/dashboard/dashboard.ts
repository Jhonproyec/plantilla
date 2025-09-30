import { CommonModule } from '@angular/common';
import { AfterViewInit, Component, ElementRef, OnDestroy, OnInit, ViewChild, ChangeDetectorRef } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatIconModule } from '@angular/material/icon';
import { Chart, ChartConfiguration, registerables } from 'chart.js';
import { DashboardService } from '../../core/services/dashboard.service';
import { Subject, takeUntil } from 'rxjs';

Chart.register(...registerables);

interface Kpi {
  title: string;
  value: string | number;
  change: string;
  changeType: 'positive' | 'negative';
  icon: string;
  color: string;
}

@Component({
  selector: 'app-dashboard',
  imports: [CommonModule, MatCardModule, MatIconModule, MatButtonModule],
  templateUrl: './dashboard.html',
  styleUrls: ['./dashboard.css']
})
export class Dashboard implements OnInit, AfterViewInit, OnDestroy {
  @ViewChild('lineChart', { static: false }) lineChartRef!: ElementRef<HTMLCanvasElement>;
  @ViewChild('pieChart', { static: false }) pieChartRef!: ElementRef<HTMLCanvasElement>;
  @ViewChild('barChart', { static: false }) barChartRef!: ElementRef<HTMLCanvasElement>;

  private destroy$ = new Subject<void>();
  charts: Chart[] = [];
  kpis: Kpi[] = [];  
  grafics: any;
  // Estados simples
  isLoading = true;
  hasError = false;

  constructor(
    private dashboardService: DashboardService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    this.loadData();
  }

  ngAfterViewInit(): void {
    // No hacer nada aquí, todo se maneja en loadData
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
    this.charts.forEach(chart => chart?.destroy());
    this.charts = [];
  }

  loadData() {
    this.isLoading = true;
    this.hasError = false;
    this.cdr.detectChanges();
    
    this.dashboardService.getKpi()
      .pipe(takeUntil(this.destroy$))
      .subscribe({
        next: (res: any) => {
          this.kpis = res.kpis;
          this.grafics = res.charts;
          this.isLoading = false;
          this.cdr.detectChanges();
          
          // Esperar 2 ciclos de Angular para que el DOM esté listo
          setTimeout(() => {
            this.setupCharts();
          }, 200);
        },
        error: (err) => {
          console.error('Error:', err);
          this.isLoading = false;
          this.hasError = true;
          this.cdr.detectChanges();
        }
      });
  }

  private setupCharts(): void {
    if (!this.lineChartRef || !this.pieChartRef || !this.barChartRef) {
      console.warn('Canvas elements not ready yet');
      return;
    }

    try {
      // Limpiar gráficos anteriores
      this.charts.forEach(chart => chart?.destroy());
      this.charts = [];
      
      this.createLineChart();
      this.createPieChart();
      this.createBarChart();
      
    } catch (error) {
      console.error('Error creating charts:', error);
    }
  }

  retryLoad() {
    this.loadData();
  }

  private createLineChart(): void {
    const year = new Date().getFullYear();
    const ctx = this.lineChartRef.nativeElement.getContext('2d');
    if (!ctx) return;

    const config: ChartConfiguration<'line'> = {
      type: 'line',
      data: {
        labels: this.grafics.line.labels,
        datasets: [
          {
            label: `Cantidad recaudada ${year}`,
            data: this.grafics.line.data,
            borderColor: '#F27F0C',
            backgroundColor: 'rgba(102, 126, 234, 0.1)',
            borderWidth: 3,
            fill: true,
            tension: 0.4,
            pointBackgroundColor: '#063F5C',
            pointBorderColor: '#ffffff',
            pointBorderWidth: 2,
            pointRadius: 6
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: true,
            position: 'top'
          }
        },
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    this.charts.push(new Chart(ctx, config));
  }

  private createPieChart(): void {
    const ctx = this.pieChartRef.nativeElement.getContext('2d');
    if (!ctx) return;

    const config: ChartConfiguration<'pie'> = {
      type: 'pie',
      data: {
        labels: this.grafics.pie.labels,
        // labels: ['Electrónicos', 'Ropa', 'Hogar', 'Deportes', 'Libros'],
        datasets: [{
          data: this.grafics.pie.data,
          backgroundColor: [
            this.grafics.pie.labels[0] == 'META' ? '#063F5C' : '#F27F0C', 
            this.grafics.pie.labels[1] == 'WHATSAPP' ? '#F27F0C' : '#063F5C'],
          borderWidth: 2,
          borderColor: '#ffffff'
        }]
      },
      options: { 
        responsive: true, 
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom'
          }
        }
      }
    };

    this.charts.push(new Chart(ctx, config));
  }

  private createBarChart(): void {
    const ctx = this.barChartRef.nativeElement.getContext('2d');
    if (!ctx) return;

    const config: ChartConfiguration<'bar'> = {
      type: 'bar',
      data: {
        labels: this.grafics.bar.labels,
        datasets: this.grafics.bar.data,
        // datasets: [
        //   { 
        //     label: 'Pendientes', 
        //     data: [45, 52, 38, 67, 73, 89, 42], 
        //     backgroundColor: '#667eea',
        //     borderRadius: 4
        //   },
        //   { 
        //     label: 'Completados', 
        //     data: [38, 45, 32, 58, 65, 78, 35], 
        //     backgroundColor: '#48bb78',
        //     borderRadius: 4
        //   }
        // ]
      },
      options: { 
        responsive: true, 
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'top'
          }
        },
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    this.charts.push(new Chart(ctx, config));
  }
}