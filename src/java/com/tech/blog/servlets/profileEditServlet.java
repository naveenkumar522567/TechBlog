package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.HelperClass;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class profileEditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            //Fetch all dat a from form
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String about = request.getParameter("about");

            //part will fetch the file uploaded
            Part part = request.getPart("image");

            //get filename from part variable
            String imageName = part.getSubmittedFileName();

            //get user from session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setEmail(email);
            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);
            
            String oldProfile = user.getProfile();
            user.setProfile(imageName);

            //Updating data in database
            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            boolean ans = dao.updateUser(user);

            if (ans) {

                String path = request.getRealPath("/") + "Pics" + File.separator + user.getProfile();
                String OldFilePath = request.getRealPath("/") + "Pics" + File.separator + oldProfile;

                HelperClass.deleteFile(OldFilePath);

                if (HelperClass.saveFile(part.getInputStream(), path)) {

                    Message msg = new Message("Profile Details Updated... ", "success", "alert-success");

                    s.setAttribute("msg", msg);

                    response.sendRedirect("Profile.jsp");
                } else {
                    Message msg = new Message("Something Went Wrong... ", "error", "alert-danger");

                    s.setAttribute("msg", msg);
                    response.sendRedirect("Profile.jsp");
                }

            } else {

                Message msg = new Message("Something Went Wrong... ", "error", "alert-danger");

                s.setAttribute("msg", msg);
                response.sendRedirect("Profile.jsp");
            }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
