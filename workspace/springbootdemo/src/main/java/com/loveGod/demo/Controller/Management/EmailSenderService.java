package com.loveGod.demo.Controller.Management;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {
	
	@Autowired
	private JavaMailSender mailSender;

	
// 單純文字email
//	public void sendEmail(String toEmail,
//			 			  String subject,
//						  String body) {
//		
//		SimpleMailMessage message = new SimpleMailMessage();
//		
//		message.setFrom("lovegod.ispan@gmail.com");
//		message.setTo(toEmail);
//		message.setSubject(subject);
//		message.setText(body);
//		
//
//		
//		mailSender.send(message);
//		System.out.println("Mail sent successfully");
//	}
	
	// email含夾帶檔案圖片
	public void sendEmailAttachment(String subject, String message,
			String toEmailAddresses, boolean isHtmlMail,File attachment) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
			helper.setFrom("lovegod.ispan@gmail.com");
			helper.setTo(toEmailAddresses);
			helper.setSubject(subject);

			if (isHtmlMail) {
				helper.setText("<html><body>" + message + "</html></body>", true);
			} else {
				helper.setText(message);
			}

			// attach the file into email body
			FileSystemResource file = new FileSystemResource(attachment);
			helper.addInline(attachment.getName(), file);

			mailSender.send(mimeMessage);

			System.out.println("Email sending complete.");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	// html email
	public void sendEmailHtml(String subject, String message,
			String toEmailAddresses, boolean isHtmlMail) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
			helper.setFrom("lovegod.ispan@gmail.com");
			helper.setTo(toEmailAddresses);
			helper.setSubject(subject);

			if (isHtmlMail) {
				helper.setText("<html><body>" + message + "</html></body>", true);
			} else {
				helper.setText(message);
			}

			mailSender.send(mimeMessage);

			System.out.println("Email sending complete.");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
}
