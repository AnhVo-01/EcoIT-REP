package com.example.backend.repository;

import com.example.backend.model.TypicalCustomer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TypicalCusRepository extends JpaRepository<TypicalCustomer, Long> {

    Page<TypicalCustomer> getAllByActiveIsTrue(Pageable pageable);

    List<TypicalCustomer> getAllByActiveIsTrue();

    TypicalCustomer getTypicalCustomerByUrl(String url);
}
