package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Contacts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contacts_id")
    private Long id;

    private String name;

    private String phone;

    private String email;

    @Column(columnDefinition = "text")
    private String content;

    @Column(length = 1)
    private int status;
}
