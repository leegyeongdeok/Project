package kk.second.dys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
public class JspViewController {

    //메인
    @GetMapping("/dys")
    public String loginHome(@RequestParam(required = false) String account, @RequestParam(required = false) String name ,ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("name", name);
        if(account == null && name == null){
            return "home";
        }else{
            return "loginHome";
        }

    }

    //로그인 헤더 버튼

    @GetMapping("/dys/Intro")
    public String Loginintroduce(@RequestParam(required = false) String id, ModelMap modelMap){
        modelMap.addAttribute("id", id);
        if (id == null){
            return "company/introduction";
        }else{
            return "company/introductionLogin";
        }

    }

    //로그인 페이지
    @GetMapping("/dys/login")
    public String login(){
        return "login/login";
    }

    @GetMapping("/dys/signUp")
    public String signUp(){
        return "login/signUp";
    }

    @GetMapping("/dys/generalUser")
    public String generalUserSignUP(){
       return "login/generalUser";
    }

    @GetMapping("/dys/ownerUser")
    public String ownerUserSignUp(){
        return "login/ownerUser";
    }

    @GetMapping("/dys/signUpSuccess")
    public String signUpSuccess(@RequestParam(required = false) String name, ModelMap modelMap){
       modelMap.addAttribute("name", name);

        return "login/signUpSuccess";
    }

    @GetMapping("/dys/find")
    public String findAccount(){
        return "login/find";
    }

    @GetMapping("/dys/findSuccess")
    public String findIdSuccess(@RequestParam(required = false) String name, @RequestParam(required = false) String phone, ModelMap modelMap){
        modelMap.addAttribute("name", name);
        modelMap.addAttribute("phone", phone);
        return "login/findSuccess";
    }

    @GetMapping("/dys/findPswdSuccess")
    public String findPswdSuccess(@RequestParam(required = false) String id, @RequestParam(required = false) String userType,
            ModelMap modelMap){
        modelMap.addAttribute("id", id);
        modelMap.addAttribute("userType", userType);
        return "login/findPswdSuccess";
    }

    //마이페이지
    @GetMapping("/dys/myPage/Home")
    public String myPageHome(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "mypage/myPageHome";
    }

    @GetMapping("/dys/myInfo")
    public String myInfo(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "mypage/myInfo";
    }

