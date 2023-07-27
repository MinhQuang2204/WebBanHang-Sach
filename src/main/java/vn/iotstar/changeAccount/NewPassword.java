package vn.iotstar.changeAccount;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.connection.DBConnection;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/layout-newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Connection con = new DBConnection().getConnection();
				PreparedStatement pst = con
						.prepareStatement("UPDATE USERS SET users_pass_word = ? WHERE users_username = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("message", "resetSuccess");
				} else {
					request.setAttribute("message", "resetFailed");
				}
				
				String homeOrShip = (String) session.getAttribute("homeOrShip");
				if(homeOrShip.equals("home"))
					response.sendRedirect("layout-Login?mask=login");
				else
					response.sendRedirect("layout-loginAdmin");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			request.setAttribute("message", "Invalid password");
			RequestDispatcher rd = request.getRequestDispatcher("newPassword.jsp");
			rd.forward(request, response);
		}
	}

}
