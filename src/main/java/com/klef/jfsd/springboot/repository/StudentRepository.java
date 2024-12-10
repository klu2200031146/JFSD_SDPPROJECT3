package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;

@Repository  
public interface StudentRepository extends JpaRepository<Student, Integer>
{
	@Query("select s from Student s  where s.email=?1 and s.password=?2 ")
	public Student checkStudentlogin(String smail,String spwd);
	
	
	 @Query("select s.courses from Student s where s.id = ?1")
	    public List<Course> findCoursesByStudentId(int studentId);
	 
	 
	 @Query("SELECT s FROM Student s JOIN FETCH s.courses")
	    List<Student> findAllWithCourses();
}
