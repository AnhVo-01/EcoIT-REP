package com.example.backend.repository;

import com.example.backend.model.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BlogRepository extends JpaRepository<Blog, Long> {
    @Query("SELECT b FROM Blog b WHERE (b.title LIKE %:kw% OR b.description LIKE %:kw%) AND b.active = true")
    Page<Blog> search(Pageable pageable, @Param("kw") String keyword);

    List<Blog> getBlogsByActiveIsTrueOrderByIdDesc();

    Blog getBlogByLink(String link);
}
