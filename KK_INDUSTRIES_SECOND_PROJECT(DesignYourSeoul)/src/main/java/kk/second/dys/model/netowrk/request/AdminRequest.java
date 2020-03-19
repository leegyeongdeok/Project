package kk.second.dys.model.netowrk.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminRequest {

    private Long adminId;
    private String account;
    private String password;

    private Long ownerQuestionReplyNo;
    private Long generalQuestionReplyNo;
}
