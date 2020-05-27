package kk.second.dys.model.entity.review;


import kk.second.dys.model.entity.Attraction;
import kk.second.dys.model.entity.GeneralUser;
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
public class AttractionReview {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;

    private String content;

    @CreatedDate
    private LocalDateTime registeredAt;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "attraction_id")
    private Attraction attraction;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "user_id")
    private GeneralUser generalUser;
}
