package com.example.backend.repository;

import com.example.backend.model.Recruit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RecruitRepository extends JpaRepository<Recruit, Long> {
    @Query("SELECT r FROM Recruit r WHERE r.active = true")
    List<Recruit> listAllRecruit();

    Recruit getRecruitByUrl(String url);

    @Query("SELECT r FROM Recruit r WHERE (r.title LIKE %:kw% OR r.description LIKE %:kw%) AND r.active = true")
    Page<Recruit> search(Pageable pageable, @Param("kw") String keyword);
}
