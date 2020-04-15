import {AbstractControl} from '@angular/forms';

export class CustomValidator {

  // use_in_dashboard_add_admin_function
  static passwordMatchValidator(control: AbstractControl) {
    const password: string = control.get('password').value;
    const confirmPassword: string = control.get('confirmPassword').value;
    if (password !== confirmPassword) {
      control.get('confirmPassword').setErrors({NoPassswordMatch: true});
    }
    // need_to_fix_01
    // if (password === confirmPassword) {
    //   control.get('confirmPassword').setErrors({NoPassswordMatch: false});
    // }
  }
}
