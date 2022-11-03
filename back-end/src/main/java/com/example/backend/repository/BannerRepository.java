package com.example.backend.repository;

import com.example.backend.model.Banner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface BannerRepository extends JpaRepository<Banner, Long> {
    @Modifying
    @Transactional
    @Query("UPDATE Banner SET name=:name, url=:url, pathFile=:pathFile, type=:type, active = true WHERE id=:id")
    void saveById(@Param("name") String name,
                  @Param("url") String url,
                  @Param("pathFile") String pathFile,
                  @Param("type") String type,
                  @Param("id") Long id);
}
