package com.example.backend.repository;

import com.example.backend.model.AboutUs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AboutUsRepository extends JpaRepository<AboutUs, Long> {
    @Query("SELECT ab FROM AboutUs ab WHERE ab.active = true")
    AboutUs getAll();
}
