package vo;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Util {
	public Date transformDate(String date) {
		SimpleDateFormat before = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat after = new SimpleDateFormat("yyyy-mm-dd");
		
		java.util.Date temp = null;
		
		try {
			temp = before.parse(date);
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		String transDate = after.format(temp);
		
		Date d = Date.valueOf(transDate);
		
		return d;
	}
	public static String getSalt() {
		String value="";
		try {
			SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
			byte[] salt = new byte[32];
			secureRandom.nextBytes(salt);
			value=salt.toString();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	public static String getPassword(String password, String salt) {
		String generatedPassword = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.reset();
			md.update(salt.getBytes());
			byte[] bytes = md.digest(password.getBytes("UTF-8"));
			StringBuilder sb = new StringBuilder();
			for(int i=0;i<bytes.length;i++) {
				sb.append(Integer.toString((bytes[i]&0xff)+0x100,16).substring(1));
			}
			generatedPassword= sb.toString();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return generatedPassword;
	}
}
