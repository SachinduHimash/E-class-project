import { TestBed } from '@angular/core/testing';

import { MathsService } from './maths.service';

describe('MathsService', () => {
  let service: MathsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MathsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
