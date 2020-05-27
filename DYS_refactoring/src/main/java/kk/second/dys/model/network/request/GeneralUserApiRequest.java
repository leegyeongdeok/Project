package kk.second.dys.model.network.request;

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
public class GeneralUserApiRequest {


    public Object set;
    private Long generalId;
    private String account;
    private String password;
    private String nickname;
    private String name;
    private String birth;
    private String email;
    private String phoneNum;
    private LocalDateTime registeredAt;
    private UserStatus status;
}
