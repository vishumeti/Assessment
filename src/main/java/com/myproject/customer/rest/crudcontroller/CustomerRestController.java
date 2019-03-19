package com.myproject.customer.rest.crudcontroller;

import java.util.List;
import java.util.Optional;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myproject.customer.rest.entity.Customer;
import com.myproject.customer.rest.repository.CustomerRepository;

@RestController
@RequestMapping("/api")
public class CustomerRestController {

	private CustomerRepository customerRepository;
	
	public CustomerRestController(CustomerRepository theCustomerRepository) {
		customerRepository = theCustomerRepository;
	}
	
	@GetMapping("/customers")
	public List<Customer> findall(){
		return customerRepository.findAll();
	}
	
	@GetMapping("/customer/{customerId}")
	public Customer findById(@PathVariable int customerId) {
		Optional<Customer> customer = customerRepository.findById(customerId);
		if(customer.isPresent()) {
			return customer.get();
		}else {
			return null;
		}
	}
	
	@PostMapping("/customers")
	public Customer save(@RequestBody Customer customer) {
		return customerRepository.save(customer);
	}
	
	@PutMapping("/customer")
	public Customer updateById(@RequestBody Customer customer) {
		return customerRepository.save(customer);
	}
	
	@DeleteMapping("/customer/{customerId}")
	public String deleteById(@PathVariable int customerId) {
		customerRepository.deleteById(customerId);
		return "Deleted ID : " + customerId;
	}
}
