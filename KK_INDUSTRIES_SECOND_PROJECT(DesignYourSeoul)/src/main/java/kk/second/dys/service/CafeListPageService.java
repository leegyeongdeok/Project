package kk.second.dys.service;

import kk.second.dys.model.entity.Cafe;
import kk.second.dys.model.entity.FamousRestaurant;
import kk.second.dys.repository.CafeRepository;
import kk.second.dys.repository.FamousRestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class CafeListPageService {

    @Autowired
    private CafeRepository repository;

    public Page<Cafe> findAll(Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
                return repository.findAll(pageable);
    }

    public Page<Cafe> findFood(Pageable pageable, String location){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
        return repository.findAllByAddressContains(location, pageable);
    }


    public Cafe findById(Long number) {
        return repository.getOne(number);
    }
}
