
// Common_interfaces

export interface TimeStamp {
    seconds: Number;
    nanoseconds: Number;
  }
  
  
  // Paper_collection
  export interface Papers {
    createdAt: TimeStamp;
    updatedAt: TimeStamp;
    questions: PaperQuestion;
  }
  
  export interface PaperQuestion {
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
    name: String;
    class: String;
    role: String;
  }
  
  