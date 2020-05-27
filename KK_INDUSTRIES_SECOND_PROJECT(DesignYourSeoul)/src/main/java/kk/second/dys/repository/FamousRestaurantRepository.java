package kk.second.dys.repository;

import kk.second.dys.model.entity.FamousRestaurant;
import kk.second.dys.model.entity.Notice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface FamousRestaurantRepository extends JpaRepository<FamousRestaurant, Long> {


    Page<FamousRestaurant> findAllByAddressContains(String name, Pageable pageable);


}
