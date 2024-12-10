package com.klef.jfsd.springboot.service;




import java.util.List;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;


public interface StudentService {
	public String StudentRegistration(Student student);
	public Student checkStudentlogin(String smail,String spwd);
	public String updatestud(Student a);
	public List<Course> getAllCourses();
	public boolean registerStudentForCourse(int studentId, int courseId);
	public Student getStudentById(int studentId);
	public Course getCourseById(int id);
	
	
}
