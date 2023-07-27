package vn.iotstar.changeAccount;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.dao.StoreDAO;
import vn.iotstar.dao.UserDAO;
import vn.iotstar.model.StoreModel;
import vn.iotstar.model.UserModel;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/layout-ValidateOtp")
public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		int value = Integer.parseInt(request.getParameter("otp"));
		HttpSession session = request.getSession();
		int otp = (int) session.getAttribute("otp");

		RequestDispatcher dispatcher = null;
		String mask = (String) session.getAttribute("mask");

		if (value == otp && mask.equals("SMS")) {
			String userName = (String) session.getAttribute("userName");
			String pass = (String) session.getAttribute("pass");
			String fullname = (String) session.getAttribute("fullname");
			String[] arrOfStr = fullname.split(" ", 2);			  	       
			
			UserDAO userDAO = new UserDAO();
			UserModel userModel = new UserModel();
			userModel.setUsers_username(userName);
			userModel.setUsers_pass_word(pass);
			String roleShipper = (String) session.getAttribute("roleShipper");
			if(roleShipper.equals("roleShipper"))
				userModel.setRole(3);
			else
				userModel.setRole(0);
			userModel.setUsers_last_name(arrOfStr[0]);
			userModel.setUsers_first_name(arrOfStr[1]);
			userDAO.insertUsers(userModel);
			
			request.setAttribute("email", request.getParameter("email"));
			request.setAttribute("status", "success");
			
			if(roleShipper.equals("roleShipper")) {
				
				response.sendRedirect("layout-loginAdmin");
			}				
			else {
				session.removeAttribute("roleShipper");
				response.sendRedirect("layout-Login?mask=login");
			}
				

		} else if (value == otp && mask.equals("Seller")) {
			String userName = (String) session.getAttribute("email");

			UserDAO userDAO = new UserDAO();
			UserModel user = userDAO.getUser(userName);
			
			if(user != null) {
				if(user.getRole() == 0) {
					user.setRole(2);
					userDAO.editRole(user);
					
					StoreDAO storeDAO = new StoreDAO();
					StoreModel store = storeDAO.getUserID(user.getUserID());
					if(store == null) {
						store = new StoreModel();
						store.setStoreName((String)session.getAttribute("nameShop"));
						store.setAddressStore((String)session.getAttribute("addShop"));
						store.setUserID(user.getUserID());
						storeDAO.insert(store);
					}
					session.removeAttribute("nameShop");
					session.removeAttribute("addShop");
				}				
			} /*
				 * else if (user == null) { user = new UserModel();
				 * user.setUsers_username(userName); user.setUsers_pass_word(pass);
				 * user.setRole(1); userDAO.insertUser(user); }
				 */
			
			response.sendRedirect("seller-register-complete");
			
		} else if (value == otp && mask.equals("EmailOTP")) {
			request.setAttribute("email", request.getParameter("email"));
			request.setAttribute("status", "success");

			dispatcher = request.getRequestDispatcher("newPassword.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("message", "Wrong OTP");

			dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
			dispatcher.forward(request, response);

		}
	}
}
