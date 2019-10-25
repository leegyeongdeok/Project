package kk.second.dys.service;

import kk.second.dys.model.entity.Accommodation;
import kk.second.dys.model.entity.Cafe;
import kk.second.dys.repository.AccommodationRepository;
import kk.second.dys.repository.CafeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class AccommodationPageService {

    @Autowired
    private AccommodationRepository repository;

    public Page<Accommodation> findAll(Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
                return repository.findAll(pageable);
    }

    public Page<Accommodation> findFood(Pageable pageable, String location){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
        return repository.findAllByAddressContains(location, pageable);
    }


    public Accommodation findById(Long number) {
        return repository.getOne(number);
    }
}
