package com.lineBot.model;

import java.util.List;

import com.guide.model.GuideDAO;
import com.guide.model.GuideDAO_interface;
import com.guide.model.GuideVO;

public class LineBotService {
	private GuideDAO_interface guideDao;

	public LineBotService() {
		guideDao = new GuideDAO();
	}

	public void reply(LineBotModel lineBotModel) {
		// 1.拿到text
		String replyToken = lineBotModel.getReplyToken();
		String text = lineBotModel.getMessageModel().getText();
		System.out.println("回傳碼 : " + replyToken);
		System.out.println("使用者輸入訊息: " + text);
		List<GuideVO> areaGuideList = guideDao.getAllGuideFromArea(text);
		System.out.println(areaGuideList.size());
		// 2.那個值府何不府和你要
		String returnJson = "";
		if (text != null && areaGuideList.size() > 0) {
			// 3.1ok
			// 4.1組裝回傳給客戶訊息
		} else {
			// 3.2不ok
			String returnMsg = "你好ㄚ";
			// 4.2組裝回傳給客戶訊息
			returnJson = LineBotService.build(replyToken, returnMsg);

		}
		// 5.post line 官網api
		String url = "https://api.line.me/v2/bot/message/reply";
		System.out.println(returnJson);
		HttpClientUtil.postHttpsForJsonparam(url, returnJson);
	}

	private static String build(String replyToken, String returnMsg) {
		String returnJson = null;
		returnJson = "{\"replyToken\": \"" + replyToken + "\",\"messages\": [{\"type\": \"text\"," + "\"text\": \""
				+ returnMsg + "\"}]}";
		return returnJson;

	}
}
