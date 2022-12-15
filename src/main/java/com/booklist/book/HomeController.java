package com.booklist.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @Autowired
    BookListService bookListService;

    @RequestMapping("/")
    public String Home(){
        return "login";
    }

}
