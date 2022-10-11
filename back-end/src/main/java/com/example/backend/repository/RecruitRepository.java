package com.example.backend.repository;

import com.example.backend.model.Recruit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RecruitRepository extends JpaRepository<Recruit, Long> {
    @Query("SELECT r FROM Recruit r WHERE r.active = true")
    List<Recruit> listAllRecruit();
}
