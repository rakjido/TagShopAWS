package utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import vo.ManagementVo;

public class PDFBuilder extends AbstractITextPdfView {
	@Override
	public void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		List<ManagementVo> Managementlist = (List<ManagementVo>) model.get("Managementlist");
		
		
		PdfPTable table = new PdfPTable(7);
		table.setWidthPercentage(105.0f);
		//컬럼 간격 수정
		table.setWidths(new float[] {1.7f, 1.2f, 1.8f, 3.0f, 2.0f, 1.5f, 2.0f});
		table.setSpacingBefore(10);
		
		//font 경로 설정
		 String resPath = "C:/Windows/Fonts/malgunbd.ttf";
		 //font 설정
		  BaseFont bf = BaseFont.createFont(resPath,BaseFont.IDENTITY_H,BaseFont.EMBEDDED);

		  Font cellTitleFont = new Font(bf,10,Font.NORMAL);

		  Font cellNormalFont = new Font(bf,10, Font.NORMAL);
		  
		  cellTitleFont.setColor(BaseColor.BLACK);
		
		
		//테이블 헤더 컬러 수정
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.MAGENTA);
		cell.setPadding(4);
		
		// 테이블 column에 값 추가
		cell.setPhrase(new Phrase("DATATIMES", cellTitleFont));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("USERID", cellTitleFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("DELIVERTFEE", cellTitleFont));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("PRODUCTNAME", cellTitleFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("UNITPRICE", cellTitleFont));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("QUANTITY", cellTitleFont));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("ORDERSTATUSCODE", cellTitleFont));
		table.addCell(cell);
		
		// 테이블 ROW에 값 추가
		for (ManagementVo ma : Managementlist) {
			cell = new PdfPCell();
			cell.setPhrase(new Phrase(ma.getDateTimes(), cellNormalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(ma.getUserid(), cellNormalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(Double.toString(ma.getDeliveryFee()), cellNormalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(ma.getProductName(), cellNormalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(Double.toString(ma.getUnitPrice()), cellNormalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(Integer.toString(ma.getQuantity()), cellNormalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(ma.getOrderStatusCode(), cellNormalFont));
			table.addCell(cell);
		}
		doc.add(table);
	}

}