package email;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtility {
	public static String sendEmail(String host, String port, final String userName, final String password,
			String toAddress) throws AddressException, MessagingException {

		
		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};

		Session session = Session.getInstance(properties, auth);

		// creates a new e-mail message
		MimeMessage msg = new MimeMessage(session);
		Random rand = new Random();
		Integer randomNum = rand.nextInt(10000);
		String veriID = randomNum.toString();
		
		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject("VERIFY YOUR EMAIL ACCOUNT");
		msg.setSentDate(new Date());
		String message = "<!DOCTYPE html><html><body><H3>Welcome to Spankeys Raffle</h3><p>click on the following link to verify your account<a href='http://localhost:8080/RaffleNew/Verifyuser?token="+veriID+"&user="+toAddress+"'>Link</a></p></body></html>";
		msg.setContent(message, "text/html; charset=utf-8");

		// sends the e-mail
		Transport.send(msg);
		return veriID;
	}
}