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
		// 1.����text
		String replyToken = lineBotModel.getReplyToken();
		String text = lineBotModel.getMessageModel().getText();
		System.out.println("�^�ǽX : " + replyToken);
		System.out.println("�ϥΪ̿�J�T��: " + text);
		List<GuideVO> areaGuideList = guideDao.getAllGuideFromArea(text);
		System.out.println(areaGuideList.size());
		// 2.���ӭȩ��󤣩��M�A�n
		String returnJson = "";
		if (text != null && areaGuideList.size() > 0) {
			// 3.1ok
			// 4.1�ո˦^�ǵ��Ȥ�T��
		} else {
			// 3.2��ok
			String returnMsg = "�A�n��";
			// 4.2�ո˦^�ǵ��Ȥ�T��
			returnJson = LineBotService.build(replyToken, returnMsg);

		}
		// 5.post line �x��api
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
