import { Component, Input, OnInit } from '@angular/core';
import { StudentService } from '../../services/student.service';
import { Student } from '../../models/student.model';

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html'
})
export class StudentListComponent implements OnInit {
  students: Student[] = [];
  selectedStudent?: Student;
  showDetails = false;
  searchQuery = '';
  currentIndex = -1;

  constructor(private studentService: StudentService) {}

  ngOnInit(): void {
    this.loadStudents();
  }

  loadStudents() {
    this.studentService.getAll().subscribe(data => {
      this.students = data;
    });
  }

  selectStudent(student: Student, index: number) {
    if (this.selectedStudent?.id === student.id) {
      this.showDetails = !this.showDetails;
    } else {
      this.showDetails = true;
    }
    this.selectedStudent = student;
    this.currentIndex = index;
  }

  nextStudent() {
    if (this.currentIndex < this.students.length - 1) {
      this.selectStudent(this.students[this.currentIndex + 1], this.currentIndex + 1);
    }
  }

  previousStudent() {
    if (this.currentIndex > 0) {
      this.selectStudent(this.students[this.currentIndex - 1], this.currentIndex - 1);
    }
  }

  searchStudents() {
    return this.students.filter(s =>
      Object.values(s).some(val =>
        val?.toString().toLowerCase().includes(this.searchQuery.toLowerCase())
      )
    );
  }
}
