package com.booklist.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping(value = "/book")
public class BookListController {
    @Autowired
    BookListService bookListService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String boardList(Model model){
        model.addAttribute("list",bookListService.getBookList());

        return "book/list";
    }

    @RequestMapping(value = "/listsort", method = RequestMethod.GET)
    public String boardListSort(Model model){
        model.addAttribute("list",bookListService.getBookListSort());
        return "book/listsort";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchPost(@RequestParam("keyword")String keyword,Model model){
        System.out.println(keyword);
        model.addAttribute("list",bookListService.searchBookList(keyword));
        return "book/searchlist";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String addPost(){
        return "book/addpostform";
    }
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public String upload(@RequestParam("uploadFile") MultipartFile file, HttpServletRequest request, BookListVO vo) throws IOException{
        String uploadFolder = request.getServletContext().getRealPath("upload");
        System.out.println(uploadFolder);
        File dir = new File(uploadFolder);
        if(!dir.exists()) dir.mkdirs();
        String savedFileName = "";
        String originalFileName = file.getOriginalFilename();
        if(!originalFileName.isEmpty()){
            UUID uuid = UUID.randomUUID();
            savedFileName = uuid.toString() + "_" + originalFileName;
            File file1 = new File(uploadFolder+"/"+savedFileName);
            file.transferTo(file1);
            vo.setPhoto(savedFileName);
        }
        return addPostOK(vo);
    }

    public String addPostOK(BookListVO vo)  {
        int i = bookListService.insertBook(vo);
        if(i==0)
            System.out.println("실패");
        else
            System.out.println("성공");
        return "redirect:list";
    }


    @RequestMapping(value = "/editform/{id}",method = RequestMethod.GET)
    public String editPost(@PathVariable("id") int id, Model model){
        BookListVO bookListVO = bookListService.getBook(id);
        model.addAttribute("u",bookListVO);
        return "book/editform";
    }
    @RequestMapping(value = "/fileUploadEdit",method = RequestMethod.POST)
    public String uploadEdit(@RequestParam("uploadFile") MultipartFile file, HttpServletRequest request, BookListVO vo) throws IOException{
        String uploadFolder = request.getServletContext().getRealPath("upload");
        File dir = new File(uploadFolder);
        if(!dir.exists()) dir.mkdirs();
        System.out.println(vo.getPhoto());
        String savedFileName = "";
        String originalFileName = file.getOriginalFilename();
        System.out.println(originalFileName);
        if(!originalFileName.isEmpty()){
            UUID uuid = UUID.randomUUID();
            savedFileName = uuid.toString() + "_" + originalFileName;
            File file1 = new File(uploadFolder+"/"+savedFileName);
            file.transferTo(file1);
            vo.setPhoto(savedFileName);
        } else{
            vo.setPhoto(null);
        }
        return editPostOk(vo);
    }
    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editPostOk(BookListVO vo){
        System.out.println(vo.getTitle());
        System.out.println(vo.getPay_method());
        if(bookListService.updateBook(vo)==0)
            System.out.println("실패");
        else
            System.out.println("성공");
        return "redirect:list";
    }
    @RequestMapping(value = "/deleteok/{id}",method = RequestMethod.GET)
    public String deletePostOk(@PathVariable("id") int id, HttpServletRequest request){
        BookListVO vo = bookListService.getBook(id);
        if(bookListService.deleteBook(id)==0)
            System.out.println("데이터 삭제 실패");
        else
            System.out.println("데이터 삭제 성공");
        String path;
        String filename = vo.getPhoto();
        System.out.println(filename);
        path = request.getServletContext().getRealPath("upload");
        System.out.println(path);
        File f = new File(path + "/" + filename);
        if(f.exists()) f.delete();

        return "redirect:../list";
    }

}
