package com.example.backend.controller;

import com.example.backend.model.Image;
import com.example.backend.model.Recruit;
import com.example.backend.repository.ImageRepository;
import com.example.backend.repository.RecruitRepository;
import com.example.backend.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static com.example.backend.service.StringUtils.getSearchableString;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class RecruitController {
    @Autowired
    private RecruitRepository repository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private FileService fileService;

    @GetMapping("/recruit/home")
    public ResponseEntity<List<Recruit>> listAll(){
        return ResponseEntity.ok(repository.listAllRecruit());
    }

    @PostMapping(value = "/recruit", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public Recruit newRecruit(@RequestPart("recruit") Recruit recruit,
                              @RequestPart(value = "thumb", required = false) MultipartFile file){
        recruit.setActive(true);
        recruit.setUrl(getSearchableString(recruit.getTitle()));
        try{
            Image images = imageRepository.save(fileService.uploadOneImage(file));
            recruit.setThumb(images);
            return repository.save(recruit);
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("/recruit/delete/{id}")
    public Recruit delete(@PathVariable Long id){
        Recruit recruit = repository.findById(id).get();
        recruit.setActive(false);
        return repository.save(recruit);
    }
}
