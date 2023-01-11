package com.codingdojo.qa3ati.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.Service;

@Service
public class SpringMailSender {

	@Autowired
	private JavaMailSender mailSender;

//	public void sendEmail(String toEmail, String subject, String body) {
//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setFrom("ifcodey@gmail.com");
//		message.setTo(toEmail);
//		message.setText(body);
//		message.setSubject(subject);
//
//		mailSender.send(message);
//
//		System.out.println("mail sent successfully ...");
//
//	}
	
	
	public void sendEmail(String toEmail, String subject, String msg1) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("ifcodey@gmail.com");
		message.setTo(toEmail);
		message.setText(msg1);

//		message.setText(hallPrice.toString());
//		message.setText(hallDate.toString());
//		message.setText(hallCapacity.toString());
//		HttpSession session = request.getSession();
//		Long user_id = (Long) session.getAttribute("userId");
//		Long hall_id = (Long)  session.getAttribute("hallId");
//		message.setText("YOUR NAME IS : " + userService.findUserById(user_id).getUserName() + "THE HALL NAME IS :" + hallService.findHallById(hall_id).getName() + "The Price is :" + hallService.findHallById(hall_id).getBasicPrice() );

		message.setSubject(subject);

		mailSender.send(message);

		System.out.println("mail sent successfully ...");

	}

}