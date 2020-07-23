package kk.second.dys.repository;
import kk.second.dys.model.entity.themeList.Area;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AreaRepository extends JpaRepository<Area, Long> {



}
