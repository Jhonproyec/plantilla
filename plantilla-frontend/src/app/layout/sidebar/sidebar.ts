import { CommonModule } from '@angular/common';
import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { NavigationEnd, Router } from '@angular/router';
import { AuthService } from '../../core/services/auth.service';
import { filter, firstValueFrom } from 'rxjs';

interface MenuItem {
  label: string;
  icon: string;
  route: string;
  active?: boolean;
}

@Component({
  selector: 'app-sidebar',
  imports: [
    CommonModule,
    MatListModule,
    MatIconModule,
    MatButtonModule,
    MatDividerModule
  ],
  templateUrl: './sidebar.html',
  styleUrls: ['./sidebar.css']
})
export class Sidebar implements OnInit {
  @Output() menuItemSelected = new EventEmitter<void>();

  menuItems: MenuItem[] = [];

  constructor(
    private router: Router,
    private authService: AuthService
  ) {}

  async ngOnInit(): Promise<void> {
    // obtener usuario actual
    const user = await firstValueFrom(this.authService.currentUser$);
    this.filterMenuByRole(user?.role);

    this.updateActiveMenuItem();
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd)
    ).subscribe(() => this.updateActiveMenuItem());
  }

  private filterMenuByRole(role: string | undefined): void {
    if (!role) return;

    if (role === 'ADMIN') {
      this.menuItems = [
        { label: 'Dashboard', icon: 'dashboard', route: '/dashboard' },
        { label: 'Pedidos Pendientes', icon: 'pending_actions', route: '/dashboard/pedidos-pendientes' },
        { label: 'Pedidos Completados', icon: 'check_circle', route: '/dashboard/pedidos-completados' },
        { label: 'Usuarios', icon: 'people', route: '/dashboard/usuarios' }
      ];
    } else if (role === 'SELLER') {
      this.menuItems = [
        { label: 'Pedidos Pendientes', icon: 'pending_actions', route: '/dashboard/pedidos-pendientes' },
        { label: 'Pedidos Completados', icon: 'check_circle', route: '/dashboard/pedidos-completados' }
      ];
    }
  }

  private updateActiveMenuItem(): void {
    const currentUrl = this.router.url;
    this.menuItems.forEach(item => {
      item.active = currentUrl === item.route || 
                    (item.route === '/dashboard' && currentUrl === '/dashboard');
    });
  }

  navigateTo(route: string): void {
    this.router.navigate([route]);
    this.menuItemSelected.emit();
  }

  logout(): void {
    this.authService.logout();
  }
}
