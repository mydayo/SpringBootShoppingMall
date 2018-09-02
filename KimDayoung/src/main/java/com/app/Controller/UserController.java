package com.app.Controller;

import com.app.IUserService;
import com.app.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class UserController {


    private IUserService userService;

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    //처음 진입시 Mapping됩니다.
    @RequestMapping(value="", method=RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView model = new ModelAndView("welcome");
//        model.addObject("list", userService.listAllUsers());
        return model;
    }

    //처음 진입시 Mapping됩니다.
    @RequestMapping(value="/register", method=RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView model = new ModelAndView("register");
        model.addObject("list", userService.listAllUsers());
        return model;
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public ModelAndView deleteUsers(@PathVariable int id) {
        userService.deleteUser(id);
        return new ModelAndView("redirect:/index");
    }

    @RequestMapping(value="/add", method = RequestMethod.POST)
    public ModelAndView userRegister(@ModelAttribute("user") User user){
        ModelAndView model = new ModelAndView("register");
        if(user!=null){
            userService.saveUser(user);
            model.addObject("warning", "User Registration Success");
        }
        else{
            model.addObject("danger","Something Going Bad" );
        }
        return new ModelAndView("redirect:/register");
    }


    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") int id) {
        ModelAndView model = new ModelAndView("edit");
        User user = userService.getUserById(id);
        model.addObject("user", user);
        return model;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(@RequestParam("id") int id,
                               @RequestParam("userId") String userId,@RequestParam("password") String password) {
        User user = userService.getUserById(id);
        user.setUserId(userId);
        user.setPassword(password);
        userService.saveUser(user);
        return new ModelAndView("redirect:/index");
    }

}
