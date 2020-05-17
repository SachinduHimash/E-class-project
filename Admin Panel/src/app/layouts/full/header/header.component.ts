import {Component, OnInit} from '@angular/core';
import {AngularFireAuth} from '@angular/fire/auth';
import {Router} from '@angular/router';
import {AngularFirestore} from '@angular/fire/firestore';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: []
})
export class AppHeaderComponent implements OnInit {

  dp;

  constructor(private _auth: AngularFireAuth,
              private _router: Router,
              private _af: AngularFirestore) {
  }

  ngOnInit(): void {
    // this._auth.currentUser.then(user => {
    //   if (user) {
    //     console.log(user);
    //     this._af.collection('users')
    //       .doc(user.uid)
    //       .valueChanges()
    //       .subscribe(r => {
    //         // @ts-ignore
    //         this.dp = r.dp;
    //         console.log(r);
    //       });
    //   }
    // });
  }

  signOut() {
    this._auth.signOut().then(r => {
      this._router.navigate(['/login']);
    });
  }
}
