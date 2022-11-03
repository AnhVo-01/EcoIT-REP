package com.example.backend.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Banner {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "banner_id")
    private Long id;

    private String url;

    private String name;

    private String pathFile;

    @Column(name = "path_url")
    private String pathUrl;

    private String type;

    private boolean active;

    public Banner(String name, String url, String pathFile, String type, boolean active) {
        this.name = name;
        this.url = url;
        this.pathFile = pathFile;
        this.type = type;
        this.active = active;
    }
}
