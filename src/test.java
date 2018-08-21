import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		String end = DATE_FORMAT.format(date);
		cal.add(Calendar.MONTH,-1);
		date = cal.getTime(); 
		String start = DATE_FORMAT.format(date);
		System.out.println(end);
		System.out.println(start);
	}

}
