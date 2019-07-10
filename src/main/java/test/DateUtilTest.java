package test;

import java.math.BigInteger;

import utils.DateUtil;
import utils.FormatUtil;

public class DateUtilTest {
	public static void main(String[] args) {
		System.out.println(FormatUtil.dateFormat(DateUtil.today()));
		System.out.println(FormatUtil.dateFormat(DateUtil.dateSet(2019, 7, 9)));
		System.out.println(DateUtil.getYear(DateUtil.today()));
		System.out.println(DateUtil.getMonth(DateUtil.today()));
		System.out.println(DateUtil.getDay(DateUtil.today()));
		System.out.println(FormatUtil.dateFormat(DateUtil.changeYear(DateUtil.today(), -3)));
		System.out.println(FormatUtil.dateFormat(DateUtil.changeMonth(DateUtil.today(), 3)));
		System.out.println(FormatUtil.dateFormat(DateUtil.changeDay(DateUtil.today(), -3)));
		System.out.println(DateUtil.getDayOfWeek(DateUtil.today()));
		System.out.println(DateUtil.getDayOfWeektoString(DateUtil.today()));
	}
}
