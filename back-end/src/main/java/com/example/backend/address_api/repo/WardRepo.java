package com.example.backend.address_api.repo;

import com.example.backend.address_api.model.Wards;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WardRepo extends JpaRepository<Wards, Long> {
}
