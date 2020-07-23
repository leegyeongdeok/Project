package kk.second.dys.model.network.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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
