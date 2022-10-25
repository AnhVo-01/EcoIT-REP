package com.example.backend.repository;

import com.example.backend.model.TypicalNumber;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TypicalNumRepository extends JpaRepository<TypicalNumber, Long> {

    @Query("SELECT tn FROM TypicalNumber tn WHERE tn.active = true ORDER BY tn.id ASC")
    List<TypicalNumber> listAll();

    TypicalNumber findTypicalNumberByDescription(String description);
}
