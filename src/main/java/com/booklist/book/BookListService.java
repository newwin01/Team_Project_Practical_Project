package com.booklist.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookListService implements IBookListService{
    @Autowired
    BookListDAO bookListDAO;


    @Override
    public int insertBook(BookListVO vo) {
        return bookListDAO.insertBookList(vo);
    }

    @Override
    public int deleteBook(int seq) {
        return bookListDAO.deleteBookList(seq);
    }

    @Override
    public int updateBook(BookListVO vo) {
        return bookListDAO.updateBookList(vo);
    }

    @Override
    public BookListVO getBook(int seq) {
        return bookListDAO.getBook(seq);
    }

    @Override
    public List<BookListVO> getBookList() {
        return bookListDAO.getBookList();
    }

    public List<BookListVO> getBookListSort() {
        return bookListDAO.getBookListSort();
    }

    @Override
    public List<BookListVO> searchBookList(String keyword) {
        System.out.println(keyword);
        return bookListDAO.searchBookList(keyword);
    }
}
