package kk.second.dys.repository;

import kk.second.dys.model.entity.Admin;
import kk.second.dys.model.entity.OwnerUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
    Optional<Admin> findByAccountAndPassword(String account, String password);
    Admin findByAccount(String account);
}
