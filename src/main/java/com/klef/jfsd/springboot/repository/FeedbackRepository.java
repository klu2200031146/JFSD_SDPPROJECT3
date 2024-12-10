package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Feedback;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {
	List<Feedback> findByCourseId(int courseId);
}
