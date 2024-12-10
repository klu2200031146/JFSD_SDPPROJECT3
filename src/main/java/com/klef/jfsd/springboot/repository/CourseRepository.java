package com.klef.jfsd.springboot.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;


@Repository
public interface CourseRepository extends JpaRepository<Course, Integer>{

	@Query("SELECT c.students FROM Course c WHERE c.id = :courseId")
	List<Student> findStudentsByCourseId(@Param("courseId") int courseId);
	
	


}
