package com.example.backend.controller;

import com.example.backend.exceptionhandler.PostNotFoundException;
import com.example.backend.model.Image;
import com.example.backend.model.Post;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.ImageRepository;
import com.example.backend.repository.PostRepository;
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
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import static com.example.backend.service.StringUtils.getSearchableString;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class PostController {

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private FileService fileService;

    @Autowired
    private ImageRepository imageRepository;

    @GetMapping("/news")
    public Page<Post> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                             @RequestParam(name = "pageSize", defaultValue = "3") int pageSize,
                             @RequestParam(name = "keyword") String keyword){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return postRepository.search(pageable, keyword);
    }

    @GetMapping("/home/news")
    public List<Post> listAll(){
        return postRepository.getAllByActiveIsTrueOrderByIdDesc();
    }

    @GetMapping("/home/news/page")
    public Page<Post> listAll(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo){
        Pageable pageable = PageRequest.of(pageNo-1, 9);
        return postRepository.listAllById(pageable);
    }

    @GetMapping("/home/news/{url}")
    public Post viewPost(@PathVariable String url) {
        return postRepository.findByTitle(url);
    }

    Date date = new Date();
    SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

    @PostMapping(value = "/news", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> newPost(@RequestPart("news") Post post,
                            @RequestPart(value = "imageFile", required = false) MultipartFile file) throws IOException {
        if(!post.getTitle().isEmpty()){
            post.setDate(fm.format(date));
            post.setActive(true);
            post.setUrl(getSearchableString(post.getTitle()));
            Image images;
            if(file != null){
                images = imageRepository.save(fileService.uploadOneImage(file));
            }else{
                images = new Image(null, null, null, null);
                imageRepository.save(images);
            }
            post.setPostImage(images);
            return ResponseEntity.ok(postRepository.save(post));
        }else{
            return  ResponseEntity.badRequest().body(new MessageResponse("Tin tức không có tiêu đề"));
        }
    }

    @PostMapping(value = "/news/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Post> updateNews(@PathVariable Long id, @RequestPart("news") Post news,
                                           @RequestPart(value = "imageFile", required = false) MultipartFile file) throws IOException {
        Post post = postRepository.findById(id).get();
        post.setTitle(news.getTitle());
        post.setDescription(news.getDescription());
        post.setContent(news.getContent());
        if(file != null){
            if(news.getPostImage().getName() != null){
                fileService.deleteFile(news.getPostImage());
            }
            Image image = fileService.uploadOneImage(file);
            imageRepository.saveById(
                    image.getName(),
                    image.getPathUrl(),
                    image.getPathFile(),
                    image.getType(),
                    news.getPostImage().getId()
            );
        }
        return ResponseEntity.ok(postRepository.save(post));
    }


    @GetMapping("/news/d/{id}")
    public Post one(@PathVariable Long id) {

        return postRepository.findById(id)
                .orElseThrow(() -> new PostNotFoundException(id));
    }

    @GetMapping("/news/delete/{id}")
    public EntityModel<Post> deleteNews(@PathVariable Long id) {
        Post post = postRepository.findById(id).get();
        post.setActive(false);
        return EntityModel.of(postRepository.save(post));
    }

    @GetMapping("/news/remove/{id}")
    public void removeNews(@PathVariable Long id) {
        postRepository.deleteById(id);
    }

}
