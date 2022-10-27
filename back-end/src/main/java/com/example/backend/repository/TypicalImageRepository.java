package com.example.backend.repository;

import com.example.backend.model.TypicalImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TypicalImageRepository extends JpaRepository<TypicalImage, Long> {
    List<TypicalImage> getAllByActiveIsTrue();

    @Override
    Page<TypicalImage> findAll(Pageable pageable);

    Optional<TypicalImage> getTypicalImageByImage_Id(Long id);
}
