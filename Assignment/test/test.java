
import DAL.ProductsDAO;
import java.util.ArrayList;
import java.util.Scanner;
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
        ProductsDAO dao = new ProductsDAO();
        ArrayList<Cart> cart = new ArrayList<>();

        while (productId < 10) {
            Scanner sc = new Scanner(System.in);
            productId = sc.nextInt();
            if (cart.contains(productId)) {
                int oldQuantity = cart.get(productId).getQuantity();
                cart.get(productId).setQuantity(oldQuantity + 1);
            } else {
                Products products = dao.getProductsByProductsId(productId);
                Cart newCart = new Cart(products, 1);
                cart.add(newCart);
            }

            System.out.println(cart);
        }

    }
}
