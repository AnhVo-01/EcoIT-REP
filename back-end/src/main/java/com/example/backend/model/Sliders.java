package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Sliders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "slider_id")
    private Long id;

    private String url;

    private String name;

    private String pathFile;

    @Column(name = "path_url")
    private String pathUrl;

    private String type;

    private boolean active;
}
