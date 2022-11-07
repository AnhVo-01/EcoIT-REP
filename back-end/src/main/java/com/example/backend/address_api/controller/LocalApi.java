package com.example.backend.address_api.controller;

import com.example.backend.address_api.model.Districts;
import com.example.backend.address_api.model.Provinces;
import com.example.backend.address_api.model.Wards;
import com.example.backend.address_api.repo.DistrictRepo;
import com.example.backend.address_api.repo.ProvinceRepo;
import com.example.backend.address_api.repo.WardRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("http://localhost:4200")
@RequestMapping("/open/api")
@RestController
public class LocalApi {

    @Autowired
    private ProvinceRepo provinceRepo;

    @Autowired
    private DistrictRepo districtRepo;

    @Autowired
    private WardRepo wardRepo;



    @GetMapping("/p/")
    public List<Provinces> listProvinces(){
        return provinceRepo.findAll();
    }

    @GetMapping("/p/{code}")
    public Provinces getProvinces(@PathVariable Long code){
        return provinceRepo.getProvincesByCode(code);
    }

    @GetMapping("/d/")
    public List<Districts> listDistricts(){
        return districtRepo.findAll();
    }

    @GetMapping("/d/{code}")
    public Districts getDistricts(@PathVariable Long code){
        return districtRepo.getDistrictsByCode(code);
    }

    @GetMapping("/w/")
    public List<Wards> listWards(){
        return wardRepo.findAll();
    }
}
