package com.example.backend.repository;

import com.example.backend.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    @Query("SELECT c FROM Customer c WHERE (c.name LIKE %:kw% OR c.description LIKE %:kw% ) AND c.active = true")
    Page<Customer> search(Pageable pageable, @Param("kw") String keyword);

    @Query("SELECT c FROM Customer c WHERE  c.active = true ORDER BY c.id DESC")
    List<Customer> listAllActive();

    @Query("SELECT c FROM Customer c WHERE  c.active = false")
    List<Customer> listAllDisable();
}
