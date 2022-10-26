package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Blog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "blog_id")
    private Long id;

    private String title;

    @Column(columnDefinition = "text")
    private String description;

    @Column(columnDefinition = "text")
    private String content;

    @Column(name = "created_date")
    private String cDate;

    @OneToOne
    @JoinColumn(name = "image_id")
    private Image thumb;

    private String link;

    private boolean active;
}
