package com.example.backend.controller;

import com.example.backend.model.Image;
import com.example.backend.model.TypicalImage;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.ImageRepository;
import com.example.backend.repository.TypicalImageRepository;
import com.example.backend.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.hateoas.EntityModel;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class TypicalImageController {
    @Autowired
    private TypicalImageRepository typicalImageRepo;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private FileService fileService;

    @GetMapping("/tImage")
    public Page<TypicalImage> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                             @RequestParam(name = "pageSize", defaultValue = "20") int pageSize){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return typicalImageRepo.findAll(pageable);
    }

    @GetMapping("/tImage/home")
    public ResponseEntity<List<TypicalImage>> getAll(){
        return ResponseEntity.ok(typicalImageRepo.getAllByActiveIsTrue());
    }

    @GetMapping("/tImage/{id}")
    public EntityModel<TypicalImage> one(@PathVariable Long id){
        return EntityModel.of(typicalImageRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Not found !"))
        );
    }

//    @PostMapping("/tImage/already")
//    public ResponseEntity<TypicalImage> addFromContainer(@RequestPart("typicalImage") TypicalImage typicalImage,
//                                                         @RequestPart("image") Image image){
//        typicalImage.setImage(image);
//        typicalImage.setActive(true);
//        return ResponseEntity.ok(typicalImageRepo.save(typicalImage));
//    }

    @GetMapping("/tImage/already/{id}")
    public ResponseEntity<?> addFromContainer(@PathVariable Long id){

        if (typicalImageRepo.getTypicalImageByImage_Id(id).isPresent()){
            return ResponseEntity.badRequest().body(new MessageResponse("Ảnh đã có trong thư viện ảnh tiêu biểu"));
        }
        Image image = imageRepository.findById(id).get();
        TypicalImage typicalImage = new TypicalImage();
        typicalImage.setImage(image);
        typicalImage.setActive(true);
        return ResponseEntity.ok(typicalImageRepo.save(typicalImage));
    }

    @PostMapping(value = "/tImage", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> addNew(@RequestPart("typicalImage") TypicalImage typicalImage,
                                    @RequestPart("image") MultipartFile file) throws IOException {
        if(file != null){
            Image images = imageRepository.save(fileService.uploadOneImage(file));
            typicalImage.setImage(images);
            typicalImage.setActive(true);
            return ResponseEntity.ok(typicalImageRepo.save(typicalImage));
        } else {
            return ResponseEntity.badRequest().body(new MessageResponse("Ảnh không được bỏ trống !"));
        }
    }

    @PostMapping("/tImage/{id}")
    public ResponseEntity<TypicalImage> update(@PathVariable Long id, @RequestBody TypicalImage typicalImage){
        return typicalImageRepo.findById(id).map(
                typicalImage1 -> {
                    typicalImage1.setCaption(typicalImage.getCaption());
                    typicalImage1.setDescription(typicalImage1.getDescription());
                    return ResponseEntity.ok(typicalImageRepo.save(typicalImage1));
                }
        ).orElseGet(()->{
            typicalImage.setId(id);
            return ResponseEntity.ok(typicalImageRepo.save(typicalImage));
        });
    }

    @GetMapping("/tImage/hide/{id}")
    public ResponseEntity<TypicalImage> hide(@PathVariable Long id){
        TypicalImage typicalImage = typicalImageRepo.findById(id).get();
        typicalImage.setActive(false);
        return ResponseEntity.ok(typicalImageRepo.save(typicalImage));
    }

    @GetMapping("/tImage/show/{id}")
    public ResponseEntity<TypicalImage> show(@PathVariable Long id){
        TypicalImage typicalImage = typicalImageRepo.findById(id).get();
        typicalImage.setActive(true);
        return ResponseEntity.ok(typicalImageRepo.save(typicalImage));
    }

    @GetMapping("/tImage/remove/{id}")
    public void remove(@PathVariable Long id){
        typicalImageRepo.deleteById(id);
    }
}
