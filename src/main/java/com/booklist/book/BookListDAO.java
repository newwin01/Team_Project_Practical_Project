package com.booklist.book;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookListDAO {
    @Autowired
    SqlSession sqlSession;

    public int insertBookList(BookListVO vo){
        int result = sqlSession.insert("Book.insertBook",vo);
        return result;
    }

    public int deleteBookList(int seq) {
        int result = sqlSession.delete("Book.deleteBook",seq);
        return result;
    }
    public int updateBookList(BookListVO vo) {
        int result = sqlSession.update("Book.updateBook",vo);
        return result;
    }

    public BookListVO getBook(int seq){
        BookListVO one = sqlSession.selectOne("Book.getBook",seq);
        return one;
    }

    public List<BookListVO> getBookList() {
        List<BookListVO> list = sqlSession.selectList("Book.getBookList");
        return list;
    }
    public List<BookListVO> getBookListSort() {
        List<BookListVO> list = sqlSession.selectList("Book.getBookListMonth");
        return list;
    }
}
