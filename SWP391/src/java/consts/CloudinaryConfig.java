/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package consts;


import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class CloudinaryConfig {
    public static final String CLOUD_NAME = "";
    public static final String CLOUD_APIKEY = "";
    public static final String API_SECRET = "";
    public static final Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "",
            "api_key", "",
            "api_secret", ""));

    public CloudinaryConfig() {
    }

    public static Cloudinary getCloudinary() {
        return cloudinary;
    }
    
}
