package utils;

import java.util.Random;

public class RandomValueUtil {
	
		// 난수를 이용한 키 생성
		private static boolean lowerCheck;
		private static int size;
	
	public static String mailRandomValue() {
		
		
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
		
	}

	public static String getKey(boolean lowerCheck, int size) {
		RandomValueUtil.lowerCheck = lowerCheck;
		RandomValueUtil.size = size;
		return mailRandomValue();
	}
	
	public static String getSmsKey() {
		
		Random random = new Random();
		String smsKey = "";
		
		
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(random.nextInt(10));
			smsKey += ran;
		}
		
		return smsKey;
	}

}
