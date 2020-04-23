import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MarkingsheetComponent } from './markingsheet.component';

describe('MarkingsheetComponent', () => {
  let component: MarkingsheetComponent;
  let fixture: ComponentFixture<MarkingsheetComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MarkingsheetComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MarkingsheetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
