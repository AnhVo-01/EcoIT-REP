package com.example.backend.controller;

import com.example.backend.exceptionhandler.ProductNotFoundException;
import com.example.backend.model.Image;
import com.example.backend.model.Product;
import com.example.backend.repository.ImageRepository;
import com.example.backend.repository.ProductRepository;
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
import java.util.List;

import static com.example.backend.service.StringUtils.getSearchableString;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class ProductController {

    @Autowired
    private ProductRepository repository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private FileService fileService;


    @GetMapping("/product")
    public Page<Product> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                                @RequestParam(name = "pageSize", defaultValue = "4") int pageSize,
                                @RequestParam(name = "keyword") String keyword){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return repository.listAll(pageable, keyword);
    }

    @GetMapping("/product/home")
    public List<Product> listAll(){
        return repository.getAll();
    }

    @GetMapping("/product/{id}")
    public Product one(@PathVariable Long id){
        return repository.findById(id)
                .orElseThrow(() -> new ProductNotFoundException(id));
    }

    @PostMapping(value = "/product", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public Product newProduct(@RequestPart("product") Product product,
                              @RequestPart(value = "thumb", required = false) MultipartFile file) throws IOException {
        product.setActive(true);
        product.setUrl(getSearchableString(product.getName()));
        Image images;
        if(file != null){
            images = imageRepository.save(fileService.uploadOneImage(file));
        }else{
            images = new Image(null, null, null, null);
            imageRepository.save(images);
        }
        product.setThumb(images);
        return repository.save(product);
    }

    @PostMapping(value = "product/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Product> editProduct(@PathVariable Long id, @RequestPart("product") Product product,
                                               @RequestPart(value = "thumb", required = false) MultipartFile file) throws IOException {

        Product nProduct = repository.findById(id).get();
        nProduct.setName(product.getName());
        nProduct.setDescription(product.getDescription());
        if(file != null){
            if(product.getThumb().getName() != null){
                fileService.deleteFile(product.getThumb());
            }
            Image image = fileService.uploadOneImage(file);
            imageRepository.saveById(
                    image.getName(),
                    image.getUrl(),
                    image.getPathFile(),
                    image.getType(),
                    product.getThumb().getId()
            );
        }

        return ResponseEntity.ok(repository.save(nProduct));
    }

    @GetMapping("/product/remove/{id}")
    public Product delete(@PathVariable Long id){
        Product product = repository.findById(id).get();
        product.setActive(false);
        return repository.save(product);
    }
}
