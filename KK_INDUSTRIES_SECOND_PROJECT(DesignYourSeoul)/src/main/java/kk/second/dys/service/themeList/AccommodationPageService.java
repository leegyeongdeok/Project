package kk.second.dys.service.themeList;

import kk.second.dys.model.entity.themeList.Accommodation;
import kk.second.dys.model.network.response.AccommodationApiResponse;
import kk.second.dys.repository.themeList.AccommodationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    public List<AccommodationApiResponse> ListReadForRank(Sort sort) {
        List<Accommodation>  accommodationList=  repository.findTop10By(sort);
        List<AccommodationApiResponse> result = new ArrayList<>();

        for (Accommodation a:accommodationList){
            result.add(response(a));
        }
        return result;
    }

    public Accommodation findById(Long number) {
        return repository.getOne(number);
    }

    private AccommodationApiResponse response (Accommodation accommodation){
        if(accommodation == null){
            System.out.println("null");
            return null;
        }else{
            AccommodationApiResponse accommodationApiResponse = AccommodationApiResponse.builder()
                    .accommodationId(accommodation.getAccommodationId())
                    .name(accommodation.getName())
                    .callNumber(accommodation.getCallNumber())
                    .address(accommodation.getAddress())
                    .link(accommodation.getLink())
                    .grade(accommodation.getGrade())
                    .recommend(accommodation.getRecommend())
                    .areaId(accommodation.getArea().getAreaId())
                    .build();
            return accommodationApiResponse;
        }
    }
}
