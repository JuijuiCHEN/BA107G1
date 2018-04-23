package com.lineBot.model;

import java.util.List;

import com.guide.model.GuideDAO;
import com.guide.model.GuideDAO_interface;
import com.guide.model.GuideVO;

public class LineBotService {
	private final String NGROK = "398d422c.ngrok.io";
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
		// 1.����text
		String replyToken = lineBotModel.getReplyToken();
		String text = lineBotModel.getMessageModel().getText();
		System.out.println("�^�ǽX : " + replyToken);
		System.out.println("�ϥΪ̿�J�T��: " + text);
		List<GuideVO> areaGuideList = guideDao.getAllGuideFromArea(text);
		System.out.println(areaGuideList.size());
		// 2.���ӭȩ��󤣩��M�A�n
		String returnJson = "";
		String returnMsg = "";

		if (text != null && areaGuideList.size() > 0) {
			// 3.1ok
			int count = 5;
			if (areaGuideList.size() < 5) {
				count = areaGuideList.size();
			}
			// 4.1�ո˦^�ǵ��Ȥ�T��
			for (int i = 0; i < count; i++) {
				returnMsg = returnMsg + EMOJI[i] + areaGuideList.get(i).getGuideTitle() + DOWN + DOWN + "\\n" + NGROK
						+ "/BA107G1/guide.do?action=getOne&guideId=" + areaGuideList.get(i).getGuideId() + "\\n";
			}
		} else {
			// 3.2��ok
			// 4.2�ո˦^�ǵ��Ȥ�T��
			returnMsg = "�z�i��J�����W�١A���ݿ�J�̫᪺���Υ�(�Ҧp�G�x�_�B���...��)\\nAntiGravity�p���ѷ|�߰������A�Ӧa���峹��T\\n�]�g�T����ȷ|��ܸӦa�ϴX�g�峹\\n�Q�j�M��h��T�ФW�x���j�M~~";
		}
		returnJson = LineBotService.build(replyToken, returnMsg);
		// 5.post line �x��api

		System.out.println(returnJson);
		HttpClientUtil.postHttpsForJsonparam(URL, returnJson);
	}

	private static String build(String replyToken, String returnMsg) {
		String returnJson = null;
		returnJson = "{\"replyToken\": \"" + replyToken + "\",\"messages\": [{\"type\": \"text\"," + "\"text\": \""
				+ returnMsg + "\"}]}";
		return returnJson;

	}
}
