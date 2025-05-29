import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Student } from '../models/student.model';
import { Observable } from 'rxjs';
import { environment } from '../environment';
@Injectable({ providedIn: 'root' })
export class StudentService {
  
 private baseUrl = `${environment.apiUrl}/students`;
 
  constructor(private http: HttpClient) {}

  getAll(): Observable<Student[]> {
    return this.http.get<Student[]>(this.baseUrl);
  }

  getById(id: number): Observable<Student> {
    return this.http.get<Student>(`${this.baseUrl}/${id}`);
  }

  create(student: Student): Observable<any> {
    return this.http.post(this.baseUrl, student);
  }

  update(student: Student): Observable<any> {
    return this.http.put(`${this.baseUrl}/${student.id}`, student);
  }

  delete(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${id}`);
  }
}
