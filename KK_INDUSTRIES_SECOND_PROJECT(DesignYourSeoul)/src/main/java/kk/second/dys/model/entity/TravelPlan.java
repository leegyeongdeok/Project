package kk.second.dys.model.entity;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.user.OwnerUser;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
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
public class TravelPlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long planId;

    private String themeData;

    private Integer recommend;
    private Integer views;

    @CreatedDate
    private LocalDateTime registeredAt;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    private String publicAvailability;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "general_id")
    private GeneralUser generalUser;
}
