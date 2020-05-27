package kk.second.dys.model.entity;

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
public class OwnerUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ownerId;

    private String account;
    private String password;
    private String name;
    private String birth;
    private String email;
    private String phoneNum;

    @CreatedDate
    private LocalDateTime registeredAt;

    @Enumerated(EnumType.STRING)
    private UserStatus status;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ownerUser")
    private List<OwnerQuestion> ownerQuestionList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ownerUser")
    private List<OwnerBoard> ownerBoardList;

    @ToString.Exclude
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ownerUser")
    private List<OwnerBoardReply> ownerBoardReplyList;

}
