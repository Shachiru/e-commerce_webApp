package lk.ijse.aadassignment_01.Servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet(name = "loginServlet", value = "/login-page")
public class LoginServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/e_commerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";
}
