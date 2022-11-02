package com.example.backend.model;

import com.example.backend.constant.EType;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class History {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "history_id")
    private Long id;

    private String executor;

    private String method;

    private String page;

    private String queryString;

    private String date;

}
