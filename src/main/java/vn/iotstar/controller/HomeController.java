package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao.CategoryDAO;
import vn.iotstar.dao.ProductDAO;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.model.ProductModel;

/**
 * Servlet implementation class HomeControl
 */
@WebServlet(urlPatterns = {"/home", "/trang-chu"})
public class HomeController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse   resp)throws ServletException, IOException {
    	resp.setContentType("text/html");
    	resp.setCharacterEncoding("UTF-8");
    	req.setCharacterEncoding("UTF-8");
    	
		ProductDAO productDAO = new ProductDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		
		// Lay danh sach san pham
		List<ProductModel> listTop10Products = productDAO.getTop10Products();
		List<ProductModel> displayProduct = productDAO.getDisplayProducts();
		System.out.println(displayProduct);
		// Lay danh sach the loai
		List<CategoryModel> listCategorys = categoryDAO.getAllCategory();
		
		req.setAttribute("listTop10Product", listTop10Products);
		req.setAttribute("displayProduct", displayProduct);
		req.setAttribute("listCategory", listCategorys);
		RequestDispatcher rd = req.getRequestDispatcher("/views/Trangchu.jsp");
		rd.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	super.doPost(req, resp);
    }
}