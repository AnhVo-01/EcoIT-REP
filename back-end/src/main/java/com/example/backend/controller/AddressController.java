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

    @GetMapping("/address")
    public ResponseEntity<List<Address>> getAllActive(){
        return ResponseEntity.ok(addressRepository.getAllByActiveIsTrue());
    }

    @GetMapping("/address/all")
    public ResponseEntity<List<Address>> getAll(){
        return ResponseEntity.ok(addressRepository.findAll());
    }

    @GetMapping("/address/{id}")
    public ResponseEntity<Address> one(@PathVariable Long id){
        return ResponseEntity.ok(addressRepository.findById(id).get());
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

    @GetMapping("/address/delete/{id}")
    public ResponseEntity<Address> delete(@PathVariable Long id){
        Address address = addressRepository.findById(id).get();
        address.setActive(false);
        return ResponseEntity.ok(addressRepository.save(address));
    }
}
