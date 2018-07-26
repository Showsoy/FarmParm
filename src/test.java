import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

public class test {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		
		ArrayList<Integer> arry = new ArrayList<Integer>();
		boolean flag = false;
		String item_code = "V";
		arry.add(1);
		arry.add(3);
		arry.add(5);
		if (arry.size() > 0) {
			for (int i = 1; i <= arry.get(arry.size() - 1); i++) {
				for (int j = i - 1; j < arry.size() - 1; j++) {
					if (i == arry.get(j)) {
						break;
					} else {
						flag = true;
						break;
					}
				}
				if(i==arry.get(arry.size()-1)) {
					item_code = item_code + String.format("%03d", i+1);
				}else {
					if (!flag)
						continue;
					else {
						item_code = item_code + String.format("%03d", i);
						break;
					}
				}
			}
		} else {
			item_code += "001";
		}
		
		System.out.println(item_code);
	}
	

}
