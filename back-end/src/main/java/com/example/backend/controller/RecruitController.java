package com.example.backend.controller;

import com.example.backend.model.Image;
import com.example.backend.model.Recruit;
import com.example.backend.repository.ImageRepository;
import com.example.backend.repository.RecruitRepository;
import com.example.backend.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    Date date = new Date();
    SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");


    @GetMapping("/recruit")
    public Page<Recruit> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                             @RequestParam(name = "pageSize", defaultValue = "3") int pageSize,
                             @RequestParam(name = "keyword") String keyword){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return repository.search(pageable, keyword);
    }

    @GetMapping("/recruit/home")
    public ResponseEntity<List<Recruit>> listAll(){
        return ResponseEntity.ok(repository.listAllRecruit());
    }

    @GetMapping("/recruit/d/{id}")
    public Recruit one(@PathVariable Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Could not found the recruit "+id));
    }
    @GetMapping("/recruit/{url}")
    public ResponseEntity<Recruit> getDetails(@PathVariable("url") String url) {
        return ResponseEntity.ok(repository.getRecruitByUrl(url));
    }

    @PostMapping(value = "/recruit", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public Recruit newRecruit(@RequestPart("recruit") Recruit recruit,
                              @RequestPart(value = "thumb", required = false) MultipartFile file){
        recruit.setActive(true);
        recruit.setCreateDate(fm.format(date));
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

    @PostMapping(value = "/recruit/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Recruit> updateRecruit(@PathVariable Long id, @RequestPart("recruit") Recruit recruit,
                                           @RequestPart(value = "thumb", required = false) MultipartFile file) throws IOException {
        Recruit recruit1 = repository.findById(id).get();
        recruit1.setTitle(recruit.getTitle());
        recruit1.setDescription(recruit.getDescription());
        recruit1.setContent(recruit.getContent());
        if(file != null){
            if(recruit.getThumb().getName() != null){
                fileService.deleteFile(recruit.getThumb());
            }
            Image image = fileService.uploadOneImage(file);
            imageRepository.saveById(
                    image.getName(),
                    image.getUrl(),
                    image.getPathFile(),
                    image.getType(),
                    recruit.getThumb().getId()
            );
        }
        return ResponseEntity.ok(repository.save(recruit1));
    }

    @GetMapping("/recruit/delete/{id}")
    public Recruit delete(@PathVariable Long id){
        Recruit recruit = repository.findById(id).get();
        recruit.setActive(false);
        return repository.save(recruit);
    }
}
