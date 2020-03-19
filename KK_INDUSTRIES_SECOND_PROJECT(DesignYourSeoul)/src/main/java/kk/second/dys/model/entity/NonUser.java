package kk.second.dys.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
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
public class NonUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long nonUserId;

    private String lookupPw;

    @CreatedDate
    private LocalDateTime registeredAt;
}
