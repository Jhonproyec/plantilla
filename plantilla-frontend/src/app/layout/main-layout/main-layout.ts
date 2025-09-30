import { CommonModule } from '@angular/common';
import { Component, OnInit, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatToolbarModule } from '@angular/material/toolbar';
import { Sidebar } from '../sidebar/sidebar';
import { Navbar } from '../navbar/navbar';

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [
    CommonModule,
    RouterOutlet,
    MatSidenavModule,
    MatToolbarModule,
    MatButtonModule,
    MatIconModule,
    Sidebar,
    Navbar
  ],
  templateUrl: './main-layout.html',
  styleUrl: './main-layout.css'
})
export class MainLayout implements OnInit {
  isSidebarOpen = signal(true);
  isMobile = signal(false);

  ngOnInit(): void {
    this.checkScreenSize();
    window.addEventListener('resize', () => this.checkScreenSize());
  }

  toggleSidebar():void{
    this.isSidebarOpen.set(!this.isSidebarOpen());
  }

  closeSidebar():void{
    if(this.isMobile()){
      this.isSidebarOpen.set(false);
    }
  }

  private checkScreenSize(): void {
    this.isMobile.set(window.innerWidth < 768);
    if (this.isMobile()) {
      this.isSidebarOpen.set(false);
    }
  }


}
