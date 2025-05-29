import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { StudentListComponent } from './components/student-list/student-list.component';
import { StudentDetailComponent } from './components/student-detail/student-detail.component';
import { RouterModule,Routes  } from '@angular/router';
  
const routes: Routes = [
  { path: 'students', component: StudentListComponent },      // Route to student list
  { path: 'student/:id', component: StudentDetailComponent },  // Route to student detail with param id
  { path: '', redirectTo: 'students', pathMatch: 'full' },    // Default route redirects to students
  { path: '**', redirectTo: 'students' }                       // Wildcard fallback redirects to students
];

@NgModule({
  declarations: [AppComponent, StudentListComponent, StudentDetailComponent],
  imports: [BrowserModule, FormsModule, HttpClientModule,RouterModule.forRoot(routes)],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
