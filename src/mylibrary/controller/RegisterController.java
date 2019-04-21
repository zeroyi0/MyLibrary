package mylibrary.controller;

import mylibrary.common.RegisterStatus;
import mylibrary.model.User;
import mylibrary.service.RegisterService;
import mylibrary.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class RegisterController {
    @Autowired
    private RegisterService registerService;
    @ResponseBody
    @RequestMapping("/register")
    public Result register(User user) {
        int result = registerService.addUser(user);
        switch (result) {
            case RegisterStatus.SUCCESS:
                return Result.OK("注册成功！");
            case RegisterStatus.FAIL:
                return Result.Fail("注册失败！");
            case RegisterStatus.USER_HAS_EXIST:
                return Result.Fail("用户已存在，请重新注册");
            default:
                return Result.Fail("未知错误");
        }
    }
}
