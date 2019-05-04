package mylibrary.controller;

import mylibrary.common.LoginStatus;
import mylibrary.model.User;
import mylibrary.service.LibraryService;
import mylibrary.service.LoginService;
import mylibrary.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;
    @Autowired
    private LibraryService libraryService;

    @ResponseBody
    @PostMapping("/loginCheck")
    public Result loginCheck(User user, boolean rememberMe, HttpServletResponse resp) throws IOException {
        int result = loginService.check(user);
        switch (result) {
            case LoginStatus.USER_NOT_EXIST:
                return Result.Fail("用户不存在！");
            case LoginStatus.PASSWORD_WRONG:
                return Result.Fail("密码输入有误！");
            case LoginStatus.SUCCESS:
                if (rememberMe) {
                    Cookie userName = new Cookie("userName", user.getUserName());
                    userName.setMaxAge(24*3600); // 单位是秒
                    Cookie passWord = new Cookie("passWord", user.getPassWord());
                    userName.setMaxAge(24*3600);
                    resp.addCookie(userName);
                    resp.addCookie(passWord);
                }
                return Result.OK("登录成功！");
            default:
                return Result.Fail("未知异常");
        }
    }

    @PostMapping("/login")
    public String login(User user, HttpSession session) {
        // 必须再次校验
        User userReal = loginService.findUserByName(user.getUserName());
        if (userReal == null) {
            return "error";
        }
        session.setAttribute("UserInfo", userReal);
        return "redirect:./libraryHome.do";
//        return "forward:./loginCheck.do";
    }

    @GetMapping("/logout")
    public String logout( HttpSession session) {
        session.removeAttribute("UserInfo");
        return "logout";
    }


}
