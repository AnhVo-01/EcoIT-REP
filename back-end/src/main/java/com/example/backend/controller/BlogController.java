package com.example.backend.controller;

import com.example.backend.exceptionhandler.PostNotFoundException;
import com.example.backend.model.Blog;
import com.example.backend.model.Image;
import com.example.backend.model.Post;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.BlogRepository;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static com.example.backend.service.StringUtils.getSearchableString;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class BlogController {

    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private FileService fileService;

    @Autowired
    private ImageRepository imageRepository;

    @GetMapping("/blogs")
    public Page<Blog> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                             @RequestParam(name = "pageSize", defaultValue = "3") int pageSize,
                             @RequestParam(name = "keyword") String keyword){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return blogRepository.search(pageable, keyword);
    }

    @GetMapping("/blogs/home")
    public List<Blog> listAll(){
        return blogRepository.getBlogsByActiveIsTrueOrderByIdDesc();
    }

    Date date = new Date();
    SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

    @PostMapping(value = "/blogs", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> create(@RequestPart("blog") Blog blog,
                                     @RequestPart(value = "thumb", required = false) MultipartFile file) throws IOException {
        if(!blog.getTitle().isEmpty()){
            String url = getSearchableString(blog.getTitle());
            if( url.equals(blogRepository.getBlogByLink(blog.getTitle())) ){
                return ResponseEntity.badRequest().body(new MessageResponse("Tên bài viết đã tồn tại"));
            }
            blog.setLink(url);
            blog.setCDate(fm.format(date));
            blog.setActive(true);
            Image images;
            if(file != null){
                images = imageRepository.save(fileService.uploadOneImage(file));
            }else{
                images = new Image(null, null, null, null);
                imageRepository.save(images);
            }
            blog.setThumb(images);
            return ResponseEntity.ok(blogRepository.save(blog));
        }else{
            return  ResponseEntity.badRequest().body(new MessageResponse("Vui lòng không bỏ trống tiêu đề !"));
        }
    }

    @PostMapping(value = "/blogs/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> update(@PathVariable Long id, @RequestPart("blog") Blog blog,
                                           @RequestPart(value = "thumb", required = false) MultipartFile file) throws IOException {
        Blog blog1 = blogRepository.findById(id).get();

        String url = getSearchableString(blog.getTitle());
        if( blogRepository.getBlogByLink(url) != null ){
            return ResponseEntity.badRequest().body(new MessageResponse("Tên bài viết đã tồn tại"));
        }

        blog1.setTitle(blog.getTitle());
        blog1.setLink(url);
        blog1.setDescription(blog.getDescription());
        blog1.setContent(blog.getContent());
        if(file != null){
            if(blog.getThumb().getName() != null){
                fileService.deleteFile(blog.getThumb());
            }
            Image image = fileService.uploadOneImage(file);
            imageRepository.saveById(
                    image.getName(),
                    image.getUrl(),
                    image.getPathFile(),
                    image.getType(),
                    blog.getThumb().getId()
            );
        }
        return ResponseEntity.ok(blogRepository.save(blog1));
    }


    @GetMapping("/blogs/d/{id}")
    public Blog one(@PathVariable Long id) {
        return blogRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Could not found the " + id));
    }

    @GetMapping("/blogs/{url}")
    public Blog getByURL(@PathVariable String url) {
        return blogRepository.getBlogByLink(url);
    }

    @GetMapping("/blogs/delete/{id}")
    public EntityModel<Blog> delete(@PathVariable Long id) {
        Blog blog = blogRepository.findById(id).get();
        blog.setActive(false);
        return EntityModel.of(blogRepository.save(blog));
    }

    @GetMapping("/blogs/remove/{id}")
    public void remove(@PathVariable Long id) {
        blogRepository.deleteById(id);
    }

}