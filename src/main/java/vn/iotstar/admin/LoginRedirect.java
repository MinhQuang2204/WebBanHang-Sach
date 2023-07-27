package vn.iotstar.admin;

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
 * Servlet implementation class LoginRedirect
 */
@WebServlet("/admin-redirect")
public class LoginRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		HttpSession mySession = req.getSession();

		UserDAO userDAO = new UserDAO();
		UserModel userModel = userDAO.checkAccount(userName, password);

		// ACLUserDAO aclUserDAO = new ACLUserDAO();
		// ACLUserModel aclUserModel = aclUserDAO.getRoleSellerByName(userName);
		// Pour data into cart

		if (userModel != null && userModel.getRole() == 3 || userModel != null && userModel.getRole() == 4) {
			mySession.setAttribute("adAccount", userModel);
			mySession.setAttribute("adEmail", userName);
			mySession.setAttribute("adIdUser", userModel.getUserID());
			mySession.setAttribute("adName", userModel.getUsers_first_name() + " " + userModel.getUsers_last_name());			
			
			if(userModel.getRole() == 3) {
				resp.sendRedirect("admin-shipper");
			}
			if(userModel.getRole() == 4) {
				resp.sendRedirect("admin-account");
			}
			
			
		} else {
			mySession.setAttribute("alert", "Sai thông tin đăng nhập!!!");
			resp.sendRedirect("layout-loginAdmin");
		};
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}


}
