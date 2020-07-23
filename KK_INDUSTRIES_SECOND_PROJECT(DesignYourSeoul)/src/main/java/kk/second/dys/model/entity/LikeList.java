package kk.second.dys.model.entity;

import kk.second.dys.model.entity.user.GeneralUser;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class LikeList {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long likeId;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "user_id")
    private GeneralUser generalUser;

    private String kind;

    private Long themeId;
}
