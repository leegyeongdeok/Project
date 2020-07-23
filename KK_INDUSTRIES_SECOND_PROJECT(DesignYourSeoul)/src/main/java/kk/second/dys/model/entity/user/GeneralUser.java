package kk.second.dys.model.entity.user;

import kk.second.dys.model.entity.TravelPlan;
import kk.second.dys.model.entity.board.GeneralBoard;
import kk.second.dys.model.entity.board.GeneralBoardReply;
import kk.second.dys.model.entity.question.GeneralQuestion;
import kk.second.dys.model.enumclass.UserStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class GeneralUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long generalId;

    private String account;
    private String password;
    private String nickname;
    private String name;
    private String birth;
    private String email;
    private String phoneNum;

    @CreatedDate
    private LocalDateTime registeredAt;

    @Enumerated(EnumType.STRING)
    private UserStatus status;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "generalUser")
    private List<GeneralQuestion> generalQuestionList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "generalUser")
    private List<GeneralBoard> generalBoardList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "generalUser")
    private List<GeneralBoardReply> generalBoardReplyList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "generalUser")
    private List<TravelPlan> travelPlanList;

}
