package kk.second.dys.service;

import kk.second.dys.model.entity.Cafe;
import kk.second.dys.model.network.response.CafeApiResponse;
import kk.second.dys.repository.CafeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    public Page<Cafe> findCafe(Pageable pageable, String location){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());
        return repository.findAllByAddressContains(location, pageable);
    }

    public List<CafeApiResponse> ListReadForRank(Sort sort) {
        List<Cafe>  cafeList=  repository.findTop10By(sort);
        List<CafeApiResponse> result = new ArrayList<>();

        for (Cafe c:cafeList){
            result.add(response(c));
        }
        return result;
    }


    public Cafe findById(Long number) {
        return repository.getOne(number);
    }


    private CafeApiResponse response (Cafe cafe){
        if(cafe == null){
            System.out.println("null");
            return null;
        }else{
            CafeApiResponse cafeApiResponse = CafeApiResponse.builder()
                    .cafeId(cafe.getCafeId())
                    .name(cafe.getName())
                    .callNumber(cafe.getCallNumber())
                    .address(cafe.getAddress())
                    .link(cafe.getLink())
                    .cafeTheme(cafe.getCafeTheme())
                    .recommend(cafe.getRecommend())
                    .areaId(cafe.getArea().getAreaId())
                    .build();
            return cafeApiResponse;
        }
    }
}
