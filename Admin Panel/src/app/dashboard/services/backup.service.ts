import {Injectable} from '@angular/core';
import * as firebase from 'firebase';
import 'firebase/storage';
import * as moment from 'moment';

@Injectable({
  providedIn: 'root'
})
export class BackupService {

  constructor() {
  }

  getCircularReplacer = () => {
    const seen = new WeakSet();
    return (key, value) => {
      if (typeof value === 'object' && value !== null) {
        if (seen.has(value)) {
          return;
        }
        seen.add(value);
      }
      return value;
    };
  }

  async backup(jsonObject, path) {
    try {

      const jsonString = JSON.stringify(jsonObject, this.getCircularReplacer());

      const fullPath = `deleteBackup/`.concat(path.toString());

      const blob = new Blob([jsonString], {type: 'application/json'});

      const storageRef = firebase.storage().ref();
      const fileRef = storageRef.child(fullPath);

      return await fileRef.put(blob);
    } catch (error) {
      throw error;
    }
  }
}
