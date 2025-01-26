package lk.ijse.aadassignment_01.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartDTO {
    private int cartId;
    private int qty;
    private UserDTO user;
    private ProductDTO product;
}
