package lk.ijse.aadassignment_01.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private int productId;
    private String productName;
    private int qty;
    private double unitPrice;
    private CategoryDTO category;
}
