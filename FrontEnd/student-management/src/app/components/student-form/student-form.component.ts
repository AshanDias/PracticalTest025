import { Component, Input, Output, EventEmitter } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Student } from '../../models/student.model';
import { StudentService } from '../../services/student.service';

@Component({
  selector: 'app-student-form',
  templateUrl: './student-form.component.html',
})
export class StudentFormComponent {
  @Input() student?: Student | null = null;
  @Output() save = new EventEmitter<Student>();
  @Output() update = new EventEmitter<Student>();
  @Output() cancel = new EventEmitter<void>();

  studentForm: FormGroup;
  service: StudentService;

  constructor(private fb: FormBuilder, private studentService: StudentService) {
    this.studentForm = this.fb.group({
      id: [0],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      mobile: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      nic: ['', Validators.required],
      dateOfBirth: ['', Validators.required],
      address: ['', Validators.required],
    });
    this.service = studentService;
  }

  ngOnChanges() {
    if (this.student) {
      this.studentForm.patchValue(this.student);
    } else {
      this.studentForm.reset();
    }
  }

  onSubmit() {
    if (this.studentForm.valid) {
      const studentData: Student = this.studentForm.value;
      if (studentData.id === null || studentData.id === undefined) {
        studentData.id = 0;
        this.studentService.create(studentData).subscribe({
          next: (response) => {
            console.log('Student created successfully', response);
            // Optional: reset form or navigate after success
            this.studentForm.reset();
          },
          error: (error) => {
            console.error('Error creating student', error);
            // Optional: display error message to user
          },
        });
        this.save.emit(this.studentForm.value);
      } else {
        this.studentService.update(studentData).subscribe({
          next: (response) => {
            console.log('Student created successfully', response);
            // Optional: reset form or navigate after success
            this.studentForm.reset();
          },
          error: (error) => {
            console.error('Error creating student', error);
            // Optional: display error message to user
          },
        });
        this.update.emit(studentData);
      }
    }
  }

  addStudent() {}
}
