
package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Feedback;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.FeedbackService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    
    @Autowired
    private FeedbackService feedbackService;
    
   
    @GetMapping("/")
    public String home() {
        return "index";  
    }
    
    @GetMapping("/emailStatus")
    public String emailstatus() {
        return "emailStatus";  
    }

    
    @GetMapping("/home1")
    public String showCourses(Model model) {
        model.addAttribute("courses", studentService.getAllCourses());
        return "home1";  
    }

    
    @PostMapping("/checkStudentlogin")
    public ModelAndView checkStudentlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String smail = request.getParameter("semail");
        String spwd = request.getParameter("spwd");

        Student stud = studentService.checkStudentlogin(smail, spwd);

        if (stud != null) {
            HttpSession session = request.getSession();
            session.setAttribute("student", stud);
            List<Course> courses = studentService.getAllCourses(); 
            mv.addObject("courses", courses);
            mv.setViewName("home1");  
        } else {
            mv.addObject("message", "Invalid email or password. Please try again.");
            mv.setViewName("studloginfail");  
        }

        return mv;
    }

    
    @GetMapping("/loginS")
    public String loginPageS() {
        return "loginPageS"; 
    }

    
    @GetMapping("/signup")
    public String signup() {
        return "signup";  
    }

    
    
    @GetMapping("/profile")
    public String profile() {
        return "profile";  
    }

    
    @GetMapping("/settings")
    public String settings() {
        return "settings";  
    }

    
    @GetMapping("logout")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("student"); 
        ModelAndView mv = new ModelAndView();
        mv.setViewName("loginPageS");  
        return mv;
    }

    
    
    @GetMapping("studentsessionfail")
    public ModelAndView studentSessionFail() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentsessionfail");  
        return mv;
    }

    
    @PostMapping("/update")
    public String update(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        int id = Integer.parseInt(request.getParameter("sid"));
        String name = request.getParameter("sname");
        String gender = request.getParameter("sgender");
        String dob = request.getParameter("sdob");
        String dept = request.getParameter("sdept");
        String email = request.getParameter("semail");
        String contact = request.getParameter("scontact");

        Student s = new Student();
        s.setId(id);
        s.setName(name);
        s.setGender(gender);
        s.setDepartment(dept);
        s.setDateofbirth(dob);
        s.setEmail(email);
        s.setContact(contact);

        String msg = studentService.updatestud(s);

        redirectAttributes.addFlashAttribute("message", msg);

        return "redirect:/settings";  
    }
    @PostMapping("/insertstud")
    public ModelAndView insertstud(HttpServletRequest request) {
        String name = request.getParameter("sname");
        String gender = request.getParameter("sgender");
        String dob = request.getParameter("sdob");
        String dept = request.getParameter("sdepartment");
        String email = request.getParameter("semail");
        String password = request.getParameter("spwd");
        String contact = request.getParameter("scontact");

        Student stud = new Student();
        stud.setName(name);
        stud.setGender(gender);
        stud.setDateofbirth(dob);
        stud.setDepartment(dept);
        stud.setEmail(email);
        stud.setPassword(password);
        stud.setContact(contact);

        ModelAndView mv = new ModelAndView("regsuccess");
        try {
            String msg = studentService.StudentRegistration(stud);
            mv.addObject("message", msg);
        } catch (Exception e) {
            mv.addObject("message", "An error occurred during registration. Please try again.");
        }

        return mv;
    }
    @GetMapping("/dashboard")
    public String getDashboard(HttpSession session, Model model) {
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            return "redirect:/studentsessionfail";
        }

        List<Course> courses = studentService.getAllCourses();
        model.addAttribute("courses", courses);

        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null) {
            model.addAttribute("successMessage", successMessage);
            session.removeAttribute("successMessage");
        }

        return "dashboard";
    }
    
    @PostMapping("/registerCourse")
    public String registerCourse(@RequestParam("courseId") int courseId, HttpSession session, RedirectAttributes redirectAttributes) {
        
        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            
            return "redirect:/login";
        }

        
        boolean isRegistered = studentService.registerStudentForCourse(student.getId(), courseId);

        if (isRegistered) {
            
            redirectAttributes.addFlashAttribute("successMessage", "Course successfully registered!");
            return "redirect:/dashboard";
        } else {
           
            redirectAttributes.addFlashAttribute("errorMessage", "Course registration failed.");
            return "redirect:/dashboard";
        }
    }
    
    @GetMapping("/mycourses")
    public String getCoursesForStudent(Model model, @SessionAttribute("student") Student student) {
        Student loggedInStudent = studentService.getStudentById(student.getId());

        if (loggedInStudent != null) {
            model.addAttribute("registeredCourses", loggedInStudent.getCourses());
        }

        return "mycourses";
    }
    
    @GetMapping("/courses/downloadmaterial")
    public void downloadCourseMaterial(@RequestParam("id") int courseId, HttpServletResponse response) {
        try {
            
            Course course = studentService.getCourseById(courseId);
            if (course == null || course.getPdf() == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Course or material not found.");
                return;
            }

            
            Blob materialBlob = course.getPdf();
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=" + course.getName() + "_Material.pdf");

            
            try (InputStream inputStream = materialBlob.getBinaryStream();
                 OutputStream outputStream = response.getOutputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while processing the file.");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
    
    @GetMapping("/studfeedback")
    public String showFeedbackForm(Model model) {
        List<Course> courses = studentService.getAllCourses(); 
        model.addAttribute("courses", courses);
        return "feedbackform"; 
    }

    
    @PostMapping("/submitFeedback")
    public String submitFeedback(@RequestParam("courseId") int courseId,
                                 @RequestParam("rating") int rating,
                                 @RequestParam("comments") String comments,
                                 RedirectAttributes redirectAttributes) {
      
        Feedback feedback = new Feedback();
        feedback.setCourseId(courseId);
        feedback.setRating(rating);
        feedback.setComments(comments);

    
        feedbackService.saveFeedback(feedback);

        redirectAttributes.addFlashAttribute("message", "Thank you! Your feedback has been submitted.");

        return "redirect:/studfeedback";
    }


}
