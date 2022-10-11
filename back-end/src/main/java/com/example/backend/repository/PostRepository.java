package com.example.backend.repository;

import com.example.backend.model.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {

    @Query("SELECT n FROM Post n WHERE (n.title LIKE %:kw% OR n.description LIKE %:kw% OR n.content LIKE %:kw%) AND n.active = true")
    Page<Post> search(Pageable pageable, @Param("kw") String keyword);

    @Query("SELECT n FROM Post n WHERE n.url=:title")
    Post findByTitle(@Param("title") String title);

    @Query("SELECT n FROM Post n WHERE n.active = true ORDER BY n.id DESC")
    List<Post> listAllById();

    @Query(value = "DELETE FROM post_image WHERE image_id=:id", nativeQuery = true)
    void deleteReferImage(@Param("id") Long id);

}
