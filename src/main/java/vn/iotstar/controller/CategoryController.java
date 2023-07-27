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
 * Servlet implementation class CategoryController
 */
@WebServlet(urlPatterns = {"/Category", "/category"})
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		CategoryDAO categoryDAO = new CategoryDAO();
		ProductDAO productDAO = new ProductDAO();
		
		String cgID = req.getParameter("cid");
		String indexPage = req.getParameter("index");
		if(indexPage == null){
			indexPage = "1";
		}
		
		int index = Integer.parseInt(indexPage);
		int count = categoryDAO.getTotalProduct(cgID);
		int endPage = count / 10;
		if(count % 10 != 0){
			endPage++;
		}

		// Lay danh sach san pham
		List<ProductModel> listGetProductsByID = categoryDAO.getProductsByID(cgID);
		List<CategoryModel> listCategorys = categoryDAO.getAllCategory();
		List<ProductModel> listPagingProduct = categoryDAO.pagingCategory(cgID, index);
		CategoryModel categoryName = categoryDAO.getCategoryName(cgID);
		
		req.setAttribute("endP", endPage);
		req.setAttribute("tag", index);
		req.setAttribute("ListP", listPagingProduct);
		
		req.setAttribute("listCategory", listCategorys);
		req.setAttribute("categoryName", categoryName);
		RequestDispatcher rd = req.getRequestDispatcher("/views/Category.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}