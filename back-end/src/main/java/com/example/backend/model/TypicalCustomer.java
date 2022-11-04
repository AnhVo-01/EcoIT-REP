package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class TypicalCustomer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String url;

    @OneToOne
    @JoinColumn(name = "image_id")
    private Image image;

    private boolean active;
}
