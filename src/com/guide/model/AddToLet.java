package com.guide.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class AddToLet {
	private static final String KEY = "AIzaSyBuS1-gsXN4HrHQaqjuaFaMxIqcayPPaoY";
	private static final String GOOGLEAPI = "https://maps.googleapis.com/maps/api/geocode/json";
	private static final String USER_AGENT = "Mozilla/5.0";

	public static String sendGet(String url) throws Exception {

		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		con.setRequestMethod("GET");

		con.setRequestProperty("User-Agent", USER_AGENT);

		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		return response.toString();

	}

	public String googleApi(String add) throws Exception {
		String letJson = AddToLet.sendGet(GOOGLEAPI + "?address=" + URLEncoder.encode(add, "utf-8") + "&key=" + KEY);
		JSONObject j = JSON.parseObject(letJson);
		String let = JSON.parseObject(j.getJSONArray("results").get(0).toString()).getJSONObject("geometry")
				.get("location").toString();
		return let;
	}

	public static void main(String[] args) {
		AddToLet addToLet = new AddToLet();
		try {
			addToLet.googleApi("台中");
			// addToLet.sendGet("https://maps.googleapis.com/maps/api/geocode/json?address=台中&key=AIzaSyBuS1-gsXN4HrHQaqjuaFaMxIqcayPPaoY");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
