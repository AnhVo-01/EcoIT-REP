package com.example.backend.address_api.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
public class Provinces {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "provinces_id")
    private Long id;

    private String name;

    private Long code;

    private String division_type;

    private String codename;

    private int phone_code;
}
