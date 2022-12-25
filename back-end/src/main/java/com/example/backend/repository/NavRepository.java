package com.example.backend.repository;

import com.example.backend.model.Navigation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

public interface NavRepository extends JpaRepository<Navigation, Long> {
    @Query("SELECT n FROM Navigation n WHERE n.name LIKE %:kw% AND n.active = true AND n.parentId IS NULL")
    Page<Navigation> search(Pageable pageable, @Param("kw") String keyword);

    @Query("SELECT n FROM Navigation n WHERE n.active = true AND n.parentId IS NULL")
    List<Navigation> getAllGroup();

    @Query("SELECT n FROM Navigation n WHERE n.active = true AND n.parentId IS NULL ORDER BY n.id ASC")
    List<Navigation> getAll();

    @Query("SELECT nav FROM Navigation nav WHERE nav.active = true AND nav.parentId=:id ORDER BY nav.id ASC")
    List<Navigation> getChild(@Param("id") Long id);

    @Modifying
    @Transactional
    @Query("UPDATE Navigation nav SET nav.active = FALSE WHERE nav.id in (:list)")
    void deleteAll(@Param("list") Long[] list);
}
