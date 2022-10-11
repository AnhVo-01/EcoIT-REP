package com.example.backend.repository;

import com.example.backend.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Long> {
    @Modifying
    @Transactional
    @Query("UPDATE Image SET name=:name, url=:url, pathFile=:pathFile, type=:type WHERE id=:id")
    void saveById(@Param("name") String name,
                  @Param("url") String url,
                  @Param("pathFile") String pathFile,
                  @Param("type") String type,
                  @Param("id") Long id);

    @Query("SELECT n FROM Post n JOIN Image im WHERE n.id =:id")
    List<Image> getImg(@Param("id") Long id);
}
