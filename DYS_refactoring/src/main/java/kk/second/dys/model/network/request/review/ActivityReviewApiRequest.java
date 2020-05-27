package kk.second.dys.model.network.request.review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ActivityReviewApiRequest {

    private Long reviewId;
    private Long activityId;
    private Long userId;
    private String content;
    private LocalDateTime registeredAt;
}
