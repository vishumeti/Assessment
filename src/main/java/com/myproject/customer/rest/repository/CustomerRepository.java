package com.myproject.customer.rest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.myproject.customer.rest.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {

}
