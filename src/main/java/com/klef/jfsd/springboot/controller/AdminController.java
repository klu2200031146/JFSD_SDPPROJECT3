package com.klef.jfsd.springboot.controller;


import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Feedback;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.FeedbackService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    
    @Autowired
    private FeedbackService feedbackService;
    

    @GetMapping("loginA")
    public ModelAndView loginA() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("loginPageA");
        return mv;
    }
    @GetMapping("logout1")
    public ModelAndView logout1(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("admin"); 
        ModelAndView mv = new ModelAndView();
        mv.setViewName("loginPageA"); 
        return mv;
    }

    @GetMapping("adminsessionfail")
    public ModelAndView adminSessionFail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminsessionfail");
        return mv;
    }


@GetMapping("/dashboard1")
public ModelAndView dashboard1() 
{
  ModelAndView mv = new ModelAndView();
  List<Student> stdlist = adminService.ViewAllStudents();
  mv.setViewName("dashboard1");
  mv.addObject("stdlist", stdlist);
  System.out.println(stdlist);

  return mv;
}
@PostMapping("addCourse")
public ModelAndView addCourse(HttpServletRequest request, 
                              @RequestParam("photo") MultipartFile photoFile,
                              @RequestParam("pdf") MultipartFile pdfFile) {
    String msg = null;
    ModelAndView mv = new ModelAndView();

    try {
        
        String coursename = request.getParameter("coursename");
        String description = request.getParameter("description");

        
        byte[] photoBytes = photoFile.getBytes();
        Blob photoBlob = new javax.sql.rowset.serial.SerialBlob(photoBytes);

        
        byte[] pdfBytes = pdfFile.getBytes();
        Blob pdfBlob = new javax.sql.rowset.serial.SerialBlob(pdfBytes);

        
        Course course = new Course();
        course.setName(coursename);
        course.setDescription(description);
        course.setImage(photoBlob);
        course.setPdf(pdfBlob); 

        
        msg = adminService.AddCourse(course);
        System.out.println(msg);

        
        mv.addObject("message", "Course added successfully!");
        mv.setViewName("dashboard1");

    } catch (Exception e) {
        
        msg = e.getMessage();
        System.out.println(msg);
        mv.addObject("message", "Error adding course: " + msg);
        mv.setViewName("courseerror");
    }

    return mv;
}



    @GetMapping("/profile1")
    public ModelAndView profile1()
    {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("profile1");
    return mv;
    }
    @GetMapping("/settings1")
    public ModelAndView settings1()
    {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("settings1");
    return mv;
    }


    
    @PostMapping("/checkadminlogin")
    public ModelAndView checkAdminLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String auname = request.getParameter("uname");
        String apwd = request.getParameter("pwd");

        Admin adm = adminService.checkadminlogin(auname, apwd);
        if (adm != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", adm); 
            List<Course> courses = adminService.getAllCourses(); 
	        mv.addObject("courses", courses);
            mv.setViewName("home2");
        }
        else {
            mv.setViewName("adminloginfail");
        }
        return mv;
    }
    @GetMapping("/home2")
    public String showCourses(Model model) {
        model.addAttribute("courses",adminService.getAllCourses());
        return "home2";
    }
    @GetMapping("/viewStudents")
    public String viewStudents(Model model) {
        List<Student> students = adminService.ViewAllStudents(); 
        model.addAttribute("students", students); 
        return "studentInformation"; 
    }

    @GetMapping("/courses")
    public ModelAndView getallcourses()
    {
 	   List<Course> courses =adminService.getAllCourses();
 	   
 	   ModelAndView mv = new ModelAndView("courses");
 	   
 	   mv.addObject("courses", courses);
 	   
 	   return mv;
    }

    @GetMapping("courses/displaycourseimage")
    public ResponseEntity<byte[]> displayCourseImage(@RequestParam("id") int id) throws Exception {
        Course course = adminService.viewCourseByID(id); 
        Blob imageBlob = course.getImage(); 
        
        
        InputStream inputStream = imageBlob.getBinaryStream();
        byte[] imageBytes = inputStream.readAllBytes();
        
        return ResponseEntity.ok()
            .contentType(MediaType.IMAGE_JPEG) 
            .body(imageBytes); 
    }
    @GetMapping("/courseDetails")
    public String getCourseDetails(@RequestParam("id") int id, Model model) {
        Course course = adminService.findCourseById(id);
        List<Student> students = adminService.getStudentsByCourseId(id);

        model.addAttribute("course", course);
        model.addAttribute("students", students);
        return "courseDetails";
    }
    
    @PostMapping("/deleteCourse")
    public String deleteCourse(@RequestParam("courseId") int courseId, Model model) {
        try {
            adminService.deleteCourseById(courseId); 
            model.addAttribute("successMessage", "Course deleted successfully");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error deleting course: " + e.getMessage());
        }
        return "courseDetails";  
    }

    @GetMapping("/viewfeedback")
    public String viewFeedbacks(Model model) {
        List<Feedback> feedbackList = feedbackService.getAllFeedbacks();
        model.addAttribute("feedbackList", feedbackList);
        return "viewfeedback";
    }
}
