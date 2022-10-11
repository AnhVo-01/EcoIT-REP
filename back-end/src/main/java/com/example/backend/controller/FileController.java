package com.example.backend.controller;

import com.example.backend.model.Image;
import com.example.backend.payload.MessageResponse;
import com.example.backend.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URL;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/s/file")
public class FileController {

    @Autowired
    private FileService fileService;

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
}