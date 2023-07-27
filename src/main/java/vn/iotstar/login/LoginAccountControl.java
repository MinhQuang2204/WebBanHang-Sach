package vn.iotstar.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.iotstar.dao.CartDAO;
import vn.iotstar.dao.CartItemsDAO;
import vn.iotstar.dao.UserDAO;
import vn.iotstar.model.CartItemsModel;
import vn.iotstar.model.CartModel;
import vn.iotstar.model.UserModel;

/**
 * Servlet implementation class LoginAccountControl
 */
@WebServlet("/loginAccount")
public class LoginAccountControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(req, resp);
	}

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
		Object object = mySession.getAttribute("cart");

		if (userModel != null) {
			if(userModel.getRole() != -1) {
				mySession.setAttribute("account", userModel);
				mySession.setAttribute("email", userName);
				mySession.setAttribute("idUser", userModel.getUserID());
				mySession.setAttribute("name", userModel.getUsers_first_name() + " " + userModel.getUsers_last_name());

				CartDAO cartDAO = new CartDAO();
				CartModel cartModel = cartDAO.getCartByUserId(userModel.getUserID());

				if (cartModel == null) {
					cartModel = new CartModel();
					cartModel.setBuyer(userModel);
					cartDAO.insertCart(cartModel);
				}

				CartItemsDAO cartItemsDAO = new CartItemsDAO();
				List<CartItemsModel> cartItemsModel = cartItemsDAO.get(cartModel.getCart_id());

				if (object == null) {
					Map<Integer, CartItemsModel> map = new HashMap<Integer, CartItemsModel>();
					for (CartItemsModel items : cartItemsModel) {
						map.put(items.getProduct().getId(), items);
					}
					mySession.setAttribute("cart", map);
				}

				resp.sendRedirect("home");
			}
			else {
				mySession.setAttribute("alert", "Tài khoản đã bị khóa!!!");
				resp.sendRedirect("layout-Login?mask=login");
			}

		} else {
			mySession.setAttribute("alert", "Sai thông tin đăng nhập!!!");
			resp.sendRedirect("layout-Login?mask=login");
		}
	}
}
