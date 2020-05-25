import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PaperAccessComponent } from './paper-access.component';

describe('PaperAccessComponent', () => {
  let component: PaperAccessComponent;
  let fixture: ComponentFixture<PaperAccessComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PaperAccessComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PaperAccessComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
