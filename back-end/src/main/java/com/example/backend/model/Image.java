package com.example.backend.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "image_id")
    private Long id;

    @Column(name = "file_name")
    private String name;

    private String pathFile;

    @Column(name = "path_url")
    private String url;

    private String type;

    public Image(String name, String url, String pathFile, String type) {
        this.name = name;
        this.url = url;
        this.pathFile = pathFile;
        this.type = type;
    }
}