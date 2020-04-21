import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {AngularFirestore} from '@angular/fire/firestore';

// typeDefinition
import {Papers} from '../interfaces/databaseInterfaces';

import {MathsService} from '../maths.service';

@Component({
  selector: 'app-paper',
  templateUrl: './paper.component.html',
  styleUrls: ['./paper.component.css']
})


export class PaperComponent implements OnInit {


  // create_form
  updateFormGroup: FormGroup;

  // show_hide_update_form
  showViewForm = false;

  // fetched_paper_data;
  paper;

  constructor(private _fb: FormBuilder,
              private _af: AngularFirestore,
              private _math: MathsService) {
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
      .subscribe( (doc: Papers) => {
        this.paper =  doc.questions;
        console.log(this.paper)
        console.log(doc.createdAt)
        console.log(doc.updatedAt)
        this.showViewForm = true;
      });

    this._af.doc(docPath).valueChanges().subscribe(console.log);

  }
}
