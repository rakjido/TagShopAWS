package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

enum PeriodType {
	YEAR, MONTH, WEEK, DAY
};

/*
 * @class name : TeamDate
 *
 * @date : 2019.05.09
 *
 * @author : rakjido
 *
 * @description : date
 *
 */

public class DateUtil {

	public static Date date(String stringDate) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		try {
			date = format.parse(stringDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static Date datetime(int year, int month, int day, int hour, int min) {
		Calendar cal = new GregorianCalendar(year, month - 1, day, hour, min);
		Date date = new Date(cal.getTimeInMillis());
		return date;
	}

	public static Date today() {
		return new Date();
	}

	public static Date dateSet(int year, int month, int day) {
		Calendar cal = new GregorianCalendar(year, month - 1, day);
		Date date = new Date(cal.getTimeInMillis());
		return date;
	}

	public static int getYear(Date date) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		return cal.get(Calendar.YEAR);
	}

	public static int getMonth(Date date) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		return cal.get(Calendar.MONTH) + 1;
	}

	public static int getDay(Date date) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_MONTH);
	}

	public static Date changeYear(Date date, int years) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.YEAR, years);
		return new Date(cal.getTimeInMillis());
	}

	public static Date changeMonth(Date date, int months) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.MONTH, months);
		return new Date(cal.getTimeInMillis());
	}

	public static Date changeDay(Date date, int days) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_YEAR, days);
		return new Date(cal.getTimeInMillis());
	}

	public static int getDayOfWeek(Date date) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_WEEK);
	}

	public static String getDayOfWeektoString(Date date) {
		int nWeek = getDayOfWeek(date);
		String strWeek = "";
		switch (nWeek) {
		case 1:
			strWeek = "SUN";
			break;
		case 2:
			strWeek = "MON";
			break;
		case 3:
			strWeek = "TUE";
			break;
		case 4:
			strWeek = "WED";
			break;
		case 5:
			strWeek = "THU";
			break;
		case 6:
			strWeek = "FRI";
			break;
		case 7:
			strWeek = "SAT";
			break;
		}
		return strWeek;
	}

	// public static int getLastDayOfMonth(String date) {
	// int lastDay = 0;
	// return lastDay;
	// }
	//
	// public static int getPeriod(String fromDate, String toDate, PeriodType pType)
	// {
	// int period = 0;
	// return period;
	// }
	//
	// public static int dayCount(String fromDate, String toDate) {
	// int days = 0;
	// return days;
	// }
	//
	// public static int daysOfYear(String fromDate, String toDate) {
	// int days = 0;
	// return days;
	// }
	//
	// public static boolean isEndOfMonth(String date) {
	// boolean isEnd = false;
	// return isEnd;
	// }
	//
	// public static boolean isLeapYear(String date) {
	// boolean isLeap = false;
	// return isLeap;
	//
	// }
}
