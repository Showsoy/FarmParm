import java.text.ParseException;
import java.util.Calendar;
public class test {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		
		String sss = "asdfasdf";
		System.out.println(sss.substring(0, 3));
		Calendar cal = Calendar.getInstance(); // Calendar 객체 생성.
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		System.out.println(year+","+month);
		
		String allDate = "2018-08-01";
		String date1 = allDate.substring(0, 4);
		String date2 = allDate.substring(5, 7);
		System.out.println(date1+","+date2);
	}
	

}
