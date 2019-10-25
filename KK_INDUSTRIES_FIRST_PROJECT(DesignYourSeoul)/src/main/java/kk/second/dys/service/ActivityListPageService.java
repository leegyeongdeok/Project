package kk.second.dys.service;

import kk.second.dys.model.entity.Activity;
import kk.second.dys.model.entity.Cafe;
import kk.second.dys.repository.ActivityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ActivityListPageService {

    @Autowired
    private ActivityRepository repository;

    public Page<Activity> findAll(Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
                return repository.findAll(pageable);
    }

    public Page<Activity> findFood(Pageable pageable, String location){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
        return repository.findAllByAddressContains(location, pageable);
    }


    public Activity findById(Long number) {
        return repository.getOne(number);
    }
}
