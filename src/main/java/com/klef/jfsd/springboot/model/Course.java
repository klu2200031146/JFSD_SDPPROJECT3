package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.sql.Blob;
import java.util.Base64;
import java.util.List;

@Entity
@Table(name = "course_table")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "course_id")
    private int id;

    @Column(name = "course_name", nullable = false, length = 100)
    private String name;

    @Column(name = "course_desc", nullable = false, length = 500)
    private String description;

    @Lob
    @Column(name = "course_image", nullable = false)
    private Blob image;

    @Lob
    @Column(name = "course_pdf", nullable = false)
    private Blob pdf;

    @ManyToMany(mappedBy = "courses", cascade = CascadeType.ALL) 
    private List<Student> students;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    public Blob getPdf() {
        return pdf;
    }

    public void setPdf(Blob pdf) {
        this.pdf = pdf;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    @Transient
    public String getBase64Image() {
        try {
            byte[] bytes = image.getBytes(1, (int) image.length());
            return Base64.getEncoder().encodeToString(bytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Transient
    public String getBase64Pdf() {
        try {
            byte[] bytes = pdf.getBytes(1, (int) pdf.length());
            return Base64.getEncoder().encodeToString(bytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
