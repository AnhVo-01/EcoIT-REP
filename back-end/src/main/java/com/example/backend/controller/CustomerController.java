package com.example.backend.controller;

import com.example.backend.exceptionhandler.CusNotFoundException;
import com.example.backend.model.Customer;
import com.example.backend.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.hateoas.EntityModel;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.backend.service.StringUtils.getSearchableString;

@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/s")
@RestController
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

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


    @PostMapping("/customer")
    public EntityModel<Customer> newCustomer(@RequestBody Customer customer){
        customer.setActive(true);
        customer.setUrl(getSearchableString(customer.getName()));
        return EntityModel.of(customerRepository.save(customer));
    }

    @GetMapping("/customer/{id}")
    public EntityModel<Customer> one(@PathVariable Long id) {
        Customer customer = customerRepository.findById(id) //
                .orElseThrow(() -> new CusNotFoundException(id));
        return EntityModel.of(customer);
    }

    @PostMapping("/customer/{id}")
    public Customer updateCus(@PathVariable Long id, @RequestBody Customer customer){
        return customerRepository.findById(id)
                .map(newCustomer-> {
                    newCustomer.setIcon(customer.getIcon());
                    newCustomer.setBgIColor(customer.getBgIColor());
                    newCustomer.setName(customer.getName());
                    newCustomer.setDescription(customer.getDescription());
                    newCustomer.setProducts(customer.getProducts());
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
