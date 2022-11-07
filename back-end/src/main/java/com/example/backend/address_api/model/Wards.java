package com.example.backend.address_api.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Wards {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "wards_id")
    private Long id;

    private String name;

    private Long code;

    private String division_type;

    private String codename;

    private Long district_code;
}
