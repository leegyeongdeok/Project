package kk.second.dys.repository;

import kk.second.dys.model.entity.Cafe;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CafeRepository extends JpaRepository<Cafe, Long> {

    Page<Cafe> findAllByAddressContains(String name, Pageable pageable);

    List<Cafe> findTop10By(Sort sort);


}
