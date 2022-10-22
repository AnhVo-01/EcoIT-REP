package com.example.backend.repository;

import com.example.backend.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p INNER JOIN Image i ON i.id = p.thumb.id " +
            "WHERE (p.name LIKE %:kw% OR p.description LIKE %:kw%) AND p.active = true")
    Page<Product> listAll(Pageable pageable, @Param("kw") String keyword);

    @Query("SELECT p FROM Product p INNER JOIN Image i ON i.id = p.thumb.id " +
            "WHERE p.active = true ORDER BY p.id ASC")
    List<Product> getAll();

    Product getProductByUrl(String url);
}
