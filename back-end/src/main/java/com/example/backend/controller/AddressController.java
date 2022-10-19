package com.example.backend.controller;

import com.example.backend.model.Address;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class AddressController {
    @Autowired
    private AddressRepository addressRepository;

    @GetMapping("/address/all")
    public ResponseEntity<List<Address>> getAll(){
        return ResponseEntity.ok(addressRepository.findAll());
    }

    @PostMapping("/address")
    public ResponseEntity<?> create(@RequestBody Address address){
        if(address.getAddress() != null){
            address.setActive(true);
            return ResponseEntity.ok(addressRepository.save(address));
        }else{
            return ResponseEntity.badRequest().body(new MessageResponse("Địa chỉ rỗng !!!"));
        }
    }
}
