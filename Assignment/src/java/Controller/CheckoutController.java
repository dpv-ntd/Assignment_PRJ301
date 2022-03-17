/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.ProductsDAO;
import DAL.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.Shipping;

/**
 *
 * @author MyPC
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
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
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        double totalAmount = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer key = entry.getKey();
            Cart value = entry.getValue();

            totalAmount += value.getQuantity() * value.getProducts().getPrice();
        }
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }
        session.setAttribute("account", account);
        session.setAttribute("totalAmount", totalAmount);
        session.setAttribute("carts", carts);
        session.setAttribute("urlPrev", "checkout");
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
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

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        double totalAmount = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer key = entry.getKey();
            Cart value = entry.getValue();

            totalAmount += value.getQuantity() * value.getProducts().getPrice();
        }

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        Shipping shipping = new Shipping();
        shipping.setName(name);
        shipping.setPhone(phone);
        shipping.setAddress(address);
        ShippingDAO shippingdao = new ShippingDAO();
        int shippingId = new ShippingDAO().InsertAndReturnShippingId(shipping);

        Order order = new Order();
        order.setAccount_id(account.getId());
        order.setShipping_id(shippingId);
        order.setTotalPrice(totalAmount);
        order.setNote(note);
        int orderId = new OrderDAO().InsertAndReturnOrderId(order);

        new OrderDetailDAO().saveCart(orderId, carts);

        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer key = entry.getKey();
            Cart value = entry.getValue();

            int productId = value.getProducts().getId();
            int quantity = value.getProducts().getQuantity() - value.getQuantity();
            new ProductsDAO().updateQuantityProducts(productId, quantity);
        }
        carts.clear();
        response.sendRedirect("thankyou");
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
