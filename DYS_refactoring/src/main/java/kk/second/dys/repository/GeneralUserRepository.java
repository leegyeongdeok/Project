package kk.second.dys.repository;

import kk.second.dys.model.entity.GeneralUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GeneralUserRepository extends JpaRepository<GeneralUser, Long> {
    Optional<GeneralUser> findFirstByAccount(String generalId);
    Optional<GeneralUser> findFirstByNickname(String nickname);
    Optional<GeneralUser> findFirstByNameAndPhoneNum(String name, String phoneNum);
    Optional<GeneralUser> findFirstByNameAndAccountAndPhoneNum(String name, String account, String phoneNum);
    List<GeneralUser> findAllByNameAndPhoneNum(String name, String phoneNum);
    Optional<GeneralUser> findByAccountAndPassword(String account, String password);
    GeneralUser findByAccount(String account);


}
