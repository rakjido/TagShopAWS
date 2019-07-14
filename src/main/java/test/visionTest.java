package test;

import utils.VisionUtil;

public class visionTest {
	public static void main(String[] args) throws Exception {
		//String filePath = "C:\\Users\\USER\\Downloads\\chuck_logo.jpg";
		String filePath = "C:\\Users\\USER\\Downloads\\blue_t_logo.jpg";
		//String filePath = "C:\\Users\\USER\\Downloads\\jean_logo.jpg";
		//File file = new File("/Users/titan7/Downloads/result.txt");
		//request.getSession().getServletContext().getRealPath("uploads");
		String color = VisionUtil.detectDominantColor(filePath);
		System.out.println(color);
	}
}