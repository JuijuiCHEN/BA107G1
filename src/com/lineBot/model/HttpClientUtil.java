package com.lineBot.model;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class HttpClientUtil {
	private final static int DEFAULT_TIME_OUT = 30 * 1000;
	private final static String access_token = "WoBvOdpaR8As2NevLHqrhlrU0qQ3GYjPZTqM91hYrboekarPXgZENd2D6Or+faeJCINpclVVjtz+loWJDmjqGtrCHYlyqEze+JNxq8LHf5c3O1bcm2IQTgey6EqM4Zfe3/cN3oybJB+JRjBqs1i5vgdB04t89/1O/w1cDnyilFU=";
	private final static String GOOGLE_KEY = "AIzaSyAvP4TaCtLH52gW7wQJgR4Hjbi6jFMSELk";
	private final static String GOOGLE_SHORTURL = "https://www.googleapis.com/urlshortener/v1/url";

	public static String postHttpsForJsonparamGoogle(String jsonStr) {
		HttpsURLConnection conn = null;
		try {
			SSLContext context = SSLContext.getInstance("SSL"); // HTTP�MHTTPS�ݭn���SSL��ĳ
			context.init(null, new TrustManager[] { new TrustAnyTrustManager() }, new SecureRandom()); // �K�_�ӷ���null,
																										 // �ﵥ�������ҫH���M�����ӷ���null,
																										 // �ӥͦ������H���ʨӷ���null
			URL curl = new URL(GOOGLE_SHORTURL + "?key=" + GOOGLE_KEY); // �Vgoogle�ШD + GOOGLEKEY
			conn = (HttpsURLConnection) curl.openConnection(); // �}�ҳs�u, ��^URLConnection
			conn.setSSLSocketFactory(context.getSocketFactory()); // �qSSL.getSocketFactory(),
																	 // �]�wSSLSocketFactory
			conn.setConnectTimeout(DEFAULT_TIME_OUT);
			conn.setReadTimeout(DEFAULT_TIME_OUT);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setUseCaches(false);
			conn.setInstanceFollowRedirects(true);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.connect();
			DataOutputStream out = new DataOutputStream(conn.getOutputStream());
			out.write(jsonStr.getBytes("UTF-8")); // �]�M�׬Oms950,�ҥH��n��X��byte�নutf-8��byte
			out.flush();
			out.close();

			int statusCode = conn.getResponseCode();
			if (200 == statusCode) {
				InputStream is = conn.getInputStream();
				BufferedInputStream bis = new BufferedInputStream(is);
				BufferedReader br = new BufferedReader(new InputStreamReader(bis, "UTF-8"));
				StringBuffer buff = new StringBuffer();
				String line = null;
				while (null != (line = br.readLine())) {
					buff.append(line);
				}
				br.close();
				System.out.println(buff.toString());
				return buff.toString();
			} else {
				System.out.println("�D���AstatusCode :" + statusCode);
			}
		} catch (Exception e) {
			System.out.println("http" + e);
		} finally {
			if (null != conn) {
				conn.disconnect();
			}
		}
		return null;
	}

	public static String postHttpsForJsonparam(String url, String jsonStr) {
		HttpsURLConnection conn = null;
		try {
			SSLContext context = SSLContext.getInstance("SSL");
			context.init(null, new TrustManager[] { new TrustAnyTrustManager() }, new SecureRandom());
			URL curl = new URL(url);
			conn = (HttpsURLConnection) curl.openConnection();
			conn.setSSLSocketFactory(context.getSocketFactory());
			conn.setConnectTimeout(DEFAULT_TIME_OUT);
			conn.setReadTimeout(DEFAULT_TIME_OUT);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setUseCaches(false);
			conn.setInstanceFollowRedirects(true);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "Bearer {" + access_token + "}");
			conn.connect();
			DataOutputStream out = new DataOutputStream(conn.getOutputStream());
			out.write(jsonStr.getBytes("UTF-8")); // �]�M�׬Oms950,�ҥH��n��X��byte�নutf-8��byte
			out.flush();
			out.close();

			int statusCode = conn.getResponseCode();
			if (200 == statusCode) {
				InputStream is = conn.getInputStream();
				BufferedInputStream bis = new BufferedInputStream(is);
				BufferedReader br = new BufferedReader(new InputStreamReader(bis, "UTF-8"));
				StringBuffer buff = new StringBuffer();
				String line = null;
				while (null != (line = br.readLine())) {
					buff.append(line);
				}
				br.close();
				System.out.println(buff.toString());
				return buff.toString();
			} else {
				System.out.println("�D���AstatusCode :" + statusCode);
			}
		} catch (Exception e) {
			System.out.println("http" + e);
		} finally {
			if (null != conn) {
				conn.disconnect();
			}
		}
		return null;

	}

	private static class TrustAnyTrustManager implements X509TrustManager {

		@Override
		public void checkClientTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
		}

		@Override
		public void checkServerTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
		}

		@Override
		public X509Certificate[] getAcceptedIssuers() {
			return new X509Certificate[] {};
		}
	}
}
