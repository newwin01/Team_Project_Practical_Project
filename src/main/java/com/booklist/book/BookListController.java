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

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String addPost(){
        return "book/addpostform";
    }
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public String upload(@RequestParam("uploadFile") MultipartFile file, HttpServletRequest request, BookListVO vo) throws IOException{
        String uploadFolder = request.getServletContext().getRealPath("upload");
        File dir = new File(uploadFolder);
        if(!dir.exists()) dir.mkdirs();
        String savedFileName = "";
        // 2. 원본 파일 이름 알아오기
        String originalFileName = file.getOriginalFilename();
        // 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
        UUID uuid = UUID.randomUUID();
        savedFileName = uuid.toString() + "_" + originalFileName;
        // 4. 파일 생성
        File file1 = new File(uploadFolder+"/"+savedFileName);
        // 5. 서버로 전송
        file.transferTo(file1);
        System.out.println(uploadFolder+"/"+savedFileName);
        vo.setPhoto(savedFileName);
        return addPostOK(vo);
    }

    public String addPostOK(BookListVO vo)  {

        System.out.println("000");
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
    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editPostOk(BookListVO vo){
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
        File f = new File(path + "/" + filename);
        if(f.exists()) f.delete();

        return "redirect:../list";
    }

}
