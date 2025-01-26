package lk.ijse.aadassignment_01.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment_01.dto.CategoryDTO;
import lk.ijse.aadassignment_01.dto.ProductDTO;

import java.io.IOException;
import java.sql.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminProductServlet", value = {"/admin-product-save", "/admin-products", "/admin-product-delete", "/admin-product-update"})
public class AdminProductServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        if ("/admin-product-delete".equals(path)) {
            handleDelete(req, resp);
        } else {
            fetchProducts(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/admin-product-save".equals(path)) {
            handleSave(req, resp);
        } else if ("/admin-product-update".equals(path)) {
            handleUpdate(req, resp);
        }
    }

    private void fetchProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> productDTOList = new ArrayList<>();
        List<CategoryDTO> categoryDTOList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Fetch categories
            String categorySql = "SELECT categoryId, categoryName FROM categories";
            Statement categoryStm = connection.createStatement();
            ResultSet categoryResultSet = categoryStm.executeQuery(categorySql);

            while (categoryResultSet.next()) {
                CategoryDTO categoryDTO = new CategoryDTO(
                        categoryResultSet.getInt("categoryId"),
                        categoryResultSet.getString("categoryName")
                );
                categoryDTOList.add(categoryDTO);
            }

            // Fetch products with category info
            String productSql = "SELECT p.productId, p.productName, p.qty, p.unitPrice, p.categoryId, " +
                    "c.categoryName " +
                    "FROM products p " +
                    "JOIN categories c ON p.categoryId = c.categoryId";
            Statement productStm = connection.createStatement();
            ResultSet productResultSet = productStm.executeQuery(productSql);

            while (productResultSet.next()) {
                CategoryDTO categoryDTO = new CategoryDTO(
                        productResultSet.getInt("categoryId"),
                        productResultSet.getString("categoryName")
                );

                ProductDTO productDTO = new ProductDTO(
                        productResultSet.getInt("productId"),
                        productResultSet.getString("productName"),
                        productResultSet.getInt("qty"),
                        productResultSet.getDouble("unitPrice"),
                        categoryDTO
                );

                productDTOList.add(productDTO);
            }

            req.setAttribute("products", productDTOList);
            req.setAttribute("categories", categoryDTOList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminProducts.jsp");
            requestDispatcher.forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("adminProducts.jsp?error=" + URLEncoder.encode("Failed to get products: " + e.getMessage(), "UTF-8"));
        }
    }

    private void handleSave(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String productName = req.getParameter("productName");
        int qty = Integer.parseInt(req.getParameter("qty"));
        double unitPrice = Double.parseDouble(req.getParameter("unitPrice"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO products (productName, qty, unitPrice, categoryId) VALUES (?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, productName);
            pstm.setInt(2, qty);
            pstm.setDouble(3, unitPrice);
            pstm.setInt(4, categoryId);

            int i = pstm.executeUpdate();
            if (i > 0) {
                resp.sendRedirect("admin-products?success=" + URLEncoder.encode("Product saved successfully", "UTF-8"));
            } else {
                resp.sendRedirect("admin-products?error=" + URLEncoder.encode("Failed to save product", "UTF-8"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("admin-products?error=" + URLEncoder.encode("Failed to save product: " + e.getMessage(), "UTF-8"));
        }
    }

    private void handleUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int productId = Integer.parseInt(req.getParameter("productId"));
            String productName = req.getParameter("productName");
            int qty = Integer.parseInt(req.getParameter("qty"));
            double unitPrice = Double.parseDouble(req.getParameter("unitPrice"));
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "UPDATE products SET productName = ?, qty = ?, unitPrice = ?, categoryId = ? WHERE productId = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, productName);
            pstmt.setInt(2, qty);
            pstmt.setDouble(3, unitPrice);
            pstmt.setInt(4, categoryId);
            pstmt.setInt(5, productId);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                resp.sendRedirect("admin-products?success=" + URLEncoder.encode("Product updated successfully", "UTF-8"));
            } else {
                resp.sendRedirect("admin-products?error=" + URLEncoder.encode("Failed to update product", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-products?error=" + URLEncoder.encode("Failed to update product: " + e.getMessage(), "UTF-8"));
        }
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int productId = Integer.parseInt(req.getParameter("productId"));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "DELETE FROM products WHERE productId = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, productId);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                resp.sendRedirect("admin-products?success=" + URLEncoder.encode("Product deleted successfully", "UTF-8"));
            } else {
                resp.sendRedirect("admin-products?error=" + URLEncoder.encode("Failed to delete product", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-products?error=" + URLEncoder.encode("Failed to delete product: " + e.getMessage(), "UTF-8"));
        }
    }
}