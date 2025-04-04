/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author fptshop
 */
public class BlogCrawl {
    private String title, content_html, url;

    public BlogCrawl() {
    }

    public BlogCrawl(String title, String content_html, String url) {
        this.title = title;
        this.content_html = content_html;
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent_html() {
        return content_html;
    }

    public void setContent_html(String content_html) {
        this.content_html = content_html;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "BlogCrawl{" + "title=" + title + ", content_html=" + content_html + ", url=" + url + '}';
    }
    
    
}
