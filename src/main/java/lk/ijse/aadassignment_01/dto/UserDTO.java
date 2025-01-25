package lk.ijse.aadassignment_01.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO{
    private int userId;
    private String userName;
    private String email;
    private String password;
}

