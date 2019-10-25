package kk.second.dys.model.netowrk.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OwnerBoardResponse {

    private Long ownerBoardNo;
    private String title;
    private String content;
    private LocalDateTime registeredAt;
    private LocalDateTime updatedAt;
    private Long ownerId;
}
