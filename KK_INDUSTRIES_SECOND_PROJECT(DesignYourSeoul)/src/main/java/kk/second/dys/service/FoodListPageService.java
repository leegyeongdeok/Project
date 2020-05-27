package kk.second.dys.service;

import kk.second.dys.model.entity.FamousRestaurant;
import kk.second.dys.model.entity.Notice;
import kk.second.dys.repository.FamousRestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class FoodListPageService {

    @Autowired
    private FamousRestaurantRepository repository;

    public Page<FamousRestaurant> findAll(Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
                return repository.findAll(pageable);
    }

    public Page<FamousRestaurant> findFood(Pageable pageable, String location){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
        return repository.findAllByAddressContains(location, pageable);
    }


    public FamousRestaurant findById(Long number) {

        return repository.getOne(number);
    }
}
