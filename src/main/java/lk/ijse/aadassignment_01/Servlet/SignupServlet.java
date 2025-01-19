package lk.ijse.aadassignment_01.Servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet(name = "signupServlet", value = "/signup-page")
public class SignupServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/e_commerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";
}
