package com.example.backend.controller;

import com.example.backend.model.Blog;
import com.example.backend.model.History;
import com.example.backend.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

    @GetMapping("/search")
    public Page<History> sort(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                              @RequestParam(name = "pageSize", defaultValue = "10") int pageSize,
                              @RequestParam(name = "sortField", defaultValue = "id") String sortField,
                              @RequestParam(name = "sortDir", defaultValue = "desc") String sortDirection){

        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() : Sort.by(sortField).descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return historyRepository.findAll(pageable);
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
