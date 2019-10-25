package kk.second.dys.model.netowrk.request;

import kk.second.dys.model.enumclass.UserStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OwnerUserApiRequest {

    private Long ownerId;
    private String account;
    private String password;
    private String name;
    private String birth;
    private String email;
    private String phoneNum;
    private LocalDateTime registeredAt;
    private UserStatus status;
}
