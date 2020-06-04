import {Injectable} from '@angular/core';
import {MathsService} from './maths.service';
import {AngularFirestore} from '@angular/fire/firestore';
import {NotificationService} from './notification.service';
import * as firebase from 'firebase';

@Injectable({
  providedIn: 'root'
})
export class RankingService {

  constructor(private _math: MathsService,
              private _af: AngularFirestore,
              private _notification: NotificationService) {
  }

  calculateRanking(students: any[]) {
    let rank = 1;
    let skipper = 0;

    students[0].rank = 1;

    for (let i = 1; i < students.length; i++) {
      skipper++;
      if (students[i - 1].mark === students[i].mark) {
        students[i].rank = rank;
      } else {
        rank += skipper;
        students[i].rank = rank;
        skipper = 0;
      }
    }
    return students;
  }

  async checkPaperExists(grade: Number, paperNumber: Number): Promise<boolean> {
    const documentPath = `papers/${grade}/paperNumbers/${paperNumber}`;
    return (await this._af.firestore.doc(documentPath).get()).exists;
  }

  async checkGradeRankExists(grade: Number, paperNumber: Number): Promise<boolean> {
    const documentPath = `ranking/${grade}/rank/${paperNumber}`;
    return (await this._af.firestore.doc(documentPath).get()).exists;
  }

  async generateRanking(grade: Number, paperNumber: Number) {

    paperNumber = await this._math.getFullPaperNumber(paperNumber);
    const collectionPath = `marks/${grade}/paperNumbers/${paperNumber}/students`;
    const paperExists = await this.checkPaperExists(grade, paperNumber);

    if (!paperExists) {
      throw {err: 'Paper not found'};
    }

    const marksDataRef = await this._af.firestore.collection(collectionPath)
      .orderBy('mark', 'desc')
      .get();

    if (marksDataRef.docs.length <= 0) {
      throw {err: 'Student data not found for paper'};
    }

    const marksData = marksDataRef.docs.map(r => {
      return {
        ...r.data(),
        id: r.id
      };
    });

    const rankedStudent = await this.calculateRanking(marksData);

    const gradeRankExists = await this.checkGradeRankExists(grade, paperNumber);

    if (!gradeRankExists) {
      this._af.firestore.doc(`ranking/${grade}`).set({
        createdAt: firebase.firestore.FieldValue.serverTimestamp()
      });
    }

    await this._af.firestore.doc(`ranking/${grade}/rank/${paperNumber}`)
      .set({
        grade,
        paper: paperNumber,
        createdAt: firebase.firestore.FieldValue.serverTimestamp(),
        rank: rankedStudent
      });

    // console.log(rankedStudent);
    return rankedStudent;

  }

  async getStudent(grade: Number, paperNumber: Number) {

    paperNumber = await this._math.getFullPaperNumber(paperNumber);
    const documentPath = `ranking/${grade}/rank/${paperNumber}`;

    const paperExists = await this.checkPaperExists(grade, paperNumber);

    if (!paperExists) {
      throw {err: 'Paper not found'};
    }

    const ranking = await this._af.firestore.doc(documentPath).get();

    if (!ranking.exists) {
      throw {err: 'Ranking data not generated please generate ranking'};
    }

    return ranking.data();

  }

}
