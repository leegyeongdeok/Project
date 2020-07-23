package kk.second.dys.service;

import kk.second.dys.model.entity.user.GeneralUser;
import kk.second.dys.model.entity.board.GeneralBoard;
import kk.second.dys.model.entity.question.GeneralQuestion;
import kk.second.dys.model.enumclass.UserStatus;
import kk.second.dys.model.network.request.GeneralUserApiRequest;
import kk.second.dys.model.network.response.GeneralUserApiResponse;
import kk.second.dys.repository.GeneralUserRepository;
import kk.second.dys.repository.LikeListRepository;
import kk.second.dys.repository.board.GeneralBoardReplyRepository;
import kk.second.dys.repository.board.GeneralBoardRepository;
import kk.second.dys.repository.question.GeneralQuestionReplyRepository;
import kk.second.dys.repository.question.GeneralQuestionRepository;
import kk.second.dys.repository.review.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
public class GeneralUserApiService  {

    @Autowired
    private GeneralUserRepository repository;

    @Autowired
    private LikeListRepository likeListRepository;

    @Autowired
    private GeneralQuestionRepository questionRepository;

    @Autowired
    private GeneralQuestionReplyRepository questionReplyRepository;

    @Autowired
    private GeneralBoardRepository boardRepository;

    @Autowired
    private GeneralBoardReplyRepository boardReplyRepository;

    @Autowired
    private FamousRestaurantReviewRepository restaurantReviewRepository;

    @Autowired
    private CafeReviewRepository cafeReviewRepository;

    @Autowired
    private AttractionReviewRepository attractionReviewRepository;

    @Autowired
    private AccommodationReviewRepository accommodationReviewRepository;

    @Autowired
    private ActivityReviewRepository activityReviewRepository;


    public GeneralUserApiResponse create(GeneralUserApiRequest request) {
        GeneralUser user = GeneralUser.builder()
                .account(request.getAccount())
                .password(request.getPassword())
                .nickname(request.getNickname())
                .name(request.getName())
                .birth(request.getBirth())
                .email(request.getEmail())
                .phoneNum(request.getPhoneNum())
                .status(request.getStatus())
                .build();

        System.out.println(user.getRegisteredAt());
        repository.save(user);

        return response(user);
    }



    public List<GeneralUserApiResponse> ListReadForNameAndPhone(String name, String phone) {
        List<GeneralUser>  generalUserList=  repository.findAllByNameAndPhoneNum(name, phone);
        List<GeneralUserApiResponse> result = new ArrayList<>();

        for (GeneralUser g:generalUserList){
            result.add(response(g));
        }
        return result;
    }

    public GeneralUserApiResponse updatePswd(String id, String pswd) {
        GeneralUser user =  repository.findByAccount(id);
        user.setPassword(pswd);
        repository.save(user);
        return response(user);
    }

    public GeneralUserApiResponse updateAccount(String account, String newAccount) {
        GeneralUser user =  repository.findByAccount(account);
        user.setAccount(newAccount);
        repository.save(user);
        return response(user);
    }

    public  GeneralUserApiResponse updateName(String account, String newName){
        GeneralUser user =  repository.findByAccount(account);
        user.setName(newName);
        repository.save(user);
        return response(user);
    }
    
    public  GeneralUserApiResponse updateNickName(String nickname, String newNickName){
        GeneralUser user =  repository.findByAccount(nickname);
        user.setNickname(newNickName);
        repository.save(user);
        return response(user);
    }
    public  GeneralUserApiResponse updateBirth(String account, String newBirth){
        GeneralUser user =  repository.findByAccount(account);
        user.setBirth(newBirth);
        repository.save(user);
        return response(user);
    }

    public  GeneralUserApiResponse updateEmail(String account, String newEmail){
        GeneralUser user =  repository.findByAccount(account);
        user.setEmail(newEmail);
        repository.save(user);
        return response(user);
    }

    public  GeneralUserApiResponse updatePhoneNum(String account, String newPhoneNum){
        GeneralUser user =  repository.findByAccount(account);
        user.setPhoneNum(newPhoneNum);
        repository.save(user);
        return response(user);
    }

    public  GeneralUserApiResponse updateStatus(String account){
        GeneralUser user =  repository.findByAccount(account);
        int val = user.getStatus().getId();
        if(val == 0){
            user.setStatus(UserStatus.UNREGISTERED);
            repository.save(user);
        }else{
            user.setStatus(UserStatus.REGISTERED);
            repository.save(user);
        }
        return response(user);
    }

    @Transactional
    public GeneralUserApiResponse delete(String account) {
        GeneralUser user =  repository.findByAccount(account);

        List<GeneralQuestion> list = questionRepository.findAllByGeneralUser(user);
        List<GeneralBoard> boardList = boardRepository.findAllByGeneralUser(user);

        for(GeneralQuestion question : list){
            questionReplyRepository.findByGeneralQuestion(question).ifPresent(reply -> questionReplyRepository.delete(reply));
            questionRepository.delete(question);
        }

        for(GeneralBoard board : boardList){
            boardReplyRepository.deleteAllByGeneralBoard(board);
            boardRepository.delete(board);
        }



        boardReplyRepository.deleteAllByGeneralUser(user);

        likeListRepository.deleteAllByGeneralUser(user);
        restaurantReviewRepository.deleteAllByGeneralUser(user);
        cafeReviewRepository.deleteAllByGeneralUser(user);
        attractionReviewRepository.deleteAllByGeneralUser(user);
        activityReviewRepository.deleteAllByGeneralUser(user);
        accommodationReviewRepository.deleteAllByGeneralUser(user);
        repository.delete(user);
        return response(user);
    }

    private GeneralUserApiResponse response (GeneralUser user){

        if(user == null){
            System.out.println("null");
            return null;
        }else{
            GeneralUserApiResponse generalUserApiResponse = GeneralUserApiResponse.builder()
                    .account(user.getAccount())
                    .password(user.getPassword())
                    .nickname(user.getNickname())
                    .name(user.getName())
                    .birth(user.getBirth())
                    .email(user.getEmail())
                    .phoneNum(user.getPhoneNum())
                    .registeredAt(user.getRegisteredAt())
                    .status(user.getStatus())
                    .build();

            return generalUserApiResponse;
        }
    }

    private GeneralUserApiRequest request (GeneralUser user){

        return GeneralUserApiRequest.builder()
                .account(user.getAccount())
                .password(user.getPassword())
                .nickname(user.getNickname())
                .name(user.getName())
                .birth(user.getBirth())
                .email(user.getEmail())
                .phoneNum(user.getPhoneNum())
                .registeredAt(user.getRegisteredAt())
                .status(user.getStatus())
                .build();
    }

    public GeneralUserApiResponse readForAccount(String account) {
        return response(repository.findByAccount(account));
    }


    public GeneralUserApiResponse getAccountAndPswd(String account, String pswd){
        return repository.findByAccountAndPassword(account, pswd)

                .map(user -> response(user))
                .orElse(null);

    }

    public GeneralUserApiResponse findFirstByNameAndPhoneNum(String account, String pswd){
        return repository.findFirstByNameAndPhoneNum(account, pswd)

                .map(user -> response(user))
                .orElse(null);

    }

    public GeneralUserApiResponse findByGeneralId(Long number) {
        return response(repository.getOne(number));
    }
}
