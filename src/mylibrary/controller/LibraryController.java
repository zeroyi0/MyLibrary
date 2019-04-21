package mylibrary.controller;

import mylibrary.common.LibraryStatus;
import mylibrary.service.LibraryService;
import mylibrary.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LibraryController {
    @Autowired
    private LibraryService libraryService;
    @ResponseBody
    @PostMapping("/borrowBk")
    public Result borrowBk(Long bookId) {
        int result = libraryService.borrowBkById(bookId);
        if (result == LibraryStatus.BORROW_SUCCESS) {
            return Result.OK("借书成功");
        }
        return Result.Fail("借书失败");
    }

}
