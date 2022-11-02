package com.example.backend.controller;

import com.example.backend.model.History;
import com.example.backend.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/history")
@RestController
public class HistoryController {
    @Autowired
    private HistoryRepository historyRepository;

    @GetMapping
    public ResponseEntity<List<History>> listAll(){
        return ResponseEntity.ok(historyRepository.findAll());
    }

    @GetMapping("/{username}")
    public ResponseEntity<List<History>> listAllByUser(@PathVariable String username){
        return ResponseEntity.ok(historyRepository.getAllByExecutor(username));
    }

    @PostMapping("/delete")
    public void removeHistory(@RequestPart("id") Long[] ids){
        historyRepository.deleteAllByIdInBatch(Arrays.asList(ids));
    }

}
