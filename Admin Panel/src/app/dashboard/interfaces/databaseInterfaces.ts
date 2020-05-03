// Common_interfaces

export interface TimeStamp {
  seconds: Number;
  nanoseconds: Number;
}


// Paper_collection
export interface Papers {
  id: string;
  createdAt: TimeStamp;
  updatedAt: TimeStamp;
  questions: PaperQuestion;
}

export interface PaperQuestion {
  id: string;
  number: Number;
  question: string;
  correctAnswer: Number;
  answer1: string;
  answer2: string;
  answer3: string;
  answer4: string;
  picture: string;
}


// Users_collection
export interface User {
  id: string;
  fullName: string;
  class: string;
  role: string;
  password: string;
  address: string;
  school: string;
  teleNo: string;
  year: number;
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


// class_student_mark
export interface ClassStudentMarks {
  date: string;
  id: string;
  mark: number;
  name: string;
}
