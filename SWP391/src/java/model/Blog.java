
package model;


public class Blog {
    private int blog_id;
    private String blog_content;
    private int author_id;
    private String created_date_blog;
    private String title_meta;
    private String title_image_blog;
    private String status_blog;
    private String author_name;
    private int blog_view;

    public Blog(int blog_id, String blog_content, int author_id, String created_date_blog, String title_meta, String title_image_blog, String status_blog, String author_name, int blog_view) {
        this.blog_id = blog_id;
        this.blog_content = blog_content;
        this.author_id = author_id;
        this.created_date_blog = created_date_blog;
        this.title_meta = title_meta;
        this.title_image_blog = title_image_blog;
        this.status_blog = status_blog;
        this.author_name = author_name;
        this.blog_view = blog_view;
    }
    
    public Blog(int blog_id, String blog_content, int author_id, String created_date_blog, String title_meta, String title_image_blog, String status_blog, String author_name) {
        this.blog_id = blog_id;
        this.blog_content = blog_content;
        this.author_id = author_id;
        this.created_date_blog = created_date_blog;
        this.title_meta = title_meta;
        this.title_image_blog = title_image_blog;
        this.status_blog = status_blog;
        this.author_name = author_name;
    }

    public int getBlog_view() {
        return blog_view;
    }

    public void setBlog_view(int blog_view) {
        this.blog_view = blog_view;
    }

    public Blog(int blog_id, String title_meta, String title_image_blog) {
        this.blog_id = blog_id;
        this.title_meta = title_meta;
        this.title_image_blog = title_image_blog;
    }
    

    public Blog(String blog_content, int author_id, String created_date_blog, String title_meta, String title_image_blog, String status_blog) {
        this.blog_content = blog_content;
        this.author_id = author_id;
        this.created_date_blog = created_date_blog;
        this.title_meta = title_meta;
        this.title_image_blog = title_image_blog;
        this.status_blog = status_blog;
    }

    
    public Blog(int blog_id, String blog_content, int author_id, String created_date_blog, String title_meta, String title_image_blog) {
        this.blog_id = blog_id;
        this.blog_content = blog_content;
        this.author_id = author_id;
        this.created_date_blog = created_date_blog;
        this.title_meta = title_meta;
        this.title_image_blog = title_image_blog;
    }

    public Blog(String blog_content, int author_id, String created_date_blog, String title_meta, String title_image_blog) {
        this.blog_content = blog_content;
        this.author_id = author_id;
        this.created_date_blog = created_date_blog;
        this.title_meta = title_meta;
        this.title_image_blog = title_image_blog;
    }
    
    
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

    public Blog(int blog_id, String blog_content, int author_id, String created_date_blog, String title_meta, String title_image_blog, String status_blog) {
        this.blog_id = blog_id;
        this.blog_content = blog_content;
        this.author_id = author_id;
        this.created_date_blog = created_date_blog;
        this.title_meta = title_meta;
        this.title_image_blog = title_image_blog;
        this.status_blog = status_blog;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public String getStatus_blog() {
        return status_blog;
    }

    public void setStatus_blog(String status_blog) {
        this.status_blog = status_blog;
    }

    public String getTitle_meta() {
        return title_meta;
    }

    public void setTitle_meta(String title_meta) {
        this.title_meta = title_meta;
    }

    public String getTitle_image_blog() {
        return title_image_blog;
    }

    public void setTitle_image_blog(String title_image_blog) {
        this.title_image_blog = title_image_blog;
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
