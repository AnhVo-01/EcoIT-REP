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
import java.nio.file.Paths;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class SlidersController {
    @Autowired
    private SlidersRepository slidersRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private FileService fileService;


    @GetMapping("/home/sliders")
    public List<Sliders> listAll(){
        return slidersRepository.getAll();
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
            sliders.setPathUrl(image.getUrl());
            sliders.setPathFile(image.getPathFile());
            sliders.setActive(1);

            return ResponseEntity.ok(slidersRepository.save(sliders));
        }else{
            return ResponseEntity.badRequest()
                    .body(new MessageResponse("Vui lòng chèn vào ảnh"));
        }
    }

    @PostMapping(value = "/sliders/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> edit(@PathVariable("id") Long id, @RequestPart("sliders") Sliders sliders,
                                  @RequestPart(value = "cover", required = false) MultipartFile file) throws IOException {

        Sliders sliders1 = slidersRepository.findById(id).get();
        sliders1.setActive(sliders.getActive());

        if(file != null){
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

            sliders1.setName(image.getName());
            sliders1.setType(image.getType());
            sliders1.setPathUrl(image.getUrl());
            sliders1.setPathFile(image.getPathFile());
        }else{
            sliders1.setName(sliders.getName());
            sliders1.setType(sliders.getType());
            sliders1.setPathUrl(sliders.getUrl());
            sliders1.setPathFile(sliders.getPathFile());
        }
        return ResponseEntity.ok(slidersRepository.save(sliders1));
    }

    @GetMapping("/sliders/delete/{id}")
    public Sliders delete(@PathVariable Long id){
        Sliders sliders = slidersRepository.findById(id).get();
        sliders.setActive(0);
        return slidersRepository.save(sliders);
    }


//    ========================================================================================================

    @GetMapping("/tCustomer")
    public List<Sliders> listAllCus(){
        return slidersRepository.getAll();
    }

    @PostMapping(value = "/tCustomer", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> addTypicalCus(@RequestPart(value = "image") MultipartFile file) throws IOException {
        if(file != null){
            Image image = fileService.uploadOneImage(file);

            Sliders sliders = new Sliders();

            sliders.setName(image.getName());
            sliders.setType(image.getType());
            sliders.setPathUrl(image.getUrl());
            sliders.setPathFile(image.getPathFile());
            sliders.setActive(5);

            return ResponseEntity.ok(slidersRepository.save(sliders));
        }else{
            return ResponseEntity.badRequest()
                    .body(new MessageResponse("Vui lòng chèn vào ảnh"));
        }
    }

    @GetMapping("/tCustomer/delete/{id}")
    public Sliders deleteCus(@PathVariable Long id){
        Sliders sliders = slidersRepository.findById(id).get();
        sliders.setActive(0);
        return slidersRepository.save(sliders);
    }

}
