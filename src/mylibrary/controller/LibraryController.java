package mylibrary.controller;

import mylibrary.common.LibraryStatus;
import mylibrary.model.Book;
import mylibrary.model.User;
import mylibrary.service.BorBkService;
import mylibrary.service.LibraryService;
import mylibrary.service.LoginService;
import mylibrary.utils.Result;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

@Controller
public class LibraryController {
    @Autowired
    private LibraryService libraryService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private BorBkService borBkService;

    private final String enc = "utf-8";
    // 首页
    @RequestMapping("/libraryHome")
    public String libraryHome(HttpSession session){
        // 视图
        return "library";
    }

    // User
    private Long userId(HttpSession session) {
        User user = (User) session.getAttribute("UserInfo");
        return user.getUserId();
    }

    // 借书
    @ResponseBody
    @RequestMapping("/borrowBk")
    public Result borrowBk(Long bookId, HttpSession session) {
        int result = borBkService.borrowBkById(bookId, userId(session));
        if (result == LibraryStatus.BORROW_SUCCESS) {
            return Result.OK("借书成功");
        }
        return Result.Fail("借书失败");
    }

    // 搜索书
    @ResponseBody
    @RequestMapping("/borrowBkSearch")
    public Book searchBk(Long bookId) {
        Book book = libraryService.findBkById(bookId);
        return book;
    }

    // 我借阅的图书
    @RequestMapping("/myBookInfo")
    public ModelAndView myBookInfo(HttpSession session) {
        List list = borBkService.findAllBorBk(userId(session));
        ModelAndView mav = new ModelAndView();
        mav.addObject("myBookInfo", list);
//        mav.setViewName("myBookInfo"); //转发
        return mav;
    }

    // 续借> 展示没有归还的全部书
    @RequestMapping("/borrowBkAgain")
    public ModelAndView borBkAgain(HttpSession session) {
        List list = borBkService.borBkAgain(userId(session));
        ModelAndView mav = new ModelAndView();
        mav.addObject("notReturnBkInfo", list);
//        mav.setViewName("borrowBkAgain"); //转发    //已经请求转发了一次
        return mav; //
    }

    // 续借
    @ResponseBody
    @RequestMapping("borAgain")
    public Result borAgin(Long borId, Integer renew) {
        if (borBkService.borAgain(borId, renew)) {
            return Result.OK("续借成功");
        }
        return  Result.Fail("续借失败");
    }

    // 逾期书的信息
    @RequestMapping("/notReturnOnTime")
    public ModelAndView notReturnOnTime(HttpSession session) {
        List list = borBkService.notReturnOnTime(userId(session));
        ModelAndView mav = new ModelAndView();
        mav.addObject("notReturnOnTime", list);
//        mav.setViewName("notReturnOnTime"); //转发
        return mav;
    }

    // 还书
    @ResponseBody
    @RequestMapping("returnBk")
    public Result returnBk(Long borId) {
        boolean returnResult = borBkService.returnBk(borId);
        if (returnResult) {
            return Result.OK("还书成功");
        }
        return Result.Fail("还书失败");
    }

    // 归还> 展示没有归还的全部书
    @RequestMapping("/returnBook")
    public ModelAndView returnBk(HttpSession session) {
        List list = borBkService.borBkAgain(userId(session));
        ModelAndView mav = new ModelAndView();
        mav.addObject("notReturnBkInfo", list);
        mav.setViewName("returnBook"); //转发
        return mav;
    }

    // 全部图书信息
    @RequestMapping("/allBookInfo")
    public ModelAndView allBookInfo(Integer index) {
        if (index == null) {
            index = 0;
        }
        ModelAndView mav = new ModelAndView();
        List listLib = libraryService.quaryAllBook(index);
        int pageNum = libraryService.getPageNum();
        mav.addObject("AllBook", listLib);
        mav.addObject("PageNum", pageNum);
        mav.addObject("Current", index + 1);
//        mav.setViewName("allBookInfo");
        return mav;
    }

