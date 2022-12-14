package com.example.backend.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id")
    private Long id;

    private String prefix;

    @Column(columnDefinition = "text")
    private String address;

    private String province;

    private String district;

    private String wards;

    private boolean active;
}
