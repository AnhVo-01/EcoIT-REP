package com.example.backend.controller;

import com.example.backend.model.AboutAddress;
import com.example.backend.model.AboutUs;
import com.example.backend.model.Address;
import com.example.backend.repository.AboutUsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collection;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class AboutController {
    @Autowired
    private AboutUsRepository repository;

    @GetMapping("/about-us")
    public ResponseEntity<AboutUs> home(){
        return ResponseEntity.ok(repository.getAll());
    }

    @PostMapping("/about-us")
    public ResponseEntity<AboutUs> create(@RequestPart("about") AboutUs aboutUs,
                                          @RequestPart(value = "address", required = false) Address[] address){
        if (address != null){
            Collection<Address> addresses = new ArrayList<>();
            for(Address address1 : address){
                addresses.add(address1);
            }
            aboutUs.setAddress(addresses);
        }
        aboutUs.setActive(true);

        return ResponseEntity.ok(repository.save(aboutUs));
    }

//    @PostMapping("/about-us")
//    public ResponseEntity<?> create(@RequestPart("about") AboutUs aboutUs,
//                                    @RequestPart(value = "address", required = false) Long[] addressId){
//        if (addressId != null){
//            AboutAddress aboutAddress = new AboutAddress();
//            aboutAddress.setAboutID(1L);
//            for(Long id : addressId){
//                if(addressRepository.existsById(id)){
//                    return ResponseEntity.badRequest().body("Địa chỉ đã được thêm !");
//                }
//                aboutAddress.setAddressID(id);
//            }
//            addressRepository.save(aboutAddress);
//        }
//        aboutUs.setActive(true);
//
//        return ResponseEntity.ok(repository.save(aboutUs));
//    }

    @GetMapping("/about-us/delete/{id}")
    public ResponseEntity<AboutUs> delete(@PathVariable Long id){
        AboutUs aboutUs = repository.findById(id).get();
        aboutUs.setActive(false);

        return ResponseEntity.ok(repository.save(aboutUs));
    }
}
