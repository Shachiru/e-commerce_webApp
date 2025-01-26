package lk.ijse.aadassignment_01.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment_01.dto.CategoryDTO;

import java.io.IOException;
import java.sql.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminCategoryServlet", value = {"/admin-category-save", "/admin-categories", "/admin-category-delete", "/admin-category-update"})
public class AdminCategoryServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        if ("/admin-category-delete".equals(path)) {
            handleDelete(req, resp);
        } else {
            fetchCategories(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/admin-category-save".equals(path)) {
            handleSave(req, resp);
        } else if ("/admin-category-update".equals(path)) {
            handleUpdate(req, resp);
        }
    }

    private void fetchCategories(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> categoryDTOList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM categories";
            Statement stm = connection.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);

            System.out.println("Fetching categories...");

            while (resultSet.next()) {
                CategoryDTO categoryDTO = new CategoryDTO(
                        resultSet.getInt(1),
                        resultSet.getString(2)
                );
                categoryDTOList.add(categoryDTO);
                System.out.println("Added category: " + categoryDTO.getCategoryId() + " - " + categoryDTO.getCategoryName());
            }

            System.out.println("Total categories found: " + categoryDTOList.size());

            req.setAttribute("categories", categoryDTOList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminCategories.jsp");
            requestDispatcher.forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("adminCategories.jsp?error=" + URLEncoder.encode("Failed to get categories: " + e.getMessage(), "UTF-8"));
        }
    }

    private void handleSave(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String categoryName = req.getParameter("categoryName");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO categories (categoryName) VALUES (?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, categoryName);

            int i = pstm.executeUpdate();
            if (i > 0) {
                resp.sendRedirect("admin-categories?success=" + URLEncoder.encode("Category saved successfully", "UTF-8"));
            } else {
                resp.sendRedirect("admin-categories?error=" + URLEncoder.encode("Failed to save category", "UTF-8"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("admin-categories?error=" + URLEncoder.encode("Failed to save category: " + e.getMessage(), "UTF-8"));
        }
    }

    private void handleUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            String categoryName = req.getParameter("categoryName");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "UPDATE categories SET categoryName = ? WHERE categoryId = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, categoryName);
            pstmt.setInt(2, categoryId);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                resp.sendRedirect("admin-categories?success=" + URLEncoder.encode("Category updated successfully", "UTF-8"));
            } else {
                resp.sendRedirect("admin-categories?error=" + URLEncoder.encode("Failed to update category", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-categories?error=" + URLEncoder.encode("Failed to update category: " + e.getMessage(), "UTF-8"));
        }
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "DELETE FROM categories WHERE categoryId = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, categoryId);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                resp.sendRedirect("admin-categories?success=" + URLEncoder.encode("Category deleted successfully", "UTF-8"));
            } else {
                resp.sendRedirect("admin-categories?error=" + URLEncoder.encode("Failed to delete category", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-categories?error=" + URLEncoder.encode("Failed to delete category: " + e.getMessage(), "UTF-8"));
        }
    }
}