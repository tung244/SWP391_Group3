/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package consts;


import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class CloudinaryConfig {
    public static final String CLOUD_NAME = "djmftornv";
    public static final String CLOUD_APIKEY = "152551622332294";
    public static final String API_SECRET = "EVyiCbsCBTjGgjvB3dVfsEtGkXE";
    public static final Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "djmftornv",
            "api_key", "152551622332294",
            "api_secret", "EVyiCbsCBTjGgjvB3dVfsEtGkXE"));

    public CloudinaryConfig() {
    }

    public static Cloudinary getCloudinary() {
        return cloudinary;
    }
    
}
