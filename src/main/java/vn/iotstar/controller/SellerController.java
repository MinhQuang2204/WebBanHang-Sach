package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.dao.UserDAO;
import vn.iotstar.model.UserModel;

/**
 * Servlet implementation class SellerController
 */
@WebServlet("/Seller")
public class SellerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("email");

		UserDAO userDAO = new UserDAO();
		UserModel user = userDAO.getUser(username);

		if (user != null) {
			if (user.getRole() == 1 || user.getRole() == 2) {
				req.getRequestDispatcher("/viewSeller/SProfile.jsp").forward(req, resp);
			}else {
	    		req.getRequestDispatcher("/views/WelcomSeller.jsp").forward(req, resp);
			}
		} else {
			req.getRequestDispatcher("/views/WelcomSeller.jsp").forward(req, resp);
		}
	}
}
