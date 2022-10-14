package com.example.backend.controller;

import com.example.backend.model.AboutUs;
import com.example.backend.repository.AboutUsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class AboutController {
    @Autowired
    private AboutUsRepository repository;

    @GetMapping("/about-us")
    public ResponseEntity<AboutUs> home(){
        return ResponseEntity.ok(repository.getAll());
    }

    @PostMapping("/about-us")
    public ResponseEntity<AboutUs> create(@RequestBody AboutUs aboutUs){
        aboutUs.setActive(true);
        return ResponseEntity.ok(repository.save(aboutUs));
    }

    @PostMapping("/about-us/{id}")
    public ResponseEntity<AboutUs> update(@PathVariable("id") Long id, @RequestBody AboutUs aboutUs){
        AboutUs aboutUs1 = repository.findById(id).get();

        aboutUs1.setContent(aboutUs.getContent());
        aboutUs1.setDescription(aboutUs.getDescription());
        aboutUs1.setVideoLINK(aboutUs.getVideoLINK());

        return ResponseEntity.ok(repository.save(aboutUs1));
    }

    @GetMapping("/about-us/delete/{id}")
    public ResponseEntity<AboutUs> delete(@PathVariable Long id){
        AboutUs aboutUs = repository.findById(id).get();
        aboutUs.setActive(false);

        return ResponseEntity.ok(repository.save(aboutUs));
    }
}
