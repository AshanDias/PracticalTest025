import { Component, Input, OnInit } from '@angular/core';
import { StudentService } from '../../services/student.service';
import { Student } from '../../models/student.model';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
})
export class StudentListComponent implements OnInit {
  students: Student[] = [];
  selectedStudent?: Student | undefined;
  showDetails = false;
  searchQuery = '';
  currentIndex = -1;
  showAddForm = false;
  isEditMode = false;
  sortColumn: string = '';
  sortDirection: 'asc' | 'desc' = 'asc';
  constructor(private studentService: StudentService) {}

  ngOnInit(): void {
    this.loadStudents();
  }

  loadStudents() {
    this.studentService.getAll().subscribe((data) => {
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
      this.selectStudent(
        this.students[this.currentIndex + 1],
        this.currentIndex + 1
      );
    }
  }

  previousStudent() {
    if (this.currentIndex > 0) {
      this.selectStudent(
        this.students[this.currentIndex - 1],
        this.currentIndex - 1
      );
    }
  }

  // searchStudents() {
  //   return this.students.filter((s) =>
  //     Object.values(s).some((val) =>
  //       val?.toString().toLowerCase().includes(this.searchQuery.toLowerCase())
  //     )
  //   );
  // }

  searchStudents() {
    let filtered = this.students.filter((student) =>
      Object.values(student).some((val) =>
        val?.toString().toLowerCase().includes(this.searchQuery.toLowerCase())
      )
    );

    if (this.sortColumn) {
      filtered = filtered.sort((a, b) => {
        const valA = a[this.sortColumn as keyof Student];
        const valB = b[this.sortColumn as keyof Student];
        if (valA == null) return 1;
        if (valB == null) return -1;

        let comparison = 0;
        if (typeof valA === 'string' && typeof valB === 'string') {
          comparison = valA.localeCompare(valB);
        } else {
          comparison = valA > valB ? 1 : valA < valB ? -1 : 0;
        }

        return this.sortDirection === 'asc' ? comparison : -comparison;
      });
    }

    return filtered;
  }

  sortData(column: string) {
    if (this.sortColumn === column) {
      // Toggle sort direction
      this.sortDirection = this.sortDirection === 'asc' ? 'desc' : 'asc';
    } else {
      this.sortColumn = column;
      this.sortDirection = 'asc';
    }
  }

  addStudent() {
    this.selectedStudent = undefined;
    this.showAddForm = true;
  }

  cancelAddStudent() {
    this.showAddForm = false;
  }

  saveStudent(student: Student) {
    // Handle create or update here
    this.students.push({ ...student }); // Or call a service
    this.showAddForm = false;
  }

  updateStudent(student: Student) {
    const index = this.students.findIndex((s) => s.id === student.id);
    if (index !== -1) {
      // Update existing student
      this.students[index] = { ...student };
    } else {
      // If student not found, optionally add as new
      this.students.push({ ...student });
    }
    this.showAddForm = false;
  }

  editStudent(student: Student) {
    this.selectedStudent = student;
    this.showDetails = false;
    this.showAddForm = true;
    this.isEditMode = true;
  }

  deleteStudent(student: Student, event: MouseEvent) {
    event.stopPropagation(); // Prevent row click event

    Swal.fire({
      title: 'Are you sure?',
      text: `Do you want to delete ${student.firstName} ${student.lastName}?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'Cancel',
    }).then((result) => {
      if (result.isConfirmed) {
        this.studentService.delete(student.id).subscribe({
          next: (response) => {
            console.log('Student created successfully', response);
            const index = this.students.findIndex((s) => s.id === student.id);
            if (index !== -1) {
              this.students.splice(index, 1);
              if (this.selectedStudent?.id === student.id) {
                this.selectedStudent = undefined;
                this.showDetails = false;
              }
            }

            Swal.fire('Deleted!', 'Student has been deleted.', 'success');
          },
          error: (error) => {
            console.error('Error creating student', error);
          },
        });
      }
    });
  }
}
