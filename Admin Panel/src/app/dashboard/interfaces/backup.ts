import * as firebase from 'firebase';

export interface BackupStructure {
  data: firebase.firestore.DocumentData;
  reference: firebase.firestore.DocumentReference;
  id: string;
}
