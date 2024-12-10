package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.util.List;

@Entity
@Table(name="student_table")
public class Student {
   
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY) 
   @Column(name="student_id")
   private int id;

   @Column(name="std_name", nullable=false, length = 50)
   private String name;
   
   @Column(name="std_gender", nullable=false, length = 20)
   private String gender;

   @Column(name="std_dob", nullable=false, length = 20)
   private String dateofbirth;

   @Column(name="std_department", nullable=false, length = 50)
   private String department;

   @NotNull
   @Column(name="std_email", nullable=false, unique = true, length = 50)
   private String email;

   @Column(name="std_password", nullable=false, length = 50)
   private String password;

   @Column(name="std_contact", nullable=false, unique = true, length = 20)
   private String contact;

   // Many-to-Many relationship with Course
   @ManyToMany
   @JoinTable(
       name = "student_courses",
       joinColumns = @JoinColumn(name = "student_id"),
       inverseJoinColumns = @JoinColumn(name = "course_id")
   )
   private List<Course> courses;

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getDateofbirth() {
	return dateofbirth;
}

public void setDateofbirth(String dateofbirth) {
	this.dateofbirth = dateofbirth;
}

public String getDepartment() {
	return department;
}

public void setDepartment(String department) {
	this.department = department;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getContact() {
	return contact;
}

public void setContact(String contact) {
	this.contact = contact;
}

public List<Course> getCourses() {
	return courses;
}

public void setCourses(List<Course> courses) {
	this.courses = courses;
}
@Override
public String toString() {
    return "Student{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", email='" + email + '\'' +
            ", contact='" + contact + '\'' +
            '}';
}


   
}
