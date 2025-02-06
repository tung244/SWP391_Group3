/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Banner {
   private int banner_id;
   private String banner_name, banner_title , banner_description,banner_status, link_banner;

    public Banner(int banner_id, String banner_name, String banner_title, String banner_description, String banner_status, String link_banner) {
        this.banner_id = banner_id;
        this.banner_name = banner_name;
        this.banner_title = banner_title;
        this.banner_description = banner_description;
        this.banner_status = banner_status;
        this.link_banner = link_banner;
    }

    public int getBanner_id() {
        return banner_id;
    }

    public void setBanner_id(int banner_id) {
        this.banner_id = banner_id;
    }

    public String getBanner_name() {
        return banner_name;
    }

    public void setBanner_name(String banner_name) {
        this.banner_name = banner_name;
    }

    public String getBanner_title() {
        return banner_title;
    }

    public void setBanner_title(String banner_title) {
        this.banner_title = banner_title;
    }

    public String getBanner_description() {
        return banner_description;
    }

    public void setBanner_description(String banner_description) {
        this.banner_description = banner_description;
    }

    public String getBanner_status() {
        return banner_status;
    }

    public void setBanner_status(String banner_status) {
        this.banner_status = banner_status;
    }

    public String getLink_banner() {
        return link_banner;
    }

    public void setLink_banner(String link_banner) {
        this.link_banner = link_banner;
    }
   
}
