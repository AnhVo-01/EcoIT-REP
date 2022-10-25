package com.example.backend.model;

import lombok.Data;
import org.springframework.cache.interceptor.CacheableOperation;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
public class Product {
    @Id
    @Column(name = "product_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String description;

    @Column(columnDefinition = "text")
    private String content;

    private String url;

    private boolean active;

    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "image_id")
    private Image thumb;
}