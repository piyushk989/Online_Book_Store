package com.piyush.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.piyush.entity.BookEntity;
import com.piyush.repository.BookRepository;

@Controller
public class BookController {
	    
	//to talk 2 DB
	@Autowired
	private BookRepository bookRepo;
	
	/*This method is used for load the form------
	localhost:9090 or localhost:9090/addBook */
	 
	 
	@GetMapping(value = { "/", "addBook" })                    
	   public String loadForm(Model model)
	   {
		   BookEntity bookObj=new BookEntity();
		   model.addAttribute("book", bookObj);
		   return "addBook";
	   }    
	
	@GetMapping(value = "/editBook")                    
	   public String editBook(@RequestParam("bid") Integer bookId,Model model)
	   {
		   Optional<BookEntity> findById = bookRepo.findById(bookId);
		   if(findById.isPresent())
		   {
			   BookEntity bookObj= findById.get();
			   model.addAttribute("book", bookObj);

			   
		   }
		   return "addBook";
	   }  
	   
  
	/*This method is used for save the book data*/
	    //when the form is submitted i want d book object here(BookEntity book),form data will be captured)
	
	    @PostMapping(value = "/saveBook")
	    public String saveBook(@ModelAttribute("book") BookEntity book, Model model)
	    { 
	    	boolean isNewRecord= false;
	    	
	    	if(book.getBookId() == null)
	    	{
	    		isNewRecord = true;
	    	}
	      BookEntity savedEntity = bookRepo.save(book);
	    	  
	      if(isNewRecord && savedEntity.getBookId() != null){//object and book Id should not be NULL
	    	      model.addAttribute("succMsg", "Book Stored Successfully");   
	    	      
	      }else if(!isNewRecord){
	    	  model.addAttribute("succMsg", "Book Updated Successfully");
	      }else {
	    	  model.addAttribute("failMsg", "Failed to store book");
	      }
	    	return "addBook";
	    }
	    
	    /* This method is used to display all books details
	     * 
	     */
	    
	    @GetMapping(value = "/viewBooks")
	    public String viewBooks(Model model)
	    {
            List<BookEntity> bookList = bookRepo.findAll();// to retrive all the data from the table
	    	
         model.addAttribute("books", bookList);//sending collection to view page
	     return "viewBooks";    	
	    }
	    
	    @GetMapping(value="/deleteBook")
	    public String deleteBook(@RequestParam("bid") Integer bookId)
	    {
            bookRepo.deleteById(bookId);	    	
	    	return "redirect:viewBooks";
	    }
	    
	    	
	   
	

}
