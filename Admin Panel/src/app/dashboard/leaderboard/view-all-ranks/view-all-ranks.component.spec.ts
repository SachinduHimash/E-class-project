import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewAllRanksComponent } from './view-all-ranks.component';

describe('ViewAllRanksComponent', () => {
  let component: ViewAllRanksComponent;
  let fixture: ComponentFixture<ViewAllRanksComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewAllRanksComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewAllRanksComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
