package kk.second.dys.service.themeList;

import kk.second.dys.model.entity.themeList.FamousRestaurant;
import kk.second.dys.model.network.response.FamousRestaurantApiResponse;
import kk.second.dys.repository.themeList.FamousRestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    public List<FamousRestaurantApiResponse> ListReadForRank(Sort sort) {
        List<FamousRestaurant>  famousRestaurantList=  repository.findTop10By(sort);
        List<FamousRestaurantApiResponse> result = new ArrayList<>();

        for (FamousRestaurant f:famousRestaurantList){
            result.add(response(f));
        }
        return result;
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

/*    public List<FamousFoodApiResponse> findRank() {
        List<FamousRestaurant>  famousRestaurantList=  repository.findTop10ByOrOrderByRecommend();
        List<FamousFoodApiResponse> result = new ArrayList<>();

        for (FamousRestaurant f:famousRestaurantList){
            result.add(response(f));
        }
        return result;
    }*/

    private FamousRestaurantApiResponse response (FamousRestaurant restaurant){

        if(restaurant == null){
            System.out.println("null");
            return null;
        }else{
            FamousRestaurantApiResponse famousFoodApiResponse = FamousRestaurantApiResponse.builder()
                    .famousRestaurantId(restaurant.getFamousRestaurantId())
                    .name(restaurant.getName())
                    .callNumber(restaurant.getCallNumber())
                    .address(restaurant.getAddress())
                    .link(restaurant.getLink())
                    .foodKind(restaurant.getFoodKind())
                    .recommend(restaurant.getRecommend())
                    .areaId(restaurant.getArea().getAreaId())
                    .build();

            return famousFoodApiResponse;
        }
    }



}
