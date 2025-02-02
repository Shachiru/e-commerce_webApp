package lk.ijse.aadassignment_01.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment_01.dto.UserDTO;

import java.io.IOException;
import java.sql.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminUserServlet", value = {"/admin-users", "/admin-user-delete"})
public class AdminUserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        if ("/admin-user-delete".equals(path)) {
            handleDelete(req, resp);
        } else {
            fetchUsers(req, resp);
        }
    }

    private void fetchUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserDTO> userDTOList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT userId, userName, email FROM users";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                UserDTO userDTO = new UserDTO(
                        rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("email"),
                        null  // Password not needed for display
                );
                userDTOList.add(userDTO);
            }

            req.setAttribute("users", userDTOList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("adminUserPage.jsp");
            requestDispatcher.forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("adminUserPage.jsp?error=" + URLEncoder.encode("Failed to get users: " + e.getMessage(), "UTF-8"));
        }
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int userId = Integer.parseInt(req.getParameter("userId"));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "DELETE FROM users WHERE userId = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, userId);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                resp.sendRedirect("admin-users?success=" + URLEncoder.encode("User deleted successfully", "UTF-8"));
            } else {
                resp.sendRedirect("admin-users?error=" + URLEncoder.encode("Failed to delete user", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-users?error=" + URLEncoder.encode("Failed to delete user: " + e.getMessage(), "UTF-8"));
        }
    }
}