package com.example.backend.controller;

import com.example.backend.model.AboutUs;
import com.example.backend.model.Address;
import com.example.backend.payload.AboutAddress;
import com.example.backend.repository.AboutUsRepository;
import com.example.backend.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class AboutController {
    @Autowired
    private AboutUsRepository repository;

    @Autowired
    private AddressRepository addressRepository;

    @GetMapping("/home/about-us")
    public ResponseEntity<AboutUs> home(){
        return ResponseEntity.ok(repository.getAll());
    }

    @PostMapping("/about-us")
    public ResponseEntity<AboutUs> create(@RequestPart("about") AboutUs aboutUs,
                                          @RequestPart(value = "address", required = false) Address[] address){
        aboutUs.setActive(true);
        if (address != null){
            Collection<Address> addresses = new ArrayList<>();
            for(Address address1 : address){
                address1.setActive(true);
                addressRepository.save(address1);
                addresses.add(address1);
            }

            List<Address> addressList = new ArrayList<>();
            for (Long id : repository.getAllAddrId()){
                addressList.add(addressRepository.findById(id).get());
            }

            for (Address address2 : addressList){
                addresses.add(address2);
            }

            aboutUs.setAddress(addresses);
        }
        return ResponseEntity.ok(repository.save(aboutUs));
    }

    @GetMapping("/about-us/delete/{id}")
    public ResponseEntity<AboutUs> delete(@PathVariable Long id){
        AboutUs aboutUs = repository.findById(id).get();
        aboutUs.setActive(false);

        return ResponseEntity.ok(repository.save(aboutUs));
    }

    @GetMapping("/about-us/address/d/{id}")
    public ResponseEntity<AboutAddress> unlinkAdd(@PathVariable Long id){
        return ResponseEntity.ok(repository.unlinkAddress(id));
    }
}
