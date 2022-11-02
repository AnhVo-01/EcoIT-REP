package com.example.backend.service;

import com.example.backend.model.History;
import com.example.backend.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HistoryService {

    @Autowired
    private HistoryRepository repository;

    public History saveVisitorInfo(History history) {
        return repository.save(history);
    }

}