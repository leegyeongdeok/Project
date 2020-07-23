package kk.second.dys.service.board;

import kk.second.dys.model.entity.board.GeneralBoard;
import kk.second.dys.model.network.request.GeneralBoardRequest;
import kk.second.dys.model.network.response.GeneralBoardResponse;
import kk.second.dys.repository.board.GeneralBoardRepository;
import kk.second.dys.repository.GeneralUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class GeneralBoardPageService {

    @Autowired
    private GeneralBoardRepository repository;

    @Autowired
    private GeneralUserRepository generalUserRepository;

    public Page<GeneralBoard> findBoardList(Pageable pageable){
        pageable = PageRequest.of(
                pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
                pageable.getPageSize());

        return repository.findAll(pageable);
    }

    public Page<GeneralBoard> searchAllBoardList(Pageable pageable, String contains){
        return repository.findAllByTitleContainsOrContentContains(contains,contains,pageable);
    }

    public Page<GeneralBoard> searchTitleBoardList(Pageable pageable, String contains){
        return repository.findAllByTitleContains(contains,pageable);
    }

    public Page<GeneralBoard> searchContentBoardList(Pageable pageable, String contains){
        return repository.findAllByContentContains(contains,pageable);
    }

    public Page<GeneralBoard> searchNicknameBoardList(Pageable pageable, String contains){
        return repository.findAllByGeneralUserNickname(contains,pageable);
    }

    public GeneralBoard findByGeneralBoardNo(Long no) {
        return repository.findByBoardNo(no);
    }

    public GeneralBoardResponse create(GeneralBoardRequest request) {

        GeneralBoard generalBoard = GeneralBoard.builder()
                .title(request.getTitle())
                .content(request.getContent())
                .generalUser(generalUserRepository.getOne(request.getGeneralId()))
                .build();
        repository.save(generalBoard);
            return response(generalBoard);
    }

    private GeneralBoardResponse response (GeneralBoard generalBoard){
        GeneralBoardResponse generalBoardResponse = GeneralBoardResponse.builder()
                .generalBoardNo(generalBoard.getBoardNo())
                .title(generalBoard.getTitle())
                .content(generalBoard.getContent())
                .registeredAt(generalBoard.getRegisteredAt())
                .updatedAt(generalBoard.getUpdatedAt())
                .generalId(generalBoard.getGeneralUser().getGeneralId())
                .build();
        return generalBoardResponse;

    }
}
