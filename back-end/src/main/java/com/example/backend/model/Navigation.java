package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Navigation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nav_id")
    private Long id;

    private String name;

    private String url;

    private Long parentId;

    private boolean active;
}
