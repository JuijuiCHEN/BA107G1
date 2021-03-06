package com.lineBot.model;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.guide.model.GuideDAO;
import com.guide.model.GuideDAO_interface;
import com.guide.model.GuideVO;

public class LineBotService {
	private final String NGROK = "276bbcef.ngrok.io";
	private final String URL = "https://api.line.me/v2/bot/message/reply";
	private final String MON_TOU_SHIN = new StringBuilder().appendCodePoint(0x100078).toString();
	private final String JU_YI = new StringBuilder().appendCodePoint(0x100035).toString();
	private final String TU_TU_KISS = new StringBuilder().appendCodePoint(0x100096).toString();
	private final String DUCK = new StringBuilder().appendCodePoint(0x10005C).toString();
	private final String SHINY = new StringBuilder().appendCodePoint(0x10002D).toString();
	private final String VOTE = new StringBuilder().appendCodePoint(0x100033).toString();
	private final String DOWN = new StringBuilder().appendCodePoint(128071).toString();
	private final String[] EMOJI = { MON_TOU_SHIN, JU_YI, TU_TU_KISS, DUCK, SHINY, VOTE };

	private GuideDAO_interface guideDao;

	public LineBotService() {
		guideDao = new GuideDAO();
	}

	public void reply(LineBotModel lineBotModel, String ip) {
		// 1.拿到text
		String replyToken = lineBotModel.getReplyToken();
		String text = lineBotModel.getMessageModel().getText();
		System.out.println("回傳碼 : " + replyToken);
		System.out.println("使用者輸入訊息: " + text);
		List<GuideVO> areaGuideList = guideDao.getAllGuideFromArea(text);
		System.out.println(areaGuideList.size());
		// 2.那個值府何不府和你要
		String returnJson = "";
		String returnMsg = "";

		if (text != null && areaGuideList.size() > 0) {
			// 3.1ok
			int count = 5;
			if (areaGuideList.size() < 5) {
				count = areaGuideList.size();
			}
			// 4.1組裝回傳給客戶訊息
			for (int i = 0; i < count; i++) {

				String longUrl = NGROK + "/BA107G1/guide.do?action=getOne&guideId=" + areaGuideList.get(i).getGuideId();

				String shortUrl = LineBotService.shortURL(longUrl);
				returnMsg = returnMsg + EMOJI[i] + areaGuideList.get(i).getGuideTitle() + DOWN + DOWN + "\\n" + shortUrl
						+ "\\n";
			}
		} else {
			// 3.2不ok
			// 4.2組裝回傳給客戶訊息
			returnMsg = JU_YI + "您可輸入縣市名稱，不需輸入最後的縣或市(例如：台北、桃園...等)\\n" + "\\n" + TU_TU_KISS + "AntiGravity"
					+ MON_TOU_SHIN + "\\n" + "小秘書會立馬報給你該地的文章資訊\\n" + "\\n" + "因篇幅限制僅會顯示該地區5篇文章" + "\\n" + SHINY
					+ "想搜尋更多資訊請上官網搜尋~~";
		}
		returnJson = LineBotService.build(replyToken, returnMsg);
		// 5.post line 官網api

		System.out.println(returnJson);
		HttpClientUtil.postHttpsForJsonparam(URL, returnJson);
	}

	private static String build(String replyToken, String returnMsg) {
		String returnJson = null;
		returnJson = "{\"replyToken\": \"" + replyToken + "\",\"messages\": [{\"type\": \"text\"," + "\"text\": \""
				+ returnMsg + "\"}]}";
		return returnJson;

	}

	// 縮網址
	public static String shortURL(String longURL) {
		String jsonStr = "{\"longUrl\": \"" + longURL + "\"}"; // 設定長網址json
		String returnMsg = HttpClientUtil.postHttpsForJsonparamGoogle(jsonStr);
		System.out.println(returnMsg);
		Map map = JSON.parseObject(returnMsg, Map.class);
		System.out.println("Map" + map);
		if (!"".equals(map.get("id"))) {
			return (String) map.get("id");
		} else {
			return longURL;
		}
	}

}
