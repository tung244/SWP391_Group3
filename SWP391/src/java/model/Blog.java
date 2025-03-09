/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Blog {
    private int blog_id;
    private String blog_content;
    private int author_id;
    private String created_date_blog;

    public Blog(int blog_id, String blog_content, int author_id, String created_date_blog) {
        this.blog_id = blog_id;
        this.blog_content = blog_content;
        this.author_id = author_id;
        this.created_date_blog = created_date_blog;
    }

    public Blog(String blog_content, int author_id, String created_date_blog) {
        this.blog_content = blog_content;
        this.author_id = author_id;
        this.created_date_blog = created_date_blog;
    }

    
    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getBlog_content() {
        return blog_content;
    }

    public void setBlog_content(String blog_content) {
        this.blog_content = blog_content;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public String getCreated_date_blog() {
        return created_date_blog;
    }

    public void setCreated_date_blog(String created_date_blog) {
        this.created_date_blog = created_date_blog;
    }
    
    
}
