package lk.ijse.aadassignment_01.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productId;
    private String productName;
    private int qty;
    private double unitPrice;
    @ManyToOne
    @JoinColumn(name = "categoryId",nullable = false)
    private Category category;
}
