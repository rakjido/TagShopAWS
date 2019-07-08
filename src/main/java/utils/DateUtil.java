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

	public static String datePrint(Date date) {
		String dateFormat = "";
		return dateFormat;
	}

	public static String datePrint(String date) {
		String dateFormat = "";
		return dateFormat;
	}

	public static Calendar dateSet(int year, int month, int day) {
		Calendar cal = new GregorianCalendar();
		return cal;
	}

	public static Calendar dateGet(Date date) {
		Calendar cal = new GregorianCalendar();
		return cal;
	}

	public static int getYear(String date) {
		int year = 0;
		return year;
	}

	public static int getMonth(String date) {
		int month = 0;
		return month;
	}

	public static int getDay(String date) {
		int day = 0;
		return day;
	}

	public static Calendar getYearPlus(String date, int years) {
		Calendar cal = new GregorianCalendar();
		return cal;
	}

	public static Calendar getYearMinus(String date, int years) {
		Calendar cal = new GregorianCalendar();
		return cal;
	}

	public static Calendar getMonthPlus(String date, int months) {
		Calendar cal = new GregorianCalendar();
		return cal;
	}

	public static Calendar getMonthMinus(String date, int months) {
		Calendar cal = new GregorianCalendar();
		return cal;
	}

	public static Calendar getDayPlus(String date, int days) {
		Calendar cal = new GregorianCalendar();
		return cal;
	}

	public static Calendar getDayMinus(String date, int days) {
		Calendar cal = new GregorianCalendar();
		return cal;
	}

	public static int getDayOfWeek(String date) {
		int weekday = 0;
		return weekday;
	}

	public static String getDayOfWeekString(String date) {
		String weekday = "";
		return weekday;
	}

	public static int getLastDayOfMonth(String date) {
		int lastDay = 0;
		return lastDay;
	}

	public static int getPeriod(String fromDate, String toDate, PeriodType pType) {
		int period = 0;
		return period;
	}

	public static int dayCount(String fromDate, String toDate) {
		int days = 0;
		return days;
	}

	public static int daysOfYear(String fromDate, String toDate) {
		int days = 0;
		return days;
	}

	public static boolean isEndOfMonth(String date) {
		boolean isEnd = false;
		return isEnd;
	}

	public static boolean isLeapYear(String date) {
		boolean isLeap = false;
		return isLeap;

	}
}
