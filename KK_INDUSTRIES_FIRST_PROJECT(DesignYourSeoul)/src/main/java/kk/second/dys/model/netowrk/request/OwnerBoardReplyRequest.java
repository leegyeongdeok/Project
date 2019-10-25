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
public class OwnerBoardReplyRequest {

    private Long ownerBoardReplyNo;
    private String reply;
    private LocalDateTime registeredAt;
    private LocalDateTime updatedAt;
    private Long ownerId;
    private Long ownerBoardNo;
}
