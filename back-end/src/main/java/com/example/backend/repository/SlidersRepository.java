package com.example.backend.repository;

import com.example.backend.model.Sliders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SlidersRepository extends JpaRepository<Sliders, Long> {

    @Query("SELECT s FROM Sliders s WHERE s.active = 1")
    List<Sliders> getAll();
}
