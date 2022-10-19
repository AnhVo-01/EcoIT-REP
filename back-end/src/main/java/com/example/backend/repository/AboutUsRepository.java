package com.example.backend.repository;

import com.example.backend.model.AboutUs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AboutUsRepository extends JpaRepository<AboutUs, Long> {

    @Query (value = "select au.active, au.content, au.description, au.email, au.fax, au.phone, au.video_link, a.address, " +
            "a.district, a.prefix, a.province, a.wards from about_us au " +
            "inner join about_address aa on au.about_id = aa.about_id " +
            "inner join address a on a.address_id = aa.address_id", nativeQuery = true)
    AboutUs getAll();
}
