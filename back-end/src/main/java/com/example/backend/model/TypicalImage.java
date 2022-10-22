package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class TypicalImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String description;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "image_id")
    private Image image;
}
