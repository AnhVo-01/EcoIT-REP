package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "about_address_test")
public class AboutAddress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "about_id")
    private Long aboutID;

    @Column(name = "address_id")
    private Long addressID;

    private int sequence;
}
