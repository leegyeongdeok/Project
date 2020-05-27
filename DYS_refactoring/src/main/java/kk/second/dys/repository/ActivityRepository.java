package kk.second.dys.repository;

import kk.second.dys.model.entity.Activity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ActivityRepository extends JpaRepository<Activity, Long> {

    Page<Activity> findAllByAddressContains(String name, Pageable pageable);

    List<Activity> findTop10By(Sort sort);


}
