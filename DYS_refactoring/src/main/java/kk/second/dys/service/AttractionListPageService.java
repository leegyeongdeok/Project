package kk.second.dys.service;

import kk.second.dys.model.entity.Attraction;
import kk.second.dys.model.network.response.AttractionApiResponse;
import kk.second.dys.repository.AttractionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AttractionListPageService {

    @Autowired
    private AttractionRepository repository;

    public Page<Attraction> findAll(Pageable pageable) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return repository.findAll(pageable);
    }

    public Page<Attraction> findFood(Pageable pageable, String location) {
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize());
        return repository.findAllByAddressContains(location, pageable);
    }

    public List<AttractionApiResponse> ListReadForRank(Sort sort) {
        List<Attraction> attractionList = repository.findTop10By(sort);
        List<AttractionApiResponse> result = new ArrayList<>();

        for (Attraction a : attractionList) {
            result.add(response(a));
        }
        return result;
    }

    public Attraction findById(Long number) {
        return repository.getOne(number);
    }

    private AttractionApiResponse response(Attraction attraction) {

        if (attraction == null) {
            System.out.println("null");
            return null;
        } else {
            AttractionApiResponse attractionApiResponse = AttractionApiResponse.builder()
                    .attractionId(attraction.getAttractionId())
                    .name(attraction.getName())
                    .callNumber(attraction.getCallNumber())
                    .address(attraction.getAddress())
                    .link(attraction.getLink())
                    .attractionType(attraction.getAttractionType())
                    .areaId(attraction.getArea().getAreaId())
                    .build();

            return attractionApiResponse;
        }
    }
}
