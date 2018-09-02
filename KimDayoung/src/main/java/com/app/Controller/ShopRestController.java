package com.app.Controller;

import javassist.NotFoundException;
import com.app.IUserService;
import com.app.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/json")
public class ShopRestController {

    private IUserService userService;

    User user;

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/checkUser")
    public String checkUser(@RequestParam(value="userId") String userId,
                             @RequestParam(value="password") String password) throws NotFoundException {
        user = userService.getUserByUserId(userId);
        if(user != null){
            if(!(user.getPassword().equals(password))){
                throw new NotFoundException("패스워드가 틀렸습니다.");
            }
            return "환영합니다.";
        }else{
            throw new NotFoundException("아이디를 찾을 수 없습니다.");
        }
    }

    @RequestMapping("/purchase")
    public String purchase(@RequestParam(value="userId") String userId,
                           @RequestParam(value="item") String item,
                           @RequestParam(value="price") String price,
                           @RequestParam(value="count") String count,
                           @RequestParam(value="img") String img,
                           @RequestParam(value="paid_yn") String paid_yn) {

        //구매한 내역을 저장합니다.
        user = userService.getUserByUserId(userId);
        user.setItem(user.getItem()+"&"+"이미지:"+img+",상품명:"+item+",가격:"+price+",개수:"+count+",구매여부:"+paid_yn);
        userService.saveUser(user);
        return "구매완료";
    }

    @RequestMapping("/myPurchaseList")
    public String myPurchaseList(@RequestParam(value="userId") String userId) {
        user = userService.getUserByUserId(userId);
        String item = user.getItem();
        return item;
    }
}
