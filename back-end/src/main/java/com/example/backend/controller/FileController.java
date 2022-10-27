package com.example.backend.controller;

import com.example.backend.exceptionhandler.CusNotFoundException;
import com.example.backend.model.Customer;
import com.example.backend.model.Image;
import com.example.backend.model.TypicalImage;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.ImageRepository;
import com.example.backend.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.hateoas.EntityModel;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URL;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/s/file")
public class FileController {

    @Autowired
    private FileService fileService;

    @Autowired
    private ImageRepository imageRepository;

    @PostMapping("/downloadFile")
    public ResponseEntity<?> downloadFile(@RequestBody Image image) throws IOException {
        InputStreamResource in = new InputStreamResource(new URL(image.getUrl()).openStream());
        String contentType = image.getType();
        String headerValue = "attachment;file=\"" + in.getFilename() +"\"";
        return ResponseEntity.ok().contentType( MediaType.parseMediaType(contentType)).header(HttpHeaders.CONTENT_DISPOSITION,headerValue).body(in);
    }


    @PostMapping("/deleteFile")
    public ResponseEntity<?>deleteFile(@RequestBody Image image) throws IOException{
        try{
            this.fileService.deleteFile(image);
            return ResponseEntity.status(HttpStatus.OK).body(new MessageResponse("Deleted the file successfully: "+image.getName()));
        }catch (IOException e){
            return  ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/image")
    public Page<Image> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                                     @RequestParam(name = "pageSize", defaultValue = "20") int pageSize){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return imageRepository.findAll(pageable);
    }

    @GetMapping("/{id}")
    public EntityModel<Image> one(@PathVariable Long id) {
        Image image = imageRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Could not found the "+id));
        return EntityModel.of(image);
    }

    @GetMapping("/image/all")
    public ResponseEntity<List<Image>> getAllImage() {
        return ResponseEntity.ok(imageRepository.getImageByNameIsNotNull());
    }

    @PostMapping("image/update")
    public ResponseEntity<Image> showHome(@RequestBody Image image){
        return ResponseEntity.ok(imageRepository.save(image));
    }
}
