import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SliderAddComponent } from './slider-add.component';

describe('SliderAddComponent', () => {
  let component: SliderAddComponent;
  let fixture: ComponentFixture<SliderAddComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SliderAddComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SliderAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
