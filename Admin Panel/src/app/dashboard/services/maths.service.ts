import {Injectable} from '@angular/core';


@Injectable({
  providedIn: 'root'
})
export class MathsService {

  constructor() {
  }

  formatPaperNumber = (paperNumber) => {
    if (paperNumber < 10) {
      paperNumber = '0'.concat(paperNumber.toString());
    }
    return paperNumber;
  }

  getFullPaperNumber(paperNumber: any): Number {
    return Number((new Date().getFullYear()).toString().concat(this.formatPaperNumber(paperNumber)));
  }


}
