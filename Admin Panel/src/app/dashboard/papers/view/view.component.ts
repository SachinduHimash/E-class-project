import {Component, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, FormGroupDirective, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';

// typeDefinition
import {Papers} from '../../interfaces/databaseInterfaces';

import {MathsService} from '../../services/maths.service';
import {NotificationService} from "../../services/notification.service";

@Component({
  selector: 'app-view',
  templateUrl: './view.component.html',
  styleUrls: ['./view.component.css']
})


export class ViewComponent implements OnInit {

  @ViewChild(FormGroupDirective) formGroupDirective: FormGroupDirective;
  // create_form
  updateFormGroup: FormGroup;

  // show_hide_update_form
  showViewForm = false;

  // fetched_paper_data;
  paper;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _math: MathsService,
              private notification: NotificationService) {
  }

  ngOnInit() {
    this.buildViewForm();
  }


  formatPaperNumber = (paperNumber) => {
    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }
    return paperNumber;
  };

  // Update_paper_section
  buildViewForm() {
    this.updateFormGroup = this._fb.group({
      grade: new FormControl('', Validators.required),
      paperNumber: new FormControl('', Validators.required),
    });
  }

  // get_old_paper_data
  getPaper() {

    const formValue = this.updateFormGroup.value;

    // tslint:disable-next-line:max-line-length
    const docPath = `papers/${formValue.grade}/paperNumbers/${(new Date().getFullYear()).toString().concat(this._math.formatPaperNumber(this.updateFormGroup.value.paperNumber))}`;

    this._af.doc(docPath)
      .valueChanges()
      .subscribe((doc: Papers) => {
        if(doc){
          this.paper = doc.questions;
          this.showViewForm = true;
        }else {
          this.notification.NotificationMessage('paper not found');
        }
      });
  }

  closeWindow() {
    this.showViewForm = false;
    setTimeout(() => this.formGroupDirective.resetForm(), 0);
  }
}
