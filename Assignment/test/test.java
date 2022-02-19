
import DAL.ProductsDAO;
import java.util.ArrayList;
import model.Catagory;
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
        ProductsDAO dao = new ProductsDAO();
        ArrayList<Products> products = new ArrayList<Products>();
        products = dao.getProducts();
        for (Products product : products) {
            System.out.println(product.getTitle());
        }

        ArrayList<Catagory> cata = new ArrayList<Catagory>();
        cata = dao.getCatagory();
        for (Catagory cataa : cata) {
            System.out.println(cataa.getCname());
        }
    }
}
