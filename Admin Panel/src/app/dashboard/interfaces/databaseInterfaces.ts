
// Common_interfaces

export interface TimeStamp {
  seconds: Number;
  nanoseconds: Number;
}


// Paper_collection
export interface Papers {
  id: String;
  createdAt: TimeStamp;
  updatedAt: TimeStamp;
  questions: PaperQuestion;
}

export interface PaperQuestion {
  id: String;
  number: Number;
  question: String;
  correctAnswer: Number;
  answer1: String;
  answer2: String;
  answer3: String;
  answer4: String;
  picture: String;
}


// Users_collection
export interface Users {
  id: String;
  fullName: String;
  class: String;
  role: String;
  password: String;
  address: String;
  school: String;
  teleNo: String;
}

// Class_collection
export interface Class {
  id: string;
  createdAt: TimeStamp;
  fees: Number;
  grade: Number;
  name: string;
  number: Number;
  type: string;
}
