package com.lineBot.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lineBot.model.LineBotModel;
import com.lineBot.model.LineBotService;

@WebServlet("/lineBot.do")
public class LineBotServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("���H�X��");
		String ip = req.getLocalAddr();
		System.out.println("ip" + ip);
		StringBuffer jb = new StringBuffer();
		String line = null;
		try {
			BufferedReader reader = req.getReader(); // �����Ѽ�,���reader��
			while ((line = reader.readLine()) != null) // �]�j��Ūreader�̪��ѼƦ걵�b�@�_
				jb.append(line);
		} catch (Exception e) {
			/* report an error */ }

		System.out.println(jb.toString());

		JSONObject jsonObject = JSON.parseObject(jb.toString()); // jb��String�b��JSON����
		System.out.println(jsonObject.getJSONArray("events").get(0));

		LineBotModel model = JSON.toJavaObject((JSONObject) jsonObject.getJSONArray("events").get(0),
				LineBotModel.class); // ��JSON�ন���w��JAVA����
		System.out.println(model.toString());
		LineBotService lineBotSvc = new LineBotService();
		lineBotSvc.reply(model, ip);
	}
}
