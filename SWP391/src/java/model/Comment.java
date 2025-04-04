/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Comment {
    private int comment_blog_id;
    private String comment;
    private Account author;
    private int tuongtac;
    private int parent_comment_id;
    private Blog blog;
    private String comment_date;
    private String comment_name;

    public Comment(int comment_blog_id, String comment, Account author, int tuongtac, int parent_comment_id, Blog blog, String comment_date, String comment_name) {
        this.comment_blog_id = comment_blog_id;
        this.comment = comment;
        this.author = author;
        this.tuongtac = tuongtac;
        this.parent_comment_id = parent_comment_id;
        this.blog = blog;
        this.comment_date = comment_date;
        this.comment_name = comment_name;
    }

    public Comment(int comment_blog_id, String comment, Account author, int tuongtac, int parent_comment_id, Blog blog, String comment_name) {
        this.comment_blog_id = comment_blog_id;
        this.comment = comment;
        this.author = author;
        this.tuongtac = tuongtac;
        this.parent_comment_id = parent_comment_id;
        this.blog = blog;
        this.comment_name = comment_name;
    }

    public Comment(int comment_blog_id, String comment, Account author, int tuongtac, int parent_comment_id, Blog blog) {
        this.comment_blog_id = comment_blog_id;
        this.comment = comment;
        this.author = author;
        this.tuongtac = tuongtac;
        this.parent_comment_id = parent_comment_id;
        this.blog = blog;
    }

    public Comment(String comment, Account author, int tuongtac, int parent_comment_id, Blog blog) {
        this.comment = comment;
        this.author = author;
        this.tuongtac = tuongtac;
        this.parent_comment_id = parent_comment_id;
        this.blog = blog;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }

    public String getComment_name() {
        return comment_name;
    }

    public void setComment_name(String comment_name) {
        this.comment_name = comment_name;
    }

    public int getComment_blog_id() {
        return comment_blog_id;
    }

    public void setComment_blog_id(int comment_blog_id) {
        this.comment_blog_id = comment_blog_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Account getAuthor() {
        return author;
    }

    public void setAuthor(Account author) {
        this.author = author;
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

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }
    
    
}
