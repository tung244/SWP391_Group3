/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.filemanager;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;

@WebServlet(name = "DeleteImage", urlPatterns = {"/admin/delete_image"})
public class DeleteImage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filename = request.getParameter("name");
        String folder = request.getParameter("folder");
        String pathHost = getServletContext().getRealPath("");
        String finalPath = pathHost.replace("build\\", "") + File.separator + folder;

        File file = new File(finalPath + File.separator + filename);
        String ms = "";

        if (file.exists() && file.delete()) {
            ms = "Xóa file " + filename + " thành công";
        } else {
            ms = "Không thể xóa file " + filename;
        }

        request.getSession().setAttribute("ms", ms);
        response.sendRedirect("file_manager");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
