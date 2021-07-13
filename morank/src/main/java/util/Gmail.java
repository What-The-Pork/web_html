package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("pcj0228test@gmail.com", "jusu159357!!"); //본인 아이디
	}
	
	
	
	
}
