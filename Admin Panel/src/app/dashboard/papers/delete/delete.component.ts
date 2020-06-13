import {Component, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, FormGroupDirective, Validators} from '@angular/forms';
import Swal from 'sweetalert2/dist/sweetalert2.js';
import {AngularFirestore} from '@angular/fire/firestore';
import {BackupStructure} from '../../interfaces/backup';
import {BackupService} from '../../services/backup.service';
import {NotificationService} from '../../services/notification.service';
import * as moment from 'moment';

@Component({
  selector: 'app-delete',
  templateUrl: './delete.component.html',
  styleUrls: ['./delete.component.css']
})
export class DeleteComponent implements OnInit {
  @ViewChild(FormGroupDirective) formGroupDirective: FormGroupDirective;
  formGroup: FormGroup;
  private showUpdateForm = false;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _backup: BackupService,
              private _notification: NotificationService) {
  }

  ngOnInit(): void {
    this.buildForm();
  }


  buildForm() {
    this.formGroup = this._fb.group({
      grade: new FormControl('', Validators.required),
      paperNumber: new FormControl('', Validators.required),
    });
  }

  closeWindow() {
    this.showUpdateForm = false;
    setTimeout(() => this.formGroupDirective.resetForm(), 0);
  }

  formatPaperNumber = (paperNumber) => {
    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }
    return paperNumber;
  };

  async delete() {
    try {


      const action = await Swal.fire({
        title: 'Are you sure?',
        text: 'You will not be able to recover this paper',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, keep it'
      });


      if (action.dismiss === Swal.DismissReason.cancel) {
        Swal.fire(
          'Cancelled',
          'Paper is not delete.',
          'error'
        );
        return;
      }

      // tslint:disable-next-line:max-line-length
      const docRef = `papers/${this.formGroup.value.grade}/paperNumbers/${new Date().getFullYear().toString().concat(this.formatPaperNumber(this.formGroup.value.paperNumber))}`;
      const data = await this._af.firestore.doc(docRef).get();

      if (!data.exists) {
        Swal.fire(
          'Failed!',
          'Paper not exists',
          'error'
        );
        return ;
      }

      const backupObject: BackupStructure = {
        data: data.data(),
        id: data.id,
        reference: data.ref
      };

      const fileName = data.id.toString()
        .concat('-')
        .concat(moment().toISOString());

      const path = `papers/${this.formGroup.value.grade}/${fileName}`;

      const result = await this._backup.backup(backupObject, path);

      await this._af.firestore.doc(docRef).delete();

      if (result.state !== 'success') {
        throw new Error('fail to delete');
      }

      if (action.value) {
        Swal.fire(
          'Deleted!',
          'Your paper has been deleted.',
          'success'
        );
      }

    } catch (error) {
      Swal.fire(
        'Failed!',
        'Fail to delete Plz try again',
        'error'
      );
    }

  }
}
