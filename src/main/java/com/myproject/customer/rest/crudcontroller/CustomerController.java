package com.myproject.customer.rest.crudcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {

	   @RequestMapping("/")
	   public String customers() {
	      return "Customers";
	   }

	   @RequestMapping("/user")
	   public String user() {
	      return "User";
	   }
	   	
}
