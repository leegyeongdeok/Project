package kk.second.dys.model.network.response.boardReply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OwnerBoardReplyResponse {

    private Long replyNo;
    private String reply;
    private LocalDateTime registeredAt;
    private LocalDateTime updatedAt;
    private String name;
    private Long ownerBoardNo;
}
