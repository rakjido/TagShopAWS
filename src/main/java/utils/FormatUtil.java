package utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;


/*
 * @class name : TeamFormat
 *
 * @date : 2019.05.09
 *
 * @author : rakjido
 *
 * @description : format이나 정규표현식검사 
 *
 */
public class FormatUtil {
	public static boolean iscellPhoneMetPattern(String cellPhoneNumber) {
		boolean isMet;
		String pattern = "^\\d{2,3}-\\d{3,4}-\\d{4}$";
		isMet = Pattern.matches(pattern, cellPhoneNumber);
		return isMet;
	}

	public static String dateTimeFormat(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String dateTime = df.format(date);
		return dateTime;

	}

	public static String dateFormat(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		String dateFormat = df.format(date);
		return dateFormat;

	}
	
	public static String dateFormat2(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateFormat = df.format(date);
		return dateFormat;

	}

	public static String dateFormatKorean(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일");
		String dateFormat = df.format(date);
		return dateFormat;

	}

	public static String amountFormat(int amount) {
		DecimalFormat df = new DecimalFormat("###,###");
		String amountFormat = df.format(amount);
		return amountFormat;
	}

}
