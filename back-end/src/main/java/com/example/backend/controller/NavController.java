package com.example.backend.controller;

import com.example.backend.model.Navigation;
import com.example.backend.payload.NavParent;
import com.example.backend.repository.NavRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class NavController {
    @Autowired
    private NavRepository navRepository;

    @GetMapping("/home/nav")
    public ResponseEntity<List<?>> all(){
        List<NavParent> navParents = new ArrayList<>();
        List<Navigation> navParentLis = navRepository.getAll();
        for (Navigation nav : navParentLis){
            navParents.add(new NavParent(nav.getId(), nav.getName(), nav.getUrl(),
                    navRepository.getChild(nav.getId()), nav.isActive()));
        }
        return ResponseEntity.ok(navParents);
    }

    @GetMapping("/nav/group")
    public ResponseEntity<List<Navigation>> allGroup(){
        return ResponseEntity.ok(navRepository.getAllGroup());
    }

    @GetMapping("/nav/all")
    public Page<Navigation> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                                @RequestParam(name = "pageSize", defaultValue = "20") int pageSize,
                                @RequestParam(name = "keyword") String keyword){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return navRepository.search(pageable, keyword);
    }

    @GetMapping("/nav/{id}")
    public ResponseEntity<Navigation> one(@PathVariable("id") Long id){
        return ResponseEntity.ok(navRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Could not found the navigation " + id)));
    }
    @GetMapping("/nav/child/{id}")
    public ResponseEntity<List<Navigation>> getChild(@PathVariable("id") Long id){
        return ResponseEntity.ok(navRepository.getChild(id));
    }

    @PostMapping("/nav")
    public ResponseEntity<Navigation> create(@RequestBody Navigation navigation){
        navigation.setActive(true);
        return ResponseEntity.ok(navRepository.save(navigation));
    }

    @PostMapping("/nav/{id}")
    public ResponseEntity<Navigation> update(@PathVariable("id") Long id, @RequestBody Navigation navigation){
        Navigation navigation1 = navRepository.findById(id).get();
        navigation1.setName(navigation.getName());
        navigation1.setUrl(navigation.getUrl());
        navigation1.setParentId(navigation.getParentId());

        return ResponseEntity.ok(navRepository.save(navigation1));
    }

    @GetMapping("/nav/delete/{id}")
    public ResponseEntity<Navigation> delete(@PathVariable Long id){
        Navigation navigation = navRepository.findById(id).get();
        navigation.setActive(false);
        return ResponseEntity.ok(navRepository.save(navigation));
    }
}
