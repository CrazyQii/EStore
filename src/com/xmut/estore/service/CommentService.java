package com.xmut.estore.service;

import com.xmut.estore.dao.CommentDAO;
import com.xmut.estore.dao.impl.CommentDAOImpl;
import com.xmut.estore.domain.Comment;

import java.util.List;

public class CommentService {
    private CommentDAO commentDAO = new CommentDAOImpl();

    public List<Comment> getComment(int computerId) {
        return commentDAO.getComment(computerId);
    }

    public void addComment(Comment comment) {
        commentDAO.addComment(comment);
    }
}
