package com.xmut.estore.dao.impl;

import com.xmut.estore.dao.CommentDAO;
import com.xmut.estore.domain.Comment;

import java.util.List;

public class CommentDAOImpl extends BaseDAO<Comment> implements CommentDAO {
    public  List<Comment> getComment(int computerId) {
        String sql = "select * from comment where computerId = ?";
        return queryForList(sql, computerId);
    }

    public  void addComment(Comment comment) {
        String sql = "insert into comment (user, content, time, computerId) values(?,?,?,?)";
        insert(sql, comment.getUser(), comment.getContent(), comment.getTime(), comment.getComputerId());
    }

}
