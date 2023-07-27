package vn.iotstar.CartControl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Set;

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
 * Servlet implementation class CartItemRemoveController
 */
@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/member/cart-remove"})
public class CartItemRemoveController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        HttpSession httpSession = req.getSession();
        Object object = httpSession.getAttribute("cart");
        String pId = req.getParameter("pId");
        UserDAO userDAO = new UserDAO();
        CartDAO cartDAO = new CartDAO();
        
        String acc = (String)httpSession.getAttribute("email");
        if(object != null) {
        	UserModel userModel = userDAO.getUser(acc);
            CartModel cartModel = cartDAO.getCartByUserId(userModel.getUserID());
            
            @SuppressWarnings("unchecked")
            Map<Integer, CartItemsModel> map = (Map<Integer, CartItemsModel>)object;
            
            map.remove(Integer.parseInt(pId));
            
            Set<Integer> set = map.keySet();
            PrintWriter out = resp.getWriter();
            
            httpSession.setAttribute("cart", map);
            
            CartItemsDAO cartItemsDAO = new CartItemsDAO();
            cartItemsDAO.delete(cartModel.getCart_id(), Integer.parseInt(pId));

        }        
        resp.sendRedirect(req.getContextPath() + "/showCart");
	}
}
