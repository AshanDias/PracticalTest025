import { Component, Input, Output, EventEmitter } from '@angular/core';
import { Student } from '../../models/student.model';

@Component({
  selector: 'app-student-detail',
  templateUrl: './student-detail.component.html'
})
export class StudentDetailComponent {
  @Input() student?: Student;
  @Output() next = new EventEmitter<void>();
  @Output() prev = new EventEmitter<void>();
}
