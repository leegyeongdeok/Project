package kk.second.dys.repository;

import kk.second.dys.model.entity.OwnerUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OwnerUserRepository extends JpaRepository<OwnerUser, Long> {
    Optional<OwnerUser> findFirstByAccount(String checkId);
    Optional<OwnerUser> findFirstByNameAndPhoneNum(String name, String phoneNum);
    Optional<OwnerUser> findFirstByNameAndAccountAndPhoneNum(String name, String account, String phoneNum);
    List<OwnerUser> findAllByNameAndPhoneNum(String name, String phoneNum);
    Optional<OwnerUser> findByAccountAndPassword(String account, String password);
    OwnerUser findByAccount(String account);
}
