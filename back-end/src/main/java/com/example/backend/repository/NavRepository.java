package com.example.backend.repository;

import com.example.backend.model.Navigation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NavRepository extends JpaRepository<Navigation, Long> {
    @Query("SELECT n FROM Navigation n WHERE n.name LIKE %:kw% AND n.active = true AND n.parentId IS NULL")
    Page<Navigation> search(Pageable pageable, @Param("kw") String keyword);

    @Query("SELECT n FROM Navigation n WHERE n.active = true AND n.parentId IS NULL")
    List<Navigation> getAllGroup();

    @Query("SELECT n FROM Navigation n WHERE n.active = true AND n.parentId IS NULL ORDER BY n.id ASC")
    List<Navigation> getAll();

    @Query("SELECT nav FROM Navigation nav WHERE nav.active = true AND nav.parentId=:id")
    List<Navigation> listAllChild(@Param("id") Long id);

//    @Query("SELECT child.id AS child_id, " +
//            "child.name AS child_name,  " +
//            "parent.name AS parent_name, " +
//            "parent.id AS parent_id " +
//            "FROM Navigation child JOIN Navigation parent ON child.parentId = parent.id")
//    List<?> listAll();

//    @Query(value = "WITH RECURSIVE generation AS (SELECT nav_id, name, url, parent_id, 0 AS generation_number " +
//            "FROM navigation WHERE parent_id IS NULL " +
//            "UNION ALL " +
//            "SELECT child.nav_id, child.name, child.url, child.parent_id, generation_number+1 AS generation_number " +
//            "FROM navigation child " +
//            "JOIN generation g " +
//            "ON g.nav_id = child.parent_id) " +
//            "SELECT * FROM generation", nativeQuery = true)
//    List<?> listAll();
}
