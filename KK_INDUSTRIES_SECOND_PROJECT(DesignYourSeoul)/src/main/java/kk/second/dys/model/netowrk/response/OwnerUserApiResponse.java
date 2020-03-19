package kk.second.dys.model.netowrk.response;


import kk.second.dys.model.enumclass.UserStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain = true)
public class OwnerUserApiResponse {

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
