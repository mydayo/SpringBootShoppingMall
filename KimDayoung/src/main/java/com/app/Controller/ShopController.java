package com.app.Controller;

//import com.app.IPurchaseHistoryService;
import com.app.IUserService;
import com.app.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/shop")
public class ShopController {

    private IUserService userService;

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value="/main/{userId}", method=RequestMethod.GET)
    public ModelAndView shopMain(@PathVariable("userId") String userId) {
        User user = userService.getUserByUserId(userId);
        if(user == null){
            ModelAndView model = new ModelAndView("welcome");
            return model;
        }else{
            ModelAndView model = new ModelAndView("shopMain");
            model.addObject("user",user);
            return model;
        }
    }

}
