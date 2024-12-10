package com.klef.jfsd.springboot.service;


import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;


public interface AdminService {
	public List<Student> ViewAllStudents();
	public Admin checkadminlogin(String uname,String pwd);
	public String AddCourse(Course course);
	public List<Course> getAllCourses();
	public Course viewCourseByID(int id);
	public List<Student> ViewAllStudentsCourses();
	public Course findCourseById(Integer id);
	public List<Student> getStudentsByCourseId(Integer courseId);
    public void deleteCourseById(int courseId);
	
}
