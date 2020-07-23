package kk.second.dys.service.themeList;

import kk.second.dys.model.entity.themeList.Activity;
import kk.second.dys.model.network.response.ActivityApiResponse;
import kk.second.dys.repository.themeList.ActivityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    public List<ActivityApiResponse> ListReadForRank(Sort sort) {
        List<Activity>  activityList=  repository.findTop10By(sort);
        List<ActivityApiResponse> result = new ArrayList<>();

        for (Activity a:activityList){
            result.add(response(a));
        }
        return result;
    }


    public Activity findById(Long number) {
        return repository.getOne(number);
    }

    private ActivityApiResponse response (Activity activity){

        if(activity == null){
            System.out.println("null");
            return null;
        }else{
            ActivityApiResponse activityApiResponse = ActivityApiResponse.builder()
                    .activityId(activity.getActivityId())
                    .name(activity.getName())
                    .callNumber(activity.getCallNumber())
                    .address(activity.getAddress())
                    .link(activity.getLink())
                    .activityType(activity.getActivityType())
                    .recommend(activity.getRecommend())
                    .areaId(activity.getArea().getAreaId())
                    .build();
            return activityApiResponse;
        }
    }
}
