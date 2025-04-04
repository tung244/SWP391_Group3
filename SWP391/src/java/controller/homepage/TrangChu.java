

package controller.homepage;

import dal.BannerDAO;
import dal.ContentStoriesDAO;
import dal.DoctorsDAO;
import dal.MachineDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Banner;
import model.ContentStories;
import model.Doctors;
import model.Machine;


@WebServlet(name="TrangChu", urlPatterns={"/trangchu"})
public class TrangChu extends HttpServlet {
    BannerDAO bdao = new BannerDAO();
    MachineDAO mdao = new MachineDAO();
    DoctorsDAO dao = new DoctorsDAO();
    ContentStoriesDAO cdao = new ContentStoriesDAO();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TrangChu</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrangChu at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        List<Banner> blist = bdao.getAllBanner(); //getAll Banner ra ngoai
        request.setAttribute("blist", blist);
        
        List<Machine> machine = mdao.getAllMachine();
        request.setAttribute("machine", machine);
        
        List<ContentStories> content = cdao.getAllContentStories();
        request.setAttribute("content", content);
        
        List<Doctors> listDoctor = dao.getAllDoctors();
        request.setAttribute("doctor", listDoctor);
       
        request.getRequestDispatcher("homepage/index.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
