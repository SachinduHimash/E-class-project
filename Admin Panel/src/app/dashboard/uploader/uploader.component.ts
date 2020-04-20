import {Component, EventEmitter, Input, OnChanges, OnInit, Output , Inject} from '@angular/core';
import {AngularFireStorage, AngularFireUploadTask} from '@angular/fire/storage';
import {AngularFirestore} from '@angular/fire/firestore';
import {Observable} from 'rxjs';
import {finalize} from 'rxjs/operators';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';

@Component({
  selector: 'app-uploader',
  templateUrl: './uploader.component.html',
  styleUrls: ['./uploader.component.css']
})
export class UploaderComponent implements OnInit , OnChanges {


  @Input() uploadPath: string;
  task: AngularFireUploadTask;
  percentage: Observable<number>;
  snapshot: Observable<any>;
  data: any;
  downloadUrl: Observable<String>;
  isHovering: Boolean;
  list: any;
  link = '';
  @Output() linkEvent = new EventEmitter<string>();

  constructor(private _storage: AngularFireStorage,
              private _firestore: AngularFirestore,
              public dialogRef: MatDialogRef<UploaderComponent>,
              @Inject(MAT_DIALOG_DATA) public dataReceive
  ) {
  }

  ngOnInit(): void {
    this.getImages();
    console.log('call me');
    console.log(this.dataReceive);
  }

  ngOnChanges() {
    this.getImages();
  }

  sendLink() {
    this.dialogRef.close();
  }


  toggleHover(event: boolean) {
    this.isHovering = event;
  }

  getImages() {
    // this.firestore.collection('users').snapshotChanges().subscribe(res=>{
    //   this.list = res.map(item=> {
    //     let a = item.payload.doc.data();
    //     console.log(a)
    //     return a
    //   })
    // });
    //
    // var uid = this.auth.userId
    // if(uid){
    //   console.log(uid);
    //   this.firestore.collection('users')
    //     .doc(uid)
    //     .valueChanges()
    //     .subscribe((value) => {
    //       console.log(value);
    //     });
    // }

  }


  generateRandom = () => Math.ceil(Date.now() + Math.random()).toString();

  Upload(event: FileList) {
    console.log(event);
    const file = event.item(0);
    if (file.type.split('/')[0] !== 'image') {
      console.log('unsupported file type');
      return;
    }

    let uploadPath = '';

      if(this.dataReceive.path === 'papers'){
          uploadPath = `papers/${this.dataReceive.grade}/${this.dataReceive.paperNumber}/${file.name.concat(this.generateRandom())}`;
      }


      const ref = this._storage.ref(uploadPath);
      this.task = this._storage.upload(uploadPath, file);
      this.percentage = this.task.percentageChanges();
      this.snapshot = this.task.snapshotChanges().pipe(
        finalize(() => {
          ref.getDownloadURL()
            .subscribe(link => {
                this.dialogRef.close({url: link});
              }
            );

        })
      );


  }

  isActive(snapshot) {
    return snapshot.state === 'running' && snapshot.bytesTransferred < snapshot.totalBytes;
  }
}


