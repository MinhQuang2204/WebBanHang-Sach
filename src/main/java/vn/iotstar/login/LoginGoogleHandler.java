package vn.iotstar.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import vn.iotstar.dao.UserDAO;
import vn.iotstar.login.Constants;
import vn.iotstar.model.UserGoogleModel;
import vn.iotstar.model.UserModel;

/**
 * Servlet implementation class LoginGoogleHandler
 */
@WebServlet("/LoginGoogleHandler")
public class LoginGoogleHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String accessToken = getToken(code);
		UserGoogleModel user = getUserInfo(accessToken);
		System.out.println(user);
		
		HttpSession session = request.getSession();
			
		session.setAttribute("name", user.getName());
		session.setAttribute("email", user.getEmail());
		
		UserDAO userDAO = new UserDAO();
		UserModel userModel = userDAO.getUser(user.getEmail());
		
		if(userModel == null) {
			userModel = new UserModel();
			userModel.setUsers_username(user.getEmail());
			userModel.setUsers_last_name(user.getFamily_name());
			userDAO.insertUserGG(userModel);
		}
		userModel = userDAO.getUser(user.getEmail());
		session.setAttribute("account", userModel);	
		session.setAttribute("idUser", userModel.getUserID());
		response.sendRedirect("home");
	}

	public static String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

	public static UserGoogleModel getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();

		UserGoogleModel googlePojo = new Gson().fromJson(response, UserGoogleModel.class);

		return googlePojo;
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// +
	// sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 * 
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 * 
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 * 
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}
