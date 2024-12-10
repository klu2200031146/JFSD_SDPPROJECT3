package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Feedback;
import com.klef.jfsd.springboot.repository.FeedbackRepository;


@Service
public class FeedbackServiceImpl implements FeedbackService{
	
	@Autowired
    private FeedbackRepository feedbackRepository;
	
	
	@Override
    public void saveFeedback(Feedback feedback) {
        feedbackRepository.save(feedback);
    }


	@Override
	public List<Feedback> getFeedbackByCourseId(int courseId) {
        return feedbackRepository.findByCourseId(courseId);
    }


	@Override
	public List<Feedback> getAllFeedbacks() {
        return feedbackRepository.findAll();
    }
}
