package kk.second.dys.model.network.response.questionReply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.Access;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain = true)
public class GeneralQuestionReplyResponse {
    private Long replyNo;
    private String reply;
    private LocalDateTime registeredAt;
    private LocalDateTime updatedAt;
    private String admin;
}
