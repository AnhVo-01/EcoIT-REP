package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Data
public class AboutUs {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "about_id")
    private Long id;

    @Column(columnDefinition = "text")
    private String description;

    @Column(columnDefinition = "text")
    private String content;

    @Column(name = "video_link", columnDefinition = "text")
    private String videoLINK;

    private String phone;

    private String fax;

    private String email;

    private boolean active;

    @OneToMany(mappedBy = "about", cascade = CascadeType.ALL)
    private Collection<Address> address;
}
