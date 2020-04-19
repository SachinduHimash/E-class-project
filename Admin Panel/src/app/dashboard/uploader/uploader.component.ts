import {Component, EventEmitter, Input, OnChanges, OnInit, Output} from '@angular/core';
import {AngularFireStorage, AngularFireUploadTask} from '@angular/fire/storage';
import {AngularFirestore} from '@angular/fire/firestore';
import {Observable} from 'rxjs';
import {finalize} from 'rxjs/operators';

@Component({
  selector: 'app-uploader',
  templateUrl: './uploader.component.html',
  styleUrls: ['./uploader.component.css']
})
export class UploaderComponent implements OnInit , OnChanges {


  @Input() uploadPath: string;
  task: AngularFireUploadTask;
  precentage: Observable<number>;
  snapshot: Observable<any>;
  data: any;
  downloadUrl: Observable<String>;
  isHovering: Boolean;
  list: any;
  link = '';
  @Output() linkEvent = new EventEmitter<string>();

  constructor(private _storage: AngularFireStorage,
              private _firestore: AngularFirestore,
  ) {
  }

  ngOnInit(): void {
    this.getImages();
  }

  ngOnChanges() {
    this.getImages();
  }

  sendLink() {
    this.linkEvent.emit(this.link);
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

  Upload(event: FileList) {
    console.log(event);
    const file = event.item(0);
    if (file.type.split('/')[0] !== 'image') {
      // this._message.showWarning('Invalid file type');
      console.log('unspported file type');
      return;
    }
    // const uid = this._auth.userId;
    // const timeStamp = new Date().getTime();
    // if (uid) {
    //   const path = `${this.uploadPath}Pic/${uid}_${timeStamp}`;
      const path = `test/01`;
      const ref = this._storage.ref(path);
      this.task = this._storage.upload(path, file);
      this.precentage = this.task.percentageChanges();
      this.snapshot = this.task.snapshotChanges().pipe(
        finalize(() => {
          ref.getDownloadURL()
            .subscribe(link => {
                this.link = link;
                console.log(this.link);
                // this._message.showSuccess('upload complete');
                this.sendLink();
              }
            );

        })
      );


  }

  isActive(snapshot) {
    return snapshot.state === 'running' && snapshot.bytesTransferred < snapshot.totalBytes;
  }
}


