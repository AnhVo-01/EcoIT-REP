package com.example.backend.address_api.repo;

import com.example.backend.address_api.model.Districts;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DistrictRepo extends JpaRepository<Districts, Long> {
    Districts getDistrictsByCode(Long code);
}
