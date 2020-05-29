import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewTop10Component } from './view-top10.component';

describe('ViewTop10Component', () => {
  let component: ViewTop10Component;
  let fixture: ComponentFixture<ViewTop10Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewTop10Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewTop10Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
