package com.example.backend.repository;

import com.example.backend.model.AboutUs;
import com.example.backend.payload.AboutAddress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AboutUsRepository extends JpaRepository<AboutUs, Long> {

    @Query ("SELECT ab FROM AboutUs ab WHERE ab.active = true")
    AboutUs getAll();

    @Query(value = "DELETE FROM about_address aa WHERE aa.address_id=:id", nativeQuery = true)
    AboutAddress unlinkAddress(@Param("id") Long id);
}
