package vn.iotstar.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.dao.UserDAO;
import vn.iotstar.model.UserModel;
import vn.iotstar.changeAccount.SMSOTP;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/layout-Signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String flag = req.getParameter("mask");
		HttpSession mySession = req.getSession();

		UserDAO userDAO = new UserDAO();
		UserModel userModel = userDAO.getUser(userName);
		//UserModel userAccount = userDAO.getUser((String)mySession.getAttribute("email"));
		
		// Flag is 0 to signup user account, 1 to signup seller
		if (userModel == null && flag.equals("0")) {
			String name = req.getParameter("fullname");
			
			int otp = new SMSOTP().genOTP(6, userName);
			mySession.setAttribute("otp", otp);
			mySession.setAttribute("mask", "SMS");
			mySession.setAttribute("roleShipper", "role");
			mySession.setAttribute("userName", userName);
			mySession.setAttribute("pass", password);
			mySession.setAttribute("fullname", name);	

			RequestDispatcher rd = req.getRequestDispatcher("EnterOtp.jsp");
			rd.forward(req, resp);
			
		} else if(userModel == null && flag.equals("3")) {
			String name = req.getParameter("fullname");
			
			int otp = new SMSOTP().genOTP(6, userName);
			mySession.setAttribute("otp", otp);
			mySession.setAttribute("mask", "SMS");
			mySession.setAttribute("roleShipper", "roleShipper");
			mySession.setAttribute("userName", userName);
			mySession.setAttribute("pass", password);
			mySession.setAttribute("fullname", name);	

			RequestDispatcher rd = req.getRequestDispatcher("EnterOtp.jsp");
			rd.forward(req, resp);
			
		}else if (flag.equals("1")) {
			/*
			 * if(userAccount != null) { if(userAccount.getRole() == 1 ||
			 * userAccount.getRole() == 2) { mySession.setAttribute("alert",
			 * "Tài khoản đã được đăng kí!!!");
			 * req.getRequestDispatcher("Seller-Registation").forward(req, resp); return; }
			 * }
			 */
			String nameShop = req.getParameter("nameShop");
			String addShop = req.getParameter("addressShop");
			
			mySession.setAttribute("nameShop", nameShop);
			mySession.setAttribute("addShop", addShop);
			int otp = new SMSOTP().genOTP(6, userName);
			mySession.setAttribute("otp", otp);
			mySession.setAttribute("userName", userName);
			mySession.setAttribute("pass", password);
			mySession.setAttribute("mask", "Seller");
			
			req.getRequestDispatcher("EnterOtp.jsp").forward(req, resp);
			
		} else {
			mySession.setAttribute("ExitAccount", "Tài khoản đã tồn tại!!!");
			resp.sendRedirect("layout-Login?mask=signup");
		}
	}
}
