package com.example.backend.controller;

import com.example.backend.exceptionhandler.CusNotFoundException;
import com.example.backend.model.Customer;
import com.example.backend.model.Image;
import com.example.backend.model.Product;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.CustomerRepository;
import com.example.backend.repository.ImageRepository;
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
import java.util.*;

import static com.example.backend.service.StringUtils.getSearchableString;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private FileService fileService;

    @GetMapping("/customer")
    public Page<Customer> search(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
                                 @RequestParam(name = "pageSize", defaultValue = "4") int pageSize,
                                 @RequestParam(name = "keyword") String keyword){
        String sortDirection = "desc";
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by("id").ascending() : Sort.by("id").descending();
        Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
        return customerRepository.search(pageable, keyword);
    }

    @GetMapping("/customer/home")
    public List<Customer> listAll(){
        return customerRepository.listAllActive();
    }

    @GetMapping("/customer/recycle-bin")
    public List<Customer> listAllTrash(){
        return customerRepository.listAllDisable();
    }

    @GetMapping("/customer/d/{id}")
    public EntityModel<Customer> one(@PathVariable Long id) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new CusNotFoundException(id));
        return EntityModel.of(customer);
    }

    @GetMapping("/customer/{url}")
    public EntityModel<Customer> getByUrl(@PathVariable("url") String url){
        return EntityModel.of(customerRepository.getCustomerByUrl(url));
    }

    @PostMapping(value = "/customer", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<?> newCustomer(@RequestPart("customer") Customer customer,
                                         @RequestPart(value = "products", required = false) Product[] products,
                                         @RequestPart(value = "thumb", required = false) MultipartFile file) throws IOException {

        String url = getSearchableString(customer.getName());
        if( customerRepository.getCustomerByUrl(url) != null ){
            return ResponseEntity.badRequest().body(new MessageResponse("Khách hàng đã tồn tại"));
        }else{
            customer.setUrl(url);
            customer.setActive(true);
            Image images;
            if(file != null){
                images = imageRepository.save(fileService.uploadOneImage(file));
            }else{
                images = new Image(null, null, null, null);
                imageRepository.save(images);
            }

            Set<Product> productSet = new LinkedHashSet<>();
            for (Product p : products){
                productSet.add(p);
            }

            customer.setProducts(productSet);
            customer.setThumb(images);
            return ResponseEntity.ok(customerRepository.save(customer));
        }
    }

    @PostMapping(value = "/customer/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public Customer updateCus(@PathVariable Long id, @RequestPart("customer") Customer customer,
                              @RequestPart(value = "products", required = false) Product[] products,
                              @RequestPart(value = "thumb", required = false) MultipartFile file) throws IOException {

        if(file != null) {
            if(customer.getThumb().getName() != null){
                fileService.deleteFile(customer.getThumb());
            }
            Image image = fileService.uploadOneImage(file);
            imageRepository.saveById(
                    image.getName(),
                    image.getUrl(),
                    image.getPathFile(),
                    image.getType(),
                    customer.getThumb().getId()
            );
        }
        Set<Product> productSet = new LinkedHashSet<>();
        for (Product p : products){
            productSet.add(p);
        }
        return customerRepository.findById(id)
                .map(newCustomer-> {
                    newCustomer.setIcon(customer.getIcon());
                    newCustomer.setBgIColor(customer.getBgIColor());
                    newCustomer.setName(customer.getName());
                    newCustomer.setDescription(customer.getDescription());
                    newCustomer.setProducts(productSet);
                    return customerRepository.save(newCustomer);
                })
                .orElseGet(() -> {
                    customer.setId(id);
                    return customerRepository.save(customer);
                });
    }

    @GetMapping("/customer/delete/{id}")
    public EntityModel<Customer> deleteCus(@PathVariable Long id){
        Customer cus = customerRepository.findById(id).get();
        cus.setActive(false);
        return EntityModel.of(customerRepository.save(cus));
    }

    @GetMapping("/customer/remove/{id}")
    public void removeCus(@PathVariable Long id){
        customerRepository.deleteById(id);
    }

    @GetMapping("/customer/restore/{id}")
    public Customer restoreCus(@PathVariable Long id){
        Customer cus = customerRepository.findById(id).get();
        cus.setActive(true);
        return customerRepository.save(cus);
    }
}
