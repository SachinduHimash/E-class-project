import {Component, OnInit} from '@angular/core';
import {FormGroup, FormControl, FormBuilder, Validators} from '@angular/forms';
import {AngularFireAuth} from '@angular/fire/auth';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  // password_input_field_type
  passwordType = 'password';
  // form
  form: FormGroup;

  constructor(private _fb: FormBuilder,
              private _auth: AngularFireAuth) {
  }

  ngOnInit(): void {
    this.buildForm();
  }

  // build_form
  buildForm() {
    this.form = this._fb.group({
      username: new FormControl('', [Validators.required , Validators.email]),
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
      console.log(this.form.value);
      this._auth
        .signInWithEmailAndPassword(this.form.value.username, this.form.value.password)
        .then((credential) => console.log(credential.user))
        .catch((err) => console.log(err));
    }
  }
}
