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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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

    @RequestMapping({"/borrowBkPage","/changeBkPage"})
    public ModelAndView bkPage(Long bookId, HttpServletRequest req) {
//        System.out.println("路径1：" + req.getServletPath());
//        System.out.println("路径2：" + req.getRequestURL());
        ModelAndView mav = new ModelAndView();
        Book book = libraryService.findBkById(bookId);
        mav.addObject("book", book);
        if (req.getServletPath().equals("/borrowBkPage.do")) {
            mav.setViewName("borrowBook");
        }else {
            mav.setViewName("changeBk");
        }
        return mav;
    }

    @ResponseBody
    @RequestMapping("/changeBk")
    public Result changeBk(Book book) {
        Long bookId = book.getBookId();
        if (libraryService.changeBk(book)) {
            return Result.OK("修改成功");
        }
        return Result.Fail("修改失败");
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

    @ResponseBody
    @PostMapping("addBook")
    public Result addNewBk(Book book) {
        int addResult = libraryService.addNewBk(book);
        switch (addResult) {
            case LibraryStatus.BORROW_SUCCESS: return Result.OK("添加成功");
            case LibraryStatus.ADD_ERROR: return  Result.Fail("添加失败，未知错误");
            case LibraryStatus.BOOKID_HAS_EXIST: return  Result.Fail("添加失败，图书ID已存在");
            default: return Result.Fail("未知错误");
        }
    }
    @ResponseBody
    @PostMapping("addPic")
    public Result upload(@RequestParam(value = "picture", required = false) CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        String savePath = null;
        if (file != null) {
            // 获取web的绝对路径（磁盘路径）
            String webPath = request.getSession().getServletContext().getRealPath("/"); // 只有通过session才能获取到application,只有通过application才能找到web的路径
            // 获取当前时间戳
            long timestamp = System.currentTimeMillis();
            // web路径 + 保存文件夹 + 时间戳 + 原文件名 = 保存文件的路径
            savePath = webPath + "files/" + timestamp + file.getOriginalFilename();
            System.out.println(savePath);
            // 通过这个文件对象获取到保存的路径和文件名
            File saveTo = new File(savePath);
            // 保存至
            file.transferTo(saveTo);
            return Result.OK(savePath);
        }
        return Result.Fail("图片上传失败");
    }
//    @ResponseBody
//    @PostMapping("upload")
//    public String upload(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
//        // 获取web的绝对路径（磁盘路径）
//        String webPath = request.getSession().getServletContext().getRealPath("/");
//        // 获取当前时间戳
//        long timestamp = System.currentTimeMillis();
//        // web路径 + 保存文件夹 + 时间戳 + 原文件名 = 保存文件的路径
//        String savePath = webPath + "files/" + timestamp + file.getOriginalFilename();
//        System.out.println(savePath);
//        // 通过这个文件对象获取到保存的路径和文件名
//        File saveTo = new File(savePath);
//        // 保存至
//        file.transferTo(saveTo);
//        return "上传成功！";
//    }

}
