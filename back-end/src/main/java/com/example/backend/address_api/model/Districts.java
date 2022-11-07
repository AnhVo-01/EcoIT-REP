package com.example.backend.address_api.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
public class Districts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "districts_id")
    private Long id;

    private String name;

    private Long code;

    private String division_type;

    private String codename;

    private Long province_code;
}