    @GetMapping("/dys/myGoodList")
    public String myGoodList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "mypage/myGoodList";
    }

    @GetMapping("/dys/memberCancel")
    public String memberCancel(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "mypage/memberCancel";
    }

    @GetMapping("/dys/myCourseList")
    public String myCourseList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "mypage/myCourseList";
    }

    @GetMapping("/dys/saveCourseList")
    public String saveCourseList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "mypage/saveCourseList";
    }

    //마이체인지 페이지
    @GetMapping("/dys/myinfochange/birthChange")
    public String birthChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myinfochange/birthChange";
    }

    @GetMapping("/dys/myinfochange/emailChange")
    public String emailChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myinfochange/emailChange";
    }

    @GetMapping("/dys/myinfochange/idChange")
    public String idChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myinfochange/idChange";
    }

    @GetMapping("/dys/myinfochange/nameChange")
    public String nameChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myinfochange/nameChange";
    }

    @GetMapping("/dys/myinfochange/nickNameChange")
    public String nickNameChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myinfochange/nickNameChange";
    }

    @GetMapping("/dys/myinfochange/phoneChange")
    public String phoneChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myinfochange/phoneChange";
    }

    @GetMapping("/dys/myinfochange/pwChange")
    public String pwChange(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "myinfochange/pwChange";
    }

    //오너페이지
    @GetMapping("/dys/owner/Home")
    public String ownerHome(@RequestParam(required = false) String account, @RequestParam(required = false) String name ,ModelMap modelMap){
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("name", name);
       return "ownerpage/ownerHome";
   }


    @GetMapping("/dys/owner/Cancel")
    public String ownerCanel(@RequestParam(required = false) String account, @RequestParam(required = false) String name ,ModelMap modelMap){
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("name", name);
        return "ownerpage/ownerCancel";
    }

    @GetMapping("/dys/owner/StoreChoice")
    public String ownerStoreChoice(@RequestParam(required = false) String account, @RequestParam(required = false) String name ,ModelMap modelMap){
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("name", name);
        return "ownerpage/storeChoice";
    }

    @GetMapping("/dys/owner/StoreList")
    public String ownerStoreList(@RequestParam(required = false) String account, @RequestParam(required = false) String name ,ModelMap modelMap){
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("name", name);
        return "ownerpage/storeList";
    }


    //오너체인지 페이지
    @GetMapping("/dys/owner/AccountChange")
    public String AccountChange(@RequestParam(required = false) String account ,ModelMap modelMap){
        modelMap.addAttribute("id", account);
        return "ownerinfochange/owAccountChange";
    }

    @GetMapping("/dys/owner/BirthChange")
    public String BirthChange(@RequestParam(required = false) String account, ModelMap modelMap){
        modelMap.addAttribute("id", account);
        return "ownerpage/owBirthChange";
    }

    @GetMapping("/dys/owner/EmailChange")
    public String EmailChange(@RequestParam(required = false) String account, ModelMap modelMap){
        modelMap.addAttribute("id", account);
        return "ownerpage/owEmailChange";
    }

    @GetMapping("/dys/owner/NameChange")
    public String NameChange(@RequestParam(required = false) String account, ModelMap modelMap){
        modelMap.addAttribute("id", account);
        return "ownerpage/owNameChange";
    }

    @GetMapping("/dys/owner/PhoneChange")
    public String PhoneChange(@RequestParam(required = false) String account, ModelMap modelMap){
        modelMap.addAttribute("id", account);
        return "ownerpage/owPhoneChange";
    }

    @GetMapping("/dys/owner/PswdChange")
    public String PswdChange(@RequestParam(required = false) String account, ModelMap modelMap){
        modelMap.addAttribute("id", account);
        return "ownerpage/owPswdChange";
    }

    @GetMapping("/dys/owner/Intro")
    public String introduce(@RequestParam(required = false) String account, ModelMap modelMap){
        modelMap.addAttribute("id", account);
        return "company/introductionOwner";
    }

    //유저 테마리스트
    @GetMapping("/dys/themeListLogin/actiListLogin")
    public String actiList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "themelistlogin/activityListLogin";
    }

    @GetMapping("/dys/themeListLogin/attractionListLogin")
    public String attractionList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "themelistlogin/attractionListLogin";
    }

    @GetMapping("/dys/themeListLogin/cafeListLogin")
    public String cafeList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "themelistlogin/cafeListLogin";
    }

    @GetMapping("/dys/themeListLogin/foodListLogin")
    public String foodList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "themelistlogin/foodListLogin";
    }

    @GetMapping("/dys/themeListLogin/hotelListLogin")
    public String hotelList(@RequestParam(required = false) String account, @RequestParam(required = false) String name, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        return "themelistlogin/hotelListLogin";
    }

    //문의사항 글쓰기 페이지
    @GetMapping("/dys/QuestionWriting")
    public String questionWriting(@RequestParam(required = false) String account, @RequestParam(required = false) String type, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("type", type);

        if(type.equals("owner")){
            return "customerserviceowner/ownerQuestionWriting";
        }else if(type.equals("general")){
            return "customerservicelogin/loginQuestionWriting";
        }else{
            return null;
        }

    }

    //게시판 글쓰기 페이지
    @GetMapping("/dys/BoardWriting")
    public String boardWriting(@RequestParam(required = false) String account, @RequestParam(required = false) String type, ModelMap modelMap) {
        modelMap.addAttribute("id", account);
        modelMap.addAttribute("type", type);

        if (type.equals("owner")){
            return "customerserviceowner/ownerBoardWriting";
        }else if(type.equals("general")){
            return "customerservicelogin/loginBoardWriting";
        }else{
            return null;
        }
    }

    //코스 랭킹
    @GetMapping("/dys/courseRanking")
    public String courseHome(@RequestParam(required = false) String id, @RequestParam(required = false) String name)  {
        if(id == null){
            return "course/courseRanking";
        }else{
            return "course/loginCourseRanking";
        }
    }

    @GetMapping("/dys/courseRankingDetail")
    public String courseDetail(@RequestParam(required = false) String id, @RequestParam(required = false) String name)  {
        if(id == null){
            return "course/courseRankingDetail";
        }else{
            return "course/loginCourseRankingDetail";
        }
    }


}
