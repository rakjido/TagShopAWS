package utils;


import java.sql.Timestamp;


/*
 * @class name : TeamFormat
 *
 * @date : 2019.05.09
 *
 * @author : rakjido
 *
 * @description : 변환 유틸  
 *
 */

public class ConvertUtil {

	public static String checkToYn(String str) {
		String yn = "";
		if (str == null) {
			yn = "N";
		} else if (str.trim().equals("on")) {
			yn = "Y";
		}
		return yn;
	}

	public static java.sql.Date dateFromUtilToSql(java.util.Date utilDate) {
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		return sqlDate;
	}

	public static java.sql.Timestamp dateFromUtitlToTimestamp(java.util.Date utilDate) {
		Timestamp ts = new Timestamp(utilDate.getTime());
		return ts;
	}

}