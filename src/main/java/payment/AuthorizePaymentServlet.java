package payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.base.rest.PayPalRESTException;

import vn.iotstar.model.OrderDetail;

/**
 * Servlet implementation class AuthorizePaymentServlet
 */
@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public AuthorizePaymentServlet() {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product = "SP01";//request.getParameter("product");
        String subtotal = "100";//request.getParameter("subtotal");
        String shipping = "10";//request.getParameter("shipping");
        String tax = "10";//request.getParameter("tax");
        String total = "120";//request.getParameter("total");
         
        OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);
 
            response.sendRedirect(approvalLink);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("/views/Payment.jsp").forward(request, response);
        }
    }
}
