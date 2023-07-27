package vn.iotstar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.dao.UserDAO;
import vn.iotstar.model.UserModel;

/**
 * Servlet implementation class AdminAccountController
 */
@WebServlet("/admin-deleteUser")
public class AdminAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void proccessRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		String userName = (String) req.getParameter("idUser");
		
		System.out.println("ngochai: " + userName);

		UserDAO userDAO = new UserDAO();
		UserModel user = userDAO.getUser(userName);

		if (user != null) {
			user.setRole(-1);
			userDAO.editRole(user);
		}

		resp.sendRedirect("admin-account");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		proccessRequest(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		proccessRequest(req, resp);
	}
}
