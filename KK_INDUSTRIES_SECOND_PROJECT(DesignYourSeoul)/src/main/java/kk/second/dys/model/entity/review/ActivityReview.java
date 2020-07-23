package kk.second.dys.model.entity.review;


import kk.second.dys.model.entity.themeList.Activity;
import kk.second.dys.model.entity.user.GeneralUser;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class ActivityReview {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;

    private String content;

    @CreatedDate
    private LocalDateTime registeredAt;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "activity_id")
    private Activity activity;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "user_id")
    private GeneralUser generalUser;
}
