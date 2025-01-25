package lk.ijse.aadassignment_01.Servlet.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment_01.dto.UserDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserSaveServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserDTO> users = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Print connection details
            System.out.println("Connection successful: " + conn);

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");

            // Check if any results
            if (!rs.isBeforeFirst()) {
                System.out.println("No users found in database");
            }

            while (rs.next()) {
                // Print each row for debugging
                System.out.println("User Row: " +
                        rs.getInt(1) + ", " +
                        rs.getString(2) + ", " +
                        rs.getString(3) + ", " +
                        rs.getString(4)
                );

                users.add(new UserDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                ));
            }

            req.setAttribute("users", users);
            req.getRequestDispatcher("adminUserLoad.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Database error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("userName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (username == null || email == null || password == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement pstmt = conn.prepareStatement(
                         "INSERT INTO users (userName, email, password) VALUES (?, ?, ?)")) {

                pstmt.setString(1, username);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                pstmt.executeUpdate();

                resp.sendRedirect("users");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Insertion error: " + e.getMessage());
        }
    }
}