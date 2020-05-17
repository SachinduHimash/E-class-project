// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.

export const environment = {
  production: false,
  firebaseConfig : {
  apiKey: 'AIzaSyCUWdcw3fa3s_kdhEQLK9yolpzE6bkyxbw',
  authDomain: 'e-class-13f92.firebaseapp.com',
  databaseURL: 'https://e-class-13f92.firebaseio.com',
  projectId: 'e-class-13f92',
  storageBucket: 'e-class-13f92.appspot.com',
  messagingSenderId: '116853320881',
  appId: '1:116853320881:web:24d7a8bd216dcb8d6b8690',
  measurementId: 'G-7ND1GP4SJ5'
  },

  // test
  //  firebaseConfig : {
  //    apiKey: 'AIzaSyBDmBFKGp0H4ceIM7NF_cjfDDVOvlBcNjI',
  //    authDomain: 'e-class01.firebaseapp.com',
  //    databaseURL: 'https://e-class01.firebaseio.com',
  //    projectId: 'e-class01',
  //    storageBucket: 'e-class01.appspot.com',
  //    messagingSenderId: '596696754055',
  //  appId: '1:596696754055:web:4f8655185359a841efd522',
  //   measurementId: 'G-1SZBH8M85R'
  // },
  algolia: {
    appId: 'YN75QW69BM',
    apiKey: '3f156ec47c698f662289f9aa70c33cdc',
    indexName: 'test_USER',
    urlSync: false
  }
};
