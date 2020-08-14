import { Component, OnInit, Input } from '@angular/core';
import { ReactiveFormsModule, FormControl, FormsModule, FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { AngularFirestore } from '@angular/fire/firestore';


@Component({
  selector: 'app-markingsheet',
  templateUrl: './markingsheet.component.html',
  styleUrls: ['./markingsheet.component.css']
})
export class MarkingsheetComponent implements OnInit {

  myForm: FormGroup;
  showViewForm = true;
  toggle;
  paper;
  marks = 0;
  grade: string;
  school: string;
  name: string;
  userID: string;
  classN: string;


  constructor(private fb: FormBuilder, private router: Router, private _af: AngularFirestore,) {
    if (!localStorage.getItem('userID')) {
      router.navigate(['']);
    }
    this.classN = localStorage.getItem('class');
    this.userID = localStorage.getItem('userID');
    this.name = localStorage.getItem('name');
    this.grade = localStorage.getItem('grade');
    this.school = localStorage.getItem('school');
    this.getData();
    

   }

  ngOnInit(): void {
    this.myForm = this.fb.group({

    });
  }
  home(){
    this.router.navigate(['home']);
  }
  async getData(){
    await this._af.collection('paperAccess').doc(this.grade).
      collection('day', ref => ref.orderBy('endTime', 'desc').limit(1))
      .valueChanges()
      .subscribe( async (doc) => {
        if(doc){
          await this._af.collection('class').doc(this.classN).collection('students')
          .doc(this.userID).collection('marks').doc(doc[0]['paper'])
            .valueChanges()
            .subscribe(async (doc1) => {
              
              if(doc1){
                await this._af.collection('papers').doc(this.grade).collection('paperNumbers').doc(doc[0]['paper']).valueChanges()
                  .subscribe((doc2) => {
                    console.log(doc2)
                    this.paper = doc2['questions'];
                    if (doc1['answer']) {
                      this.toggle = doc1['answer'];
                      this.marks = doc1['mark'];
                    } else if (localStorage.getItem('toggleKey') != null) {
                      const retrivedToggle = localStorage.getItem('toggleKey');
                      this.toggle = JSON.parse(retrivedToggle);
                      this.marks = 0;
                      console.log(this.paper);
                      if (this.paper.length === 20) {
                          for (let index = 0; index < this.toggle.length; index++) {
                            if (this.toggle[index] === this.paper[index].correctAnswer) {
                              this.marks += 5;
                            }
                          }
                      } else {
                        for (let index = 0; index < this.toggle.length; index++) {
                          if (this.toggle[index] === this.paper[index].correctAnswer) {
                            this.marks += 2.5;
                          }
                        }
                      }
                    } else {
                      if  (this.paper.length === 20) {
                        this.toggle = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                      } else {
                        // tslint:disable-next-line: max-line-length
                        this.toggle = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                      }
                      this.marks = 0;
                    }

                  });
              } else {
                if (doc['pastPaper']==true) {
                  this.toggle = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                  await this._af.collection('papers').doc(this.grade).collection('paperNumbers').doc(doc[0]['paper']).valueChanges()
                    .subscribe((doc2) => {
                      this.paper = doc2['questions'];
                      if (this.paper.length === 20) {
                        this.toggle = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                      } else {
                        // tslint:disable-next-line: max-line-length
                        this.toggle = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                      }
                    });
                } else {
                  alert('Complete your Paper');
                  this.router.navigate(['home']);
                }
              }

            });
        }
        
      });
    
    // const retrivedToggle = localStorage.getItem('toggleKey');
    // this.toggle = JSON.parse(retrivedToggle);

    // const retrivedPaper = localStorage.getItem('paperKey');
    // this.paper = JSON.parse(retrivedPaper);
    // this.checkMarks();

  }

  isMobileMenu() {
    if (screen.width > 991) {
      return false;
    }
    return true;
  }

  // checkMarks(){
  //   for (let index = 0; index < this.toggle.length; index++) {
  //     if (this.toggle[index] === this.paper[index].correctAnswer){
  //       this.marks += 5;
  //     }
  //   }
  // }

}
