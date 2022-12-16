package com.booklist.book;

import java.util.List;

public interface IBookListService {
    public int insertBook(BookListVO vo);
    public int deleteBook(int seq);
    public int updateBook(BookListVO vo);
    public BookListVO getBook(int seq);
    public List<BookListVO> getBookList();
    List<BookListVO> searchBookList(String keyword);
}
