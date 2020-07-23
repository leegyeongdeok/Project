package kk.second.dys.model.entity.board;

import kk.second.dys.model.entity.user.GeneralUser;
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
public class GeneralBoardReply {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long replyNo;

    private String reply;

    @CreatedDate
    private LocalDateTime registeredAt;

    @LastModifiedDate
    private LocalDateTime updatedAt;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "board_no")
    private GeneralBoard generalBoard;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "user_id")
    private GeneralUser generalUser;


}
