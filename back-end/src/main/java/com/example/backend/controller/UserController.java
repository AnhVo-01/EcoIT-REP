package com.example.backend.controller;

import com.example.backend.model.User;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Random;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/user")
@RestController
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    BCryptPasswordEncoder encoder;

    @GetMapping
    public Page<User> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                             @RequestParam(name = "pageSize", defaultValue = "10") int pageSize,
                             @RequestParam(name = "keyword") String keyword){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return userRepository.search(pageable, keyword);
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> one(@PathVariable Long id){
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Can't not found the "+ id));
        return ResponseEntity.ok(user);
    }

    @GetMapping("/reset/{id}")
    public ResponseEntity<?> resetPass(@PathVariable Long id){
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Can't not found the userId = "+ id));

        user.setPassword(encoder.encode("123@123Ab"));
        userRepository.save(user);
        return ResponseEntity.ok(new MessageResponse("Mật khẩu đã được đặt lại về mặc định"));
    }

}
