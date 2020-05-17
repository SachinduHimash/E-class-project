import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFireAuth} from '@angular/fire/auth';
import {MatSnackBar} from '@angular/material';
import {Router} from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  verticalPosition: 'top'; // 'top' | 'bottom'
  // tslint:disable-next-line:comment-format
  horizontalPosition: 'center'; //'start' | 'center' | 'end' | 'left' | 'right'
  // password_input_field_type
  passwordType = 'password';
  // form
  form: FormGroup;

  constructor(private _fb: FormBuilder,
              private _auth: AngularFireAuth,
              public snackBar: MatSnackBar,
              private _router: Router) {
  }

  ngOnInit(): void {
    this.buildForm();
  }

  // build_form
  buildForm() {
    this.form = this._fb.group({
      username: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', Validators.required),
    });
  }

  // change_password_input_field_type
  showPassword() {
    this.passwordType === 'text' ? this.passwordType = 'password' : this.passwordType = 'text';
  }

  // submit_form_value
  submit() {
    if (this.form.valid) {

      this._auth
        .signInWithEmailAndPassword(this.form.value.username, this.form.value.password)
        .then((credential) => {
          // console.log(this.form.value);
          this._router.navigate(['']);
        })
        .catch((err) => {
          console.log(err);
          if (err.code === 'auth/wrong-password') {
            this.snackBar.open('invalid user email or password', 'Close', {
              verticalPosition: 'top',
              horizontalPosition: this.horizontalPosition,
              duration: 2000,
              panelClass: ['blue-snackbar']
            });
          }
          if (err.code === 'auth/user-not-found')   {
            console.log('user not found');
            this.snackBar.open('no user details found for this email', 'Close', {
              verticalPosition: 'top',
              horizontalPosition: this.horizontalPosition,
              duration: 2000,
              panelClass: ['blue-snackbar']
            });
          }
        });
    }
  }
}
