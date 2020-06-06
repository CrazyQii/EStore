package com.xmut.estore.dao;

import com.xmut.estore.domain.Comment;

import java.util.List;

public interface CommentDAO {
    public abstract List<Comment> getComment(int computerId);

    public abstract void addComment(Comment comment);
}
