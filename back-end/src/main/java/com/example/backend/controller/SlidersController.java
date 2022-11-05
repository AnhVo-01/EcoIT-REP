package com.example.backend.controller;

import com.example.backend.model.Image;
import com.example.backend.model.Product;
import com.example.backend.model.Sliders;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.ImageRepository;
import com.example.backend.repository.SlidersRepository;
import com.example.backend.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class SlidersController {
    @Autowired
    private SlidersRepository slidersRepository;

    @Autowired
    private FileService fileService;


    @GetMapping("/home/sliders")
    public List<Sliders> home(){
        return slidersRepository.getAllByActiveIsTrue();
    }

    @GetMapping("/sliders")
    public List<Sliders> listAll(){
        return slidersRepository.findAll();
    }

    @GetMapping("/sliders/{id}")
    public Sliders one(@PathVariable Long id){
        return slidersRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Could not found the slider " + id));
    }

    @PostMapping(value = "/sliders", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> addNew(@RequestPart(value = "cover") MultipartFile file) throws IOException {
        if(file != null){
            Image image = fileService.uploadOneImage(file);

            Sliders sliders = new Sliders();

            sliders.setName(image.getName());
            sliders.setType(image.getType());
            sliders.setPathUrl(image.getPathUrl());
            sliders.setPathFile(image.getPathFile());
            sliders.setActive(true);

            return ResponseEntity.ok(slidersRepository.save(sliders));
        }else{
            return ResponseEntity.badRequest()
                    .body(new MessageResponse("Vui lòng chèn vào ảnh"));
        }
    }

    @PostMapping(value = "/sliders/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> edit(@PathVariable("id") Long id,
                                  @RequestPart(value = "cover", required = false) MultipartFile file) throws IOException {

        Sliders sliders = slidersRepository.findById(id).get();

        if(file != null){
            slidersRepository.findById(id).map(
                    sliders1 -> {
                        sliders1.setPathFile(null);
                        sliders1.setPathUrl(null);
                        sliders1.setType(null);
                        sliders1.setName(null);
                        return slidersRepository.save(sliders1);
                    }
            );

            Files.list(Paths.get(sliders.getPathFile())).forEach(file1->{
                if(file1.getFileName().toString().startsWith(sliders.getName())){
                    try{
                        Files.delete(file1.toAbsolutePath());
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            });

            Image image = fileService.uploadOneImage(file);

            Sliders newSliders = new Sliders();

            newSliders.setName(image.getName());
            newSliders.setType(image.getType());
            newSliders.setPathUrl(image.getPathUrl());
            newSliders.setPathFile(image.getPathFile());
            newSliders.setActive(true);

            return ResponseEntity.ok(slidersRepository.save(sliders));
        }else{
            return ResponseEntity.badRequest()
                    .body(new MessageResponse("Vui lòng chèn vào ảnh"));
        }
    }

    @GetMapping("/sliders/hide/{id}")
    public Sliders hide(@PathVariable Long id){
        Sliders sliders = slidersRepository.findById(id).get();
        sliders.setActive(false);
        return slidersRepository.save(sliders);
    }

    @GetMapping("/sliders/show/{id}")
    public Sliders show(@PathVariable Long id){
        Sliders sliders = slidersRepository.findById(id).get();
        sliders.setActive(true);
        return slidersRepository.save(sliders);
    }

}
