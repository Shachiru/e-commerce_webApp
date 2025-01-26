package lk.ijse.aadassignment_01.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "cart")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cartId;

    @Column(nullable = false)
    private int qty;

    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private User users;

    @ManyToOne
    @JoinColumn(name = "productId", nullable = false)
    private Product product;
}


