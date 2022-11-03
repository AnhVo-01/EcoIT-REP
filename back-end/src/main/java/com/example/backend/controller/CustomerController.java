package com.example.backend.controller;

import com.example.backend.exceptionhandler.CusNotFoundException;
import com.example.backend.model.Banner;
import com.example.backend.model.Customer;
import com.example.backend.model.Image;
import com.example.backend.model.Product;
import com.example.backend.payload.MessageResponse;
import com.example.backend.repository.BannerRepository;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

import static com.example.backend.service.StringUtils.getSearchableString;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private BannerRepository bannerRepository;

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

    @GetMapping("/home/customer")
    public List<Customer> listAll(){
        return customerRepository.listAllActive();
    }

    @GetMapping("/home/customer/{url}")
    public EntityModel<Customer> getByUrl(@PathVariable("url") String url){
        return EntityModel.of(customerRepository.getCustomerByUrl(url));
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
            Banner banner;
            if(file != null){
                banner = bannerRepository.save(fileService.uploadBanner(file));
            }else{
                banner = new Banner(null, null, null, null, false);
                bannerRepository.save(banner);
            }
            if (products != null){
                Set<Product> productSet = new LinkedHashSet<>();
                for (Product p : products){
                    productSet.add(p);
                }
                customer.setProducts(productSet);
            }

            customer.setThumb(banner);
            return ResponseEntity.ok(customerRepository.save(customer));
        }
    }

    @Transactional
    @PostMapping(value = "/customer/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public Customer updateCus(@PathVariable Long id, @RequestPart("customer") Customer customer,
                              @RequestPart(value = "products", required = false) Product[] products,
                              @RequestPart(value = "thumb", required = false) MultipartFile file) throws IOException {

        if(file != null) {
            if(customer.getThumb().getName() != null){
                fileService.deleteBanner(customer.getThumb());
            }
            Banner banner = fileService.uploadBanner(file);
            bannerRepository.saveById(
                    banner.getName(),
                    banner.getUrl(),
                    banner.getPathFile(),
                    banner.getType(),
                    customer.getThumb().getId()
            );
        }

        Customer newCustomer = customerRepository.findById(id).get();
        newCustomer.setIcon(customer.getIcon());
        newCustomer.setBgIColor(customer.getBgIColor());
        newCustomer.setName(customer.getName());
        newCustomer.setDescription(customer.getDescription());

        if(products != null){
            if (customerRepository.findLinkByCustomerId(id)) {
                customerRepository.unLink(id);
            }
            Set<Product> productSet = new LinkedHashSet<>();
            for (Product p : products){
                productSet.add(p);
            }
            newCustomer.setProducts(productSet);
        }

        return customerRepository.save(newCustomer);
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
