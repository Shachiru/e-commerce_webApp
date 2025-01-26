package lk.ijse.aadassignment_01.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.aadassignment_01.config.SessionFactoryConfig;
import lk.ijse.aadassignment_01.entity.User;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login-page")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Session session = SessionFactoryConfig.getInstance().getSession();

        try {
            session.beginTransaction();

            // Create query to find user by username and password
            Query<User> query = session.createQuery(
                    "FROM User WHERE userName = :username AND password = :password",
                    User.class
            );
            query.setParameter("username", username);
            query.setParameter("password", password);

            User user = query.uniqueResult();

            session.getTransaction().commit();

            if (user != null) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("user", user);
                response.sendRedirect("adminHomePage.jsp");
            } else {
                response.sendRedirect("login.jsp?error=invalidCredentials");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=systemError");
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }
}