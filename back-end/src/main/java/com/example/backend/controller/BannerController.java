package com.example.backend.controller;

import com.example.backend.model.Banner;
import com.example.backend.model.Image;
import com.example.backend.model.Sliders;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.BannerRepository;
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

@CrossOrigin("http://localhost:4200")
@RestController
public class BannerController {
    @Autowired
    private BannerRepository bannerRepository;

    @Autowired
    private FileService fileService;

    @GetMapping("/banner")
    public Page<Banner> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                               @RequestParam(name = "pageSize", defaultValue = "4") int pageSize,
                               @RequestParam(name = "sortField", defaultValue = "id") String sortField,
                               @RequestParam(name = "sortDir", defaultValue = "desc") String sortDirection,
                               @RequestParam(value = "target", required = false) String target){

        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() : Sort.by(sortField).descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);

//        if (target != null || !target.trim().isEmpty()){
//            return bannerRepository.filter(pageable, target);
//        }else{
//        }
            return bannerRepository.findAll(pageable);
    }

    @GetMapping("/home/banner/{target}")
    public ResponseEntity<Banner> getByTarget(@PathVariable String target){
        return ResponseEntity.ok(bannerRepository.getBannerByTarget(target));
    }

    @GetMapping("/banner/show/{id}")
    public ResponseEntity<Banner> show(@PathVariable Long id){
        Banner banner = bannerRepository.findById(id).get();
        banner.setActive(true);
        return ResponseEntity.ok(bannerRepository.save(banner));
    }

    @GetMapping("/banner/hide/{id}")
    public ResponseEntity<Banner> hide(@PathVariable Long id){
        Banner banner = bannerRepository.findById(id).get();
        banner.setActive(false);
        return ResponseEntity.ok(bannerRepository.save(banner));
    }

    @PostMapping(value = "/banner", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> create(@RequestPart("target") String target,
                                    @RequestPart(value = "banner") MultipartFile banner) throws IOException {
        if(banner != null){
            Banner banner1 = fileService.uploadBanner(banner);
            banner1.setTarget(target);

            return ResponseEntity.ok(bannerRepository.save(banner1));
        }else{
            return ResponseEntity.badRequest()
                    .body(new MessageResponse("Vui lòng chèn vào ảnh"));
        }
    }

    @PostMapping(value = "/banner/{id}", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> update(@PathVariable Long id, @RequestPart("target") String target,
                                    @RequestPart(value = "banner") MultipartFile file) {
        return ResponseEntity.ok(bannerRepository.findById(id).map(
                banner1 -> {
                    try {
                        Banner banner = fileService.uploadBanner(file);

                        if (!banner1.getName().equals(banner.getName())){
                            fileService.deleteBanner(banner1);
                            bannerRepository.saveById(banner.getName(), banner.getPathUrl(), banner.getPathFile(), banner.getType(), id);
                            banner.setTarget(target);

                            return ResponseEntity.ok(bannerRepository.save(banner));
                        }else {
                            banner1.setTarget(target);
                            return ResponseEntity.ok(bannerRepository.save(banner1));
                        }
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
        ).orElseThrow( () -> new RuntimeException("Not found!!")) );
    }
}
