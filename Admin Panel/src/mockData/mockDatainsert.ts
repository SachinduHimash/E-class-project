// insertMarks(){
//   const data = [];
//
//
//   let i;
//   for (i = 1; i < 9; i++) {
//     const number = (i * 7);
//     let date;
//     number > 31 ? date = '2020.05'.concat('.').concat((number % 31).toString()) : date = '2020.04'.concat('.').concat((number % 31).toString());
//
//     const value = {
//       id: '20200'.concat((i).toString()),
//       date: date,
//       name: 'Blondie'
//     };
//     this._af.doc(`class/11.1/students/2020001A/marks/${'20200'.concat((i).toString())}`).set(value).then(console.log).catch(console.log);
//     data.push(value);
//   }
// }

// getRandomInt(min, max) {
//   min = Math.ceil(min);
//   max = Math.floor(max);
//   return Math.floor(Math.random() * (max - min + 1)) + min;
// }
