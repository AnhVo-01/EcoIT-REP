package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Recruit {
    @Id
    @Column(name = "recruit_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(columnDefinition = "text")
    private String description;

    @Column(columnDefinition = "text")
    private String content;

    @Column(columnDefinition = "text")
    private String url;

    private boolean active;

    @OneToOne
    @JoinColumn(name = "image_id")
    private Image thumb;
}
