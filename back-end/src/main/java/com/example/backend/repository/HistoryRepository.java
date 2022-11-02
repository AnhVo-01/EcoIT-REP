package com.example.backend.repository;

import com.example.backend.model.History;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HistoryRepository extends JpaRepository<History, Long> {
    List<History> getAllByExecutor(String id);
}
