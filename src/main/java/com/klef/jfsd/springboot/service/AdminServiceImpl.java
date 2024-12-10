package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;


@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
    private AdminRepository adminRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseRepository courseRepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd) 
	{
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public List<Student> ViewAllStudents() {
		 return studentRepository.findAll();
	}

	@Override
	public String AddCourse(Course course) {
		courseRepository.save(course);
		return "Course Added Successfully";
	}

	@Override
	public List<Course> getAllCourses() {
		return courseRepository.findAll();
	}

	@Override
	public Course viewCourseByID(int id) {
		return courseRepository.findById(id).orElse(null);
	}

	@Override
	public List<Student> ViewAllStudentsCourses() {
		 return studentRepository.findAllWithCourses();
	}

	@Override
	public Course findCourseById(Integer id) {
		return courseRepository.findById(id).orElse(null);
	}

	@Override
	public List<Student> getStudentsByCourseId(Integer courseId) {
	    List<Student> students = courseRepository.findStudentsByCourseId(courseId);
	    System.out.println("Students for Course ID " + courseId + ": " + students);
	    return students;
	}

	@Transactional
    public void deleteCourseById(int courseId) {
        
        Course course = courseRepository.findById(courseId)
                .orElseThrow(() -> new RuntimeException("Course not found"));

        
        courseRepository.delete(course);
    }
	
	
	
	
}
