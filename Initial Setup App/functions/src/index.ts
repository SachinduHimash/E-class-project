import * as functions from 'firebase-functions';
// endPoint
// https://us-central1-e-class-13f92.cloudfunctions.net/helloWorld

export const helloWorld = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
});

import * as express from 'express';
import * as bodyParser from 'body-parser';
import * as cors from 'cors';
import {firestore, TimeStamp} from './config';

const app = express();
app.use(cors({origin: true}));
app.use(bodyParser.json());

app.post('/registration', (req, res) => {
  // res.send(req.body);
  const reqData = req.body;
  const userID = reqData.userID;
  const newClass = (reqData.grade.toString()).concat('.').concat(reqData.class.number);
  const currentDate = new Date();

  firestore.collection('users')
    .doc(userID).get()
    .then(docSnapshot => {
      if (!docSnapshot.exists) {
        firestore.doc(`users/${userID}`)
          .set({
            createdAt: TimeStamp, //initialize_in_config.ts_line22
            fullName: reqData.fullName,
            school: reqData.school,
            address: reqData.address,
            teleNo: reqData.teleNo,
            class: newClass,
            password: reqData.password,
            role: 'student'
          })
          .then(() => {
            firestore.collection('class').doc(newClass).get()
              .then(docSnapshot1 => {
                if (!docSnapshot1.exists) {
                  firestore.collection('class').doc(newClass).set({
                    name: reqData.class.class,
                    // number: +reqData.class.number,
                    // grade: +reqData.grade,
                    number: reqData.class.number,
                    grade: reqData.grade,
                    createdAt: TimeStamp,
                    fees: 1500,
                    type: reqData.class.type
                  }).catch((err) => {
                    res.send({
                      err: err,
                      location: 'add new class'
                    });
                    return;
                  });
                }
              }).then(() => {
                  firestore.collection('class').doc(newClass).collection('students').doc(userID).set({
                    createdAt: TimeStamp,
                    fullName: reqData.fullName,
                    // year: +this.datePipe.transform(new Date(), 'yyyy').toString() + 11 - this.myform.value.grade
                    year: Number(currentDate.getFullYear()) + 11 - Number(reqData.grade)
                  }).catch((err) => {
                      res.send({
                        err: err,
                        location: 'add student to  class'
                      });
                      return;
                  });
              }).catch(err => {
                  res.send({
                    err: err,
                    location: 'class existence'
                  });
                  return;
              });
          }).catch((err) => {
              res.send({
                err: err,
                location: 'add user to users collection'
              });
              return;
          });
      } else {
        res.send({
          err: 'user already exists',
          location: 'user existence'
        });
        return;
      }
    }).catch((err) => {
    res.send({
      err: err,
      location: 'get user'
    });
    return;
  });
});

export const login = functions.https.onRequest(app);
