
import DAL.ProductsDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Category;
import model.Products;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author MyPC
 */
public class test {

    public static void main(String[] args) {
//        ProductsDAO dao = new ProductsDAO();
//        ArrayList<Products> products = new ArrayList<Products>();
//        products = dao.getProducts();
//        for (Products product : products) {
//            System.out.println(product.getId());
//        }
//
//        ArrayList<Category> cata = new ArrayList<Category>();
//        cata = dao.getCatagory();
//        for (Category cataa : cata) {
//            System.out.println(cataa.getName());
//        }
        int productId = 0;
        for (int i = 0; i < 10; i++) {
            productId = i;
        }

        HttpSession session = request.getSession();
            int productId = Integer.parseInt(request.getParameter("productId"));
            //map    productId | cart
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }

            if (carts.containsKey(productId)) {//sản phẩm đã có trên giỏ hàng
                int oldQuantity = carts.get(productId).getQuantity();
                carts.get(productId).setQuantity(oldQuantity + 1);
            } else {//sản phẩm chưa có trên giỏ hàng
                Product product = new ProductDAO().getProductById(productId);
                carts.put(productId, Cart.builder().product(product).quantity(1).build());
            }
            //lưu carts lên session
            session.setAttribute("carts", carts);
        System.out.println(cart.size());
    }
}
