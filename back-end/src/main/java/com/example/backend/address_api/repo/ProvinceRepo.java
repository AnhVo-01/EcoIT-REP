package com.example.backend.address_api.repo;

import com.example.backend.address_api.model.Provinces;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProvinceRepo extends JpaRepository<Provinces, Long> {
    Provinces getProvincesByCode(Long code);
}
