package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
    private CourseRepository courseRepository;
	
	

	@Override
	public String StudentRegistration(Student student) {
		studentRepository.save(student);
		return "Student Registered Successfully......";
	}

	@Override
	public Student checkStudentlogin(String semail, String spwd) {
		return studentRepository.checkStudentlogin(semail,spwd);
	}

	@Override
	public String updatestud(Student a) {
		Student st=studentRepository.findById(a.getId()).get();
		st.setContact(a.getContact());
		st.setDateofbirth(a.getDateofbirth());
		st.setDepartment(a.getDepartment());
		st.setEmail(a.getEmail());
		st.setGender(a.getGender());
		st.setId(a.getId());
		st.setName(a.getName());
		if (a.getEmail() == null) {
	        throw new IllegalArgumentException("Email cannot be null");
	    }
		studentRepository.save(st);
		
		return "Student Updated Successfully";
	}

	@Override
	public List<Course> getAllCourses() {
		return courseRepository.findAll();
	}

	@Override
	public boolean registerStudentForCourse(int studentId, int courseId) {
        Student student = studentRepository.findById(studentId).orElse(null);
        if (student == null) {
            return false;
        }

        
        Course course = courseRepository.findById(courseId).orElse(null);
        if (course == null) {
            return false;
        }

        
        if (!student.getCourses().contains(course)) {
            student.getCourses().add(course);
            studentRepository.save(student); 
            return true;
        }

        return false;
    }

	@Override
	public Student getStudentById(int studentId) {
        return studentRepository.findById(studentId).orElse(null);
    }

	@Override
	public Course getCourseById(int id) {
		return courseRepository.findById(id).orElse(null);
	}
	
    
}
