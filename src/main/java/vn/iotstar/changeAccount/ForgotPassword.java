package vn.iotstar.changeAccount;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/layout-forgotPassword")
public class ForgotPassword extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		int otpvalue = 0;
		HttpSession mySession = request.getSession();
		mySession.setAttribute("mask", "EmailOTP");

		UserDAO userDAO = new UserDAO();
		UserModel userModel = userDAO.getUser(email);
		if (userModel == null) {
			request.setAttribute("status", "Account invalid!!");
			response.sendRedirect("Login");
		}

		else if (email != null || !email.equals("")) {
			// sending otp
			/*
			 * Random rand = new Random(); otpvalue = rand.nextInt(1255650);
			 * 
			 * String to = email;// change accordingly // Get the session object Properties
			 * props = new Properties(); props.put("mail.smtp.host", "smtp.gmail.com");
			 * props.put("mail.smtp.socketFactory.port", "465");
			 * props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			 * props.put("mail.smtp.auth", "true"); props.put("mail.smtp.port", "465");
			 * Session session = Session.getDefaultInstance(props, new
			 * javax.mail.Authenticator() { protected PasswordAuthentication
			 * getPasswordAuthentication() { return new
			 * PasswordAuthentication("nguyenngochai056@gmail.com", "zfkbfnibmqpctkpt");//
			 * Put your // email // id and // password here } }); // compose message try {
			 * MimeMessage message = new MimeMessage(session); message.setFrom(new
			 * InternetAddress(email));// change accordingly
			 * message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			 * message.setSubject("Hello"); message.setText("Your OTP is: " + otpvalue); //
			 * send message Transport.send(message);
			 * System.out.println("message sent successfully"); }
			 * 
			 * catch (MessagingException e) { throw new RuntimeException(e); }
			 */
			
			int otp = new SMSOTP().genOTP(6, email);
			mySession.setAttribute("otp", otp);			
			
			String roleShipper = (String) request.getParameter("mask");
			
			if(roleShipper.equals("1"))
				mySession.setAttribute("homeOrShip", "shipper");
			else
				mySession.setAttribute("homeOrShip", "home");
			dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
			request.setAttribute("message", "OTP is sent to your email id");
			// request.setAttribute("connection", con);
			//mySession.setAttribute("otp", otpvalue);
			mySession.setAttribute("email", email);
			dispatcher.forward(request, response);
			// request.setAttribute("status", "success");
		}

	}

}
