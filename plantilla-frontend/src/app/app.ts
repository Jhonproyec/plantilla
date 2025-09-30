import { CommonModule } from '@angular/common';
import { Component, effect, inject, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { AuthService } from './core/services/auth.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, CommonModule],
  template: '<router-outlet></router-outlet>',
  styleUrl: './app.css'
})
export class App {
  private authService = inject(AuthService);
  constructor(){
    this.authService.checkoutStatus();
  }
}
