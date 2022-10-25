package com.example.backend.controller;

import com.example.backend.exceptionhandler.CusNotFoundException;
import com.example.backend.model.TypicalNumber;
import com.example.backend.repository.TypicalNumRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.EntityModel;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class TypicalNumController {
    @Autowired
    private TypicalNumRepository numRepository;

    @GetMapping("/number")
    public ResponseEntity<List<TypicalNumber>> listAll(){
        return ResponseEntity.ok(numRepository.listAll());
    }

    @GetMapping("/number/{id}")
    public EntityModel<TypicalNumber> one(@PathVariable("id") Long id){
        TypicalNumber number = numRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Could not found the" + id));
        return EntityModel.of(number);
    }

    @PostMapping("/number")
    public ResponseEntity<TypicalNumber> create(@RequestBody TypicalNumber number){
        number.setActive(true);
        return ResponseEntity.ok(numRepository.save(number));
    }

    @PostMapping("/number/{id}")
    public ResponseEntity<TypicalNumber> update(@PathVariable("id") Long id,
                                                @RequestBody TypicalNumber number){
        return numRepository.findById(id).map(
                number1 -> {
                    number1.setDescription(number.getDescription());
                    number1.setNum(number.getNum());
                    number1.setIcon(number.getIcon());

                    return ResponseEntity.ok(numRepository.save(number1));
                })
                .orElseGet(() ->{
                    number.setId(id);
                    return ResponseEntity.ok(numRepository.save(number));
                });
    }

    @GetMapping("/number/delete/{id}")
    public ResponseEntity<TypicalNumber> delete(@PathVariable Long id){
        TypicalNumber number = numRepository.findById(id).get();
        number.setActive(false);
        return ResponseEntity.ok(numRepository.save(number));
    }
}
