package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import util.HttpUtil;
import vn.iotstar.dao.CategoryDAO;
import vn.iotstar.model.CategoryModel;

/**
 * Servlet implementation class CategoryAPIController
 */
@WebServlet(urlPatterns = { "/api-admin-category" })
public class CategoryAPIController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * ObjectMapper mapper = new ObjectMapper();
         * req.setCharacterEncoding("UTF-8");
         * resp.setContentType("application/json");
         * List<CategoryModel> list =
         * HttpUtil.of(req.getReader()).ListModel(CategoryModel.class);
         * list = categoryDAO.getAllCategory();
         * mapper.writeValue(resp.getOutputStream(), list);
         */

        resp.setContentType("application/json");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        List<CategoryModel> list = new ArrayList<CategoryModel>();
        list = categoryDAO.getAllCategory();

        Gson gson = new Gson();
        String cateJson = gson.toJson(list);

        PrintWriter out = resp.getWriter();
        out.write(cateJson);
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * ObjectMapper mapper = new ObjectMapper();
         * req.setCharacterEncoding("UTF-8");
         * resp.setContentType("application/json");
         * CategoryModel cateModel =
         * HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
         * cateModel = categoryDAO.insertCategory(cateModel);
         * mapper.writeValue(resp.getOutputStream(), "{Successful}");
         */

        resp.setContentType("application/json");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        CategoryModel cateJson = gson.fromJson(req.getReader(), CategoryModel.class);
        cateJson = categoryDAO.insertCategory(cateJson);
        PrintWriter out = resp.getWriter();
        out.write("Insert successful");
        out.close();
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        CategoryModel cateJson = gson.fromJson(req.getReader(), CategoryModel.class);
        cateJson = categoryDAO.editCategory(cateJson);
        PrintWriter out = resp.getWriter();
        out.write("Edit successful");
        out.close();
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        CategoryModel cateJson = gson.fromJson(req.getReader(), CategoryModel.class);
        categoryDAO.deleteCategory(cateJson.getCategory_id());
        PrintWriter out = resp.getWriter();
        out.write("Delete successful");
        out.close();
    }
}