    // 全部用户信息
    @RequestMapping("/allUserInfo")
    public ModelAndView allUserInfo() {
        ModelAndView mav = new ModelAndView();
        List listUser = loginService.findAllUser();//
        mav.addObject("AllUser", listUser);
        return mav;
    }

    // 全部管理员信息
    @RequestMapping("/allAdminInfo")
    public ModelAndView allAdminInfo() {
        ModelAndView mav = new ModelAndView();
        List list = loginService.findAllAdmin();
        mav.addObject("AllAdmin", list);
        return mav;
    }

    // 书目检索
    @ResponseBody //json数据
    @RequestMapping("/searchBook")
    public ModelAndView searchBook(String condition, String content) {
        ModelAndView mav = new ModelAndView();
        List listBook = libraryService.searchBook(condition, content);
        // model
        mav.addObject("SearchBook", listBook);
        mav.setViewName("searchContent"); //转发
        return mav;
    }

    // 搜索要删除的图书
    @ResponseBody //json数据
    @RequestMapping("/deleteBkInfo")
    public ModelAndView delectBkInfo(String condition, String content) {
        ModelAndView mav = new ModelAndView();
        List listBook = libraryService.searchBook(condition, content);
        // model
        mav.addObject("deleteBkInfo", listBook);
        mav.setViewName("deleteContent"); //转发
        return mav;
    }

    // 删除图书
    @ResponseBody
    @RequestMapping("deleteBk")
    public Result deleteBk(Long bookId) {
        if (libraryService.deleteBk(bookId)) {
            return Result.OK("删除成功");
        }
        return Result.Fail("删除失败");
    }

    //添加一本书的信息
    @RequestMapping("addBook")
    public Result addBook(Book book, HttpServletRequest request) throws IOException {
        FileItemFactory factory = new DiskFileItemFactory();
        // 创建文件上传处理器
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 开始解析请求信息
        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        // 对所有请求信息进行判断
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            // 信息为普通的格式
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String value = item.getString();
                request.setAttribute(fieldName, value);
            }
            // 信息为文件格式
            else {
                String fileName = item.getName();
                System.out.println(fileName);
                int index = fileName.lastIndexOf("\\");
                fileName = fileName.substring(index + 1);
                request.setAttribute("realFileName", fileName);

//                String basePath = request.getRealPath("/imgs");
                File file = new File("/imgs", fileName);
                try {
                    item.write(file);
                } catch (Exception e) {
                    e.printStackTrace();
                }
//            }
//            request.setAttribute("msg","文件上传成功!");
//            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
        return Result.Fail("aa");
    }

    // 忘记密码
    @ResponseBody
    @RequestMapping("forgetPwd")
    public Result forgetPwd(String userName, String email) throws MessagingException {
        // 根据用户名能找到相对应的邮箱
        if (loginService.findByUserName(userName,email)) {
            String url = "http://localhost:8080/biandan/changePwd.jsp";
            sendEmail(email, url);
            return Result.OK("验证链接已发送到您的邮箱，  请点击查阅");
        }
        return Result.Fail("邮箱输入有误");
    }

    @RequestMapping("changePwd")
    public Result changePwd(String passWord) {
        return Result.Fail("");
    }
    // 发送邮件
    private void sendEmail(String email, String url) throws MessagingException {
        Properties prop = new Properties();
        // 邮箱服务器
        prop.setProperty("mail.host", "smtp.qq.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");
        // 设置session
        Session session = Session.getInstance(prop);
        session.setDebug(true);
        // 获取transport对象
        Transport transport = session.getTransport();
        transport.connect("752893042@qq.com", "ouibrrfbaktbbdbi");
        // 创建邮件实体
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress("752893042@qq.com"));
        // 设置标题
        message.setSubject("邮件主题","UTF-8");
        //设置邮件正文
        message.setContent(url, "text/html;charset=UTF-8");
        // 设置收件人
        message.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(email));
        // 发送
        transport.sendMessage(message, message.getAllRecipients());
    }

}
