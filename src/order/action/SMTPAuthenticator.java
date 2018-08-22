package order.action;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {

	@Override

	protected PasswordAuthentication getPasswordAuthentication() {

		return new PasswordAuthentication("clemado1@gmail.com","bdysubvcjoacbuje");

	}
}
