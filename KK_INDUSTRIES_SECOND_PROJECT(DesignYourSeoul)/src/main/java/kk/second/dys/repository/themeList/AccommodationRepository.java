package kk.second.dys.repository.themeList;

import kk.second.dys.model.entity.themeList.Area;
import kk.second.dys.model.entity.themeList.Accommodation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AccommodationRepository extends JpaRepository<Accommodation, Long> {
    Page<Accommodation> findAllByAddressContains(String name, Pageable pageable);

    List<Accommodation> findTop10By(Sort sort);

    List<Accommodation> findAllByArea(Area area);

    Integer countAllByArea(Area area);
}
