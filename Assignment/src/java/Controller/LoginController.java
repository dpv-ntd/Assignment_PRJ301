/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author MyPC
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();

        String user = null;
        String pass = null;

        Cookie[] cookies = request.getCookies();
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("username")) {
                user = cooky.getValue();
            }
            if (cooky.getName().equals("password")) {
                pass = cooky.getValue();
            }
            if (user != null && pass != null) {
                break;
            }
        }

        if (user != null && pass != null) {
            Account account = new AccountDAO().getAccount(user, pass);
            if (account != null) {
                session.setAttribute("account", account);
                String urlPrev = (String) request.getSession().getAttribute("urlPrev");
                if (urlPrev == null) {
                    urlPrev = "home";
                }
                response.sendRedirect(urlPrev);
                return;
            }
        }

        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        HttpSession session = request.getSession();

        AccountDAO dao = new AccountDAO();
        Account account = dao.getAccount(username, password);

        if (account != null) {
            if (account.getBlock().equals("yes")) {
                request.setAttribute("notify", "Your account has been banned.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }
            if (remember != null) {
                Cookie c_user = new Cookie("username", username);
                Cookie c_pass = new Cookie("password", password);
                c_user.setMaxAge(60 * 60 * 24);
                c_pass.setMaxAge(60 * 60 * 24);
                response.addCookie(c_pass);
                response.addCookie(c_user);
            }
            session.setAttribute("account", account);

            String urlPrev = (String) request.getSession().getAttribute("urlPrev");
            if (urlPrev == null) {
                urlPrev = "home";
            }
            response.sendRedirect(urlPrev);

        } else {
            request.setAttribute("notify", "Login information is incorrect");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
