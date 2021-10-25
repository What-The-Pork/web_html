package util;
//�̸��� ���� ��ü
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("schs1214@gmail.com", "wjdtjs12"); //구글 계정정보(ID, PW)
	}
	
	
	
	
}
