import * as functions from 'firebase-functions';

export const helloWorld = functions.https.onRequest((request, response) => {
  response.json("Hello from Firebase!");
});

import * as express from 'express';
import * as bodyParser from 'body-parser';
import * as cors from 'cors';
import {firestore, TimeStamp} from './config';

const app = express();
app.use(cors({origin: true}));
app.use(bodyParser.json());

// endPoint Original
// https://us-central1-e-class-13f92.cloudfunctions.net/login/registration

// function_deploy_link_of_test_database
// https://us-central1-e-class01.cloudfunctions.net/login/registration

app.post('/registration', (req, res) => {
  // res.json(req.body);
  const reqData = req.body.data;
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
                    res.json(
                      {
                        data: {
                          err: err,
                          location: 'add new class'
                        }
                      }
                    );
                    return;
                  });
                }
              }).then(() => {
              firestore.collection('class').doc(newClass).collection('students').doc(userID).set({
                createdAt: TimeStamp,
                fullName: reqData.fullName,
                // year: +this.datePipe.transform(new Date(), 'yyyy').toString() + 11 - this.myform.value.grade
                year: Number(currentDate.getFullYear()) + 11 - Number(reqData.grade)
              }).then(() => {
                res.json(
                  {
                    data:{
                      msg: 'success'
                    }
                });
                return;
              }).catch((err) => {
                res.json(
                  {
                    data:{
                      err: err,
                      location: 'add student to  class'
                    }
                });
                return;
              });
            }).catch(err => {
              res.json(
                {
                  data:{
                    err: err,
                    location: 'class existence'
                  }
              });
              return;
            });
          }).catch((err) => {
            res.json(
              {
                data:{
                  err: err,
                  location: 'add user to users collection'
                }
          });
          return;
        });
      } else {
        res.json(
          {
            data:{
              err: 'user already exists',
              location: 'user existence'
            }
        });
        return;
      }
    }).catch((err) => {
      res.json(
        {
          data:{
            err: err,
            location: 'get user'
          }
    });
    return;
  });
});


function formatPaperNumber(paperNumber: Number) {

  let num = paperNumber;

  if (paperNumber < 10) {
    num = Number('0'.concat(paperNumber.toString()));
  }
  return num.toString();
}


app.post('/marks', (req, res) => {
  // res.json(req.body);
  const reqData = req.body.data;
  const userID = reqData.userID;
  const currentDate = new Date();
  const date = currentDate.getFullYear().toString().concat('.')
    .concat(currentDate.getMonth().toString()).concat('.')
    .concat(currentDate.getDate().toString());

  const fullPaperNumber = (new Date().getFullYear()).toString().concat(formatPaperNumber(reqData.paperNumber));


  firestore.collection('class').doc(reqData.class)
    .collection('students').doc(userID)
    .collection('marks').doc(fullPaperNumber)
    .set({
      createdAt: TimeStamp,
      mark: reqData.marks,
      // date: this.datePipe.transform(new Date(), 'yyyy.MM.dd'),
      date: date,
      name: reqData.name,
    }).catch((err) => {
      res.json(
        {
          data:{
            err: err,
            location: 'marks add to class/student/marks'
          }
    });
    return;
  });
  firestore.collection('marks').doc(reqData.grade).get().then(docSnapshot => {

    if (!docSnapshot.exists) {
      firestore.collection('marks').doc(reqData.grade)
        .set({}, { merge: true })
        .catch((err) => {
          res.json(
            {
              data:{
                err: err,
                location: 'check marks/grade existence'
              }
          });
          return;
        });

    }

  }).then(() => {
    firestore.collection('marks').doc(reqData.grade).collection('paperNumbers').doc().get()
      .then(docSnapshot => {

        if (!docSnapshot.exists) {
          firestore.collection('marks').doc(reqData.grade).collection('paperNumbers')
            .doc(fullPaperNumber)
            .set({
              date: date
            })
            .catch((err) => {
              res.json(
                {
                  data:{
                    err: err,
                    location: 'check marks/paperNumber existence'
                  }
              });
              return;
            });
        }

      }).then(() => {
        firestore.collection('marks').doc(reqData.grade).collection('paperNumbers')
          .doc(fullPaperNumber).collection('students')
          .doc(userID)
          .set({
            createdAt: TimeStamp,
            mark: reqData.marks,
            date: date,
            name: reqData.name
          }).catch((err) => {
            res.json(
              {
                data:{
                  err: err,
                  location: 'check marks paperNumber user marks add'
                }
            });
            return;
          });
      }).then(() => {
        res.json(
          {
            data:{
              msg: 'success, try block'
            }
        })
      }).catch((err) => {
        res.json(
          {
            data:{
              err: err,
              location: 'check marks reqData grade paperNumber'
            }
        });
        return;
      });
  }).catch((err) => {
    res.json(
      {
        data:{
          err: err,
          location: 'check marks grade existence'
        }
    });
    return;
  });




});


export const login = functions.https.onRequest(app);
