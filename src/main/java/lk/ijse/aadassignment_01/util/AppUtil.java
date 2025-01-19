package lk.ijse.aadassignment_01.util;
import jakarta.servlet.http.Part;
import java.util.Base64;
import java.io.InputStream;

public class AppUtil {
    public static String toBase64ProfilePic(Part profilePic) {
        String proPicBase64 = null;
        try (InputStream inputStream = profilePic.getInputStream()) {
            byte[] proPicBytes = inputStream.readAllBytes();
            proPicBase64 = Base64.getEncoder().encodeToString(proPicBytes);
        } catch (Exception e) {
            e.printStackTrace(); // Better to use a logger in production
        }
        return proPicBase64;
    }
}
