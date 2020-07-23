package kk.second.dys.repository.themeList;

import kk.second.dys.model.entity.themeList.Area;
import kk.second.dys.model.entity.themeList.Attraction;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AttractionRepository extends JpaRepository<Attraction, Long> {


    Page<Attraction> findAllByAddressContains(String name, Pageable pageable);

    List<Attraction> findTop10By(Sort sort);

    Integer countAllByArea(Area one);
}
