package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONArray;
import service.PerformanceService;
import utils.DateUtil;
import utils.FormatUtil;
import vo.PerformanceVo;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private PerformanceService pService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexView(Model model) {
		
		List<PerformanceVo> pList = pService.getPerformance();
		List<String> dateList = new ArrayList<String>();
		int pNum = pService.getPerformanceCount();
		System.out.println(pList);
		
		for(int i = 0; pList.size() > i; i ++) {
			Date date = DateUtil.date(pList.get(i).getBaseDate());
			String dateStr = FormatUtil.dateFormat2(date);

			dateList.add(dateStr);
		}
		
		JSONArray jsonArray = new JSONArray();
		
		model.addAttribute("dateList2",jsonArray.fromObject(dateList));
		model.addAttribute("pList", jsonArray.fromObject(pList));
		model.addAttribute("topList", pList);
		model.addAttribute("topDateList",dateList);
		model.addAttribute("pNum",pNum);
		
		return "admin/adminIndex";
	}
	
	@RequestMapping(value = "/chart/users", method = RequestMethod.GET)
	public String userChart(Model model) {
		List<PerformanceVo> pList = pService.getPerformance();
		List<String> dateList = new ArrayList<String>();
		int pNum = pService.getPerformanceCount();

		for(int i = 0; pList.size() > i; i ++) {
			Date date = DateUtil.date(pList.get(i).getBaseDate());
			String dateStr = FormatUtil.dateFormat2(date);

			dateList.add(dateStr);
		}
		
		JSONArray jsonArray = new JSONArray();
		
		model.addAttribute("dateList2",jsonArray.fromObject(dateList));
		model.addAttribute("pList", jsonArray.fromObject(pList));
		model.addAttribute("pNum",pNum);
		
		
		return "admin/adminUserChart";
	}

	@RequestMapping(value = "/chart/buyChart", method = RequestMethod.GET)
	public String buyViewChart(Model model) {
		List<PerformanceVo> pList = pService.getPerformance();
		int pNum = pService.getPerformanceCount();
		System.out.println(pList);
		
		JSONArray jsonArray = new JSONArray();
		
		
		model.addAttribute("pList", jsonArray.fromObject(pList));
		model.addAttribute("pNum",pNum);
		
		
		return "admin/adminBuyChart";
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String usersView(Model model) {
		List<PerformanceVo> pList = pService.getPerformance();
		int pNum = pService.getPerformanceCount();
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("pList", jsonArray.fromObject(pList));
		model.addAttribute("pNum",pNum);
		return "admin/adminUsers";
	}
	
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String productsView(Model model) {
		List<PerformanceVo> pList = pService.getPerformance();
		int pNum = pService.getPerformanceCount();
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("pList", jsonArray.fromObject(pList));
		model.addAttribute("pNum",pNum);
		return "admin/adminProducts";
	}
}
