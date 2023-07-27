package vn.iotstar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.dao.ProductDAO;
import vn.iotstar.model.ProductModel;

/**
 * Servlet implementation class LoadMoreController
 */
@WebServlet("/layout-load")
public class LoadMoreController extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        String amount = req.getParameter("exist");
        int amount_to_int= Integer.parseInt(amount);
        ProductDAO productDAO = new ProductDAO();
        
        List<ProductModel> listTop5ComingSoon = productDAO.getNext5NewBook(amount_to_int);
        
        PrintWriter out = resp.getWriter();
        for(ProductModel pd : listTop5ComingSoon ) {
            out.println("<div class=\"newbook col-2-4\">\r\n"
                    + "                                <div class=\"card\">\r\n"
                    + "                                    <a href=\"PdsDetail?psdID="+pd.getId()+"\" class=\"card-item\">\r\n"
                    + "                                        <img src=\""+pd.getImage()+"\" class=\"card-img-top\"\r\n"
                    + "                                        alt=\""+pd.getProductName()+"\">\r\n"
                    + "                                        <div class=\"card-body\">\r\n"
                    + "                                            <h6 class=\"card-title home-product-item__name\">"+pd.getProductName()+"</h6>\r\n"
                    + "                                            <div class=\"home-product-item__price\">\r\n"
                    + "                                                <span class=\"home-product-item__price-old\">\r\n"
                    + "                                                        \r\n"
                    + "                                                        "+(pd.getPrice() + (pd.getPrice() * 0.1))+"</span> <span\r\n"
                    + "                                                    class=\"home-product-item__price-old\">đ</span> <span\r\n"
                    + "                                                    class=\"home-product-item__price-current\">\r\n"
                    + "                                                       \r\n"
                    + "                                                        "+pd.getPrice() +"đ</span>\r\n"
                    + "                                            </div>\r\n"
                    + "                                        </div> \r\n"
                    + "                                    </a>\r\n"
                    + "\r\n"
                    + "                                    <div class=\"card-body card-btn\">\r\n"
                    + "                                        <c:if test=\"${sessionScope.account != null}\">\r\n"
                    + "                                            <a type=\"submit\" onclick=\"buy('"+pd.getId()+"')\"\r\n"
                    + "                                                class=\"card-link\">Thêm vào giỏ hàng</a>\r\n"
                    + "                                        </c:if>\r\n"                                    
                    + "                                    </div>\r\n"
                    + "                                </div>\r\n"
                    + "                            </div>");
        }
            
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
