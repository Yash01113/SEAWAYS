import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email=request.getParameter("email");
        String pass=request.getParameter("pword");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/seaways","root","root");
            PreparedStatement ps = con.prepareStatement("Select email from register where Email=? and Password=?");
            PreparedStatement ap = con.prepareStatement("Select email from adlogin where Email=? and Pass=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ap.setString(1, email);
            ap.setString(2, pass);
            ResultSet rs=ps.executeQuery();
            ResultSet r=ap.executeQuery();
            if(r.next() && rs.next()){
                response.sendRedirect("adminpage.html");
            }
            else if(rs.next()){
                PreparedStatement p = con.prepareStatement("insert into login values(?,?)");
                p.setString(1, email);
                p.setString(2, pass);
                p.executeUpdate();
                response.sendRedirect("Cmain.html");
            }
            else{
                response.sendRedirect("index1.html");
            }
        }
        catch(Exception e){
            out.print(e);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
