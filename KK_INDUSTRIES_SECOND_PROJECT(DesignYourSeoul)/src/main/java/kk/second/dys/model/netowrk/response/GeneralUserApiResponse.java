package kk.second.dys.model.netowrk.response;

import kk.second.dys.model.enumclass.UserStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GeneralUserApiResponse {

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
