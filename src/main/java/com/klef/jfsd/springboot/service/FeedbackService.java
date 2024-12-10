package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Feedback;

public interface FeedbackService 
{
	public void saveFeedback(Feedback feedback);
	 public List<Feedback> getAllFeedbacks();
	public List<Feedback> getFeedbackByCourseId(int courseId);

}
