package kk.second.dys.model.network.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OwnerQuestionResponse {

    private Long ownerQuestionNo;
    private String title;
    private String content;
    private LocalDateTime registeredAt;
    private LocalDateTime updatedAt;
    private Long ownerId;
}
