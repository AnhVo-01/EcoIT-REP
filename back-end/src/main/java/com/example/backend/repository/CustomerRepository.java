package com.example.backend.repository;

import com.example.backend.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    @Query("SELECT c FROM Customer c WHERE (c.name LIKE %:kw% OR c.description LIKE %:kw% ) AND c.active = true")
    Page<Customer> search(Pageable pageable, @Param("kw") String keyword);

    @Query("SELECT c FROM Customer c WHERE  c.active = true ORDER BY c.id ASC")
    List<Customer> listAllActive();

    @Query("SELECT c FROM Customer c WHERE  c.active = false")
    List<Customer> listAllDisable();

    Customer getCustomerByName(String name);

    @Query(value = "SELECT c.customer_id, active, bgicolor, description, icon, name, url, image_id, cp.product_id FROM customer c " +
            "INNER JOIN customer_product cp ON c.customer_id = cp.customer_id WHERE c.customer_id=:id", nativeQuery = true)
    Optional<Customer> getCustomerUpdate(@Param("id") Long id);
}
