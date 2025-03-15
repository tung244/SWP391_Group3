/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author fptshop
 */
public class Comment {
    private int blog_id, comment_blog_id,author_id, tuongtac, parent_comment_id;
    private String comment;

    public Comment(int blog_id, int author_id, int tuongtac, String comment) {
        this.blog_id = blog_id;
        this.author_id = author_id;
        this.tuongtac = tuongtac;
        this.comment = comment;
    }


    public Comment(int comment_blog_id, int blog_id,  int author_id, int tuongtac, int parent_comment_id, String comment) {
        this.blog_id = blog_id;
        this.comment_blog_id = comment_blog_id;
        this.author_id = author_id;
        this.tuongtac = tuongtac;
        this.parent_comment_id = parent_comment_id;
        this.comment = comment;
    }

    public Comment(int blog_id, int author_id, int tuongtac, int parent_comment_id, String comment) {
        this.blog_id = blog_id;
        this.author_id = author_id;
        this.tuongtac = tuongtac;
        this.parent_comment_id = parent_comment_id;
        this.comment = comment;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public int getComment_blog_id() {
        return comment_blog_id;
    }

    public void setComment_blog_id(int comment_blog_id) {
        this.comment_blog_id = comment_blog_id;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public int getTuongtac() {
        return tuongtac;
    }

    public void setTuongtac(int tuongtac) {
        this.tuongtac = tuongtac;
    }

    public int getParent_comment_id() {
        return parent_comment_id;
    }

    public void setParent_comment_id(int parent_comment_id) {
        this.parent_comment_id = parent_comment_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Comment{" + "blog_id=" + blog_id + ", comment_blog_id=" + comment_blog_id + ", author_id=" + author_id + ", tuongtac=" + tuongtac + ", parent_comment_id=" + parent_comment_id + ", comment=" + comment + '}';
    }
    
}
