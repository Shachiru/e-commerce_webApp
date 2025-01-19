package lk.ijse.aadassignment_01.Servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.aadassignment_01.dto.CategoryDTO;

import java.io.IOException;
import java.util.Base64;

@WebServlet("/category")
@MultipartConfig
public class CategoryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Parse form fields
            String idString = request.getParameter("id");
            Part imagePart = request.getPart("image");
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            // Convert the image to Base64
            String base64Image = null;
            if (imagePart != null && imagePart.getSize() > 0) {
                base64Image = Base64.getEncoder().encodeToString(imagePart.getInputStream().readAllBytes());
            }

            // Parse and validate the ID
            int id = idString != null ? Integer.parseInt(idString) : 0;

            // Create and populate the Product object
            CategoryDTO product = new CategoryDTO();
            product.setId(id);
            product.setImage(base64Image);
            product.setName(name);
            product.setDescription(description);

            // TODO: Save the Product object to the database or perform other business logic
            // For now, just output the data
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\",\"message\":\"Product saved successfully\"}");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\",\"message\":\"An error occurred: " + e.getMessage() + "\"}");
        }
    }
}