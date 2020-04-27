import {Injectable} from '@angular/core';
import {MatSnackBar} from '@angular/material';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {

  verticalPosition: 'top'; // 'top' | 'bottom'
  // tslint:disable-next-line:comment-format
  horizontalPosition: 'center'; //'start' | 'center' | 'end' | 'left' | 'right'

  constructor(public snackBar: MatSnackBar) {
  }

  NotificationMessage(message: string) {
    this.snackBar.open(message, 'Close', {
      verticalPosition: 'top',
      horizontalPosition: this.horizontalPosition,
      duration: 2000,
      panelClass: ['blue-snackbar']
    });
  }

  ErrorMessage(message: string) {
    this.snackBar.open(message,  'Close' , {
      verticalPosition: 'top',
      horizontalPosition: this.horizontalPosition,
      duration: 2000,
      panelClass: ['red-snackbar']
    });
  }

}
