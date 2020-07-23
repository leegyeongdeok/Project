package kk.second.dys.model.network.request.boardReply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OwnerBoardReplyRequest {

    private Long ReplyNo;
    private String reply;
    private LocalDateTime registeredAt;
    private LocalDateTime updatedAt;
    private Long userId;
    private Long boardNo;
}
