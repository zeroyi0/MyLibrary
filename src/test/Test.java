//package test;
//
//import javax.mail.*;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeBodyPart;
//import javax.mail.internet.MimeMessage;
//import java.util.Properties;
//
//public class Test {
//
//    public static void main(String[] args) throws MessagingException {
//        Properties prop = new Properties();
//        // 邮箱服务器
//        prop.setProperty("mail.host", "smtp.qq.com");
//        prop.setProperty("mail.transport.protocol", "smtp");
//        prop.setProperty("mail.smtp.auth", "true");
//        // 设置session
//        Session session = Session.getInstance(prop);
//        session.setDebug(true);
//        // 获取transport对象
//        Transport transport = session.getTransport();
//        transport.connect("752893042@qq.com", "ouibrrfbaktbbdbi");
//
//        // 创建邮件实体
//        MimeMessage message = new MimeMessage(session);
//        message.setFrom(new InternetAddress("752893042@qq.com"));
//        // 设置标题
//        message.setSubject("邮件主题","UTF-8");
//        //设置邮件正文
//        message.setContent("啊", "text/html;charset=UTF-8");
//
//
//        // 设置收件人
//        message.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress("linf.z@qq.com"));
//
//        // 发送
//        transport.sendMessage(message, message.getAllRecipients());
//    }
//
//}
