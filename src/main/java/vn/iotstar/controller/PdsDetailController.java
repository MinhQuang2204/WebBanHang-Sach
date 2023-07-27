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
import vn.iotstar.dao.PdsDetailDAO;
import vn.iotstar.dao.ProductDAO;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.model.CoverTypeModel;
import vn.iotstar.model.PdImageModel;
import vn.iotstar.model.ProductModel;

/**
 * Servlet implementation class PdsDetailController
 */
@WebServlet("/PdsDetail")
public class PdsDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		CategoryDAO categoryDAO = new CategoryDAO();
		PdsDetailDAO pdsDetailDAO = new PdsDetailDAO();
		
		String idString = req.getParameter("psdID");

		// Lay danh sach san pham
		ProductModel product = pdsDetailDAO.getProductDetail(idString);
		CoverTypeModel cover = pdsDetailDAO.getCoverType(idString);
		List<PdImageModel> pdImageModelds = pdsDetailDAO.getImage(idString);

		System.out.println(product);
		req.setAttribute("productDetail", product);
		req.setAttribute("pdImage", pdImageModelds);
		req.setAttribute("cover", cover);
		RequestDispatcher rd = req.getRequestDispatcher("/views/ProductDetail.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
