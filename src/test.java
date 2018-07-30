import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;
import vo.Util;
public class test {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		
		String salt = Util.getSalt();
		String passwdb = Util.getPassword("asdf123", salt);
		
		System.out.println(passwdb);
		
		String pass2 = Util.getPassword("asdf123", salt);
		System.out.println(pass2);
		
		String email1 = "asdf123";
		String email2 = "gmail.com";
		String email = email1+"@"+email2;

		System.out.println(email);
		
		String emails[] = new String[2];
		emails = email.split("@");
		System.out.println(emails[0]+" "+emails[1]);
		
	}
	

}
