package iii.team05.eclogin.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class Email {
	public void sendEmail(String email, String subject, String content) {
		String host = "smtp.gmail.com";
		int port = 587; // gmail的port
		
		//郵件資訊設定
		final String usernameForMail = "EEIT8505@gmail.com"; // 帳戶
		final String passwordForMail = "8505EEIT";// 密碼
		System.out.println("寄送email開始.");
		
		//設定SMTP伺服器
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.ssl.trust", host);
		
		//建立session
		Session sessionForMail = Session.getInstance(props,new javax.mail.Authenticator() { // 建立一個mail的session
                protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(usernameForMail,passwordForMail);
					}
				});
		try {
			System.setProperty("mail.mime.charset", "UTF-8");
			Message message = new MimeMessage(sessionForMail);
			// 設定寄件人
			try {
				message.setFrom(new InternetAddress("EEIT8505@gmail.com", "偉康考試預約系統"));
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
			// 設定收件人
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));
			// 設定mail主旨
			try {
				message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			// message.setText(content);
			// 轉換content內的Html格式為
			Multipart multpart = new MimeMultipart();
			MimeBodyPart mbp = new MimeBodyPart();
			mbp.setContent(content, "text/html; charset=UTF-8");
			multpart.addBodyPart(mbp);
			message.setContent(multpart);
			
			Transport transport = sessionForMail.getTransport("smtp");
			transport.connect(host, port, usernameForMail, passwordForMail);
			Transport.send(message);
			System.out.println("寄送email結束.");

		} catch (MessagingException e) {
			// throw new RuntimeException(e);
			e.printStackTrace();
		}
	}
}
