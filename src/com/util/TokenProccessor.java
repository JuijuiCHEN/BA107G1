package com.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import sun.misc.BASE64Encoder;

public class TokenProccessor {

	/*
	 * 單例設計模式（保證類的對象在內存中只有一個） 1、把類的構造函數私有 2、自己創建一個類的對象 3、對外提供一個公共的方法，返回類的對象
	 */
	private TokenProccessor() {
	}

	private  final static TokenProccessor instance = new TokenProccessor();

	/**
	 * 返回類的對象
	 * 
	 * @return
	 */
	public static  TokenProccessor getInstance() {
		return instance;
	}

	/**
	 * 生成Token Token：Nv6RRuGEVvmGjB+jimI/gw==
	 * 
	 * @return
	 */
	public String makeToken() { // checkException
		// 7346734837483 834u938493493849384 43434384
		String token = (System.currentTimeMillis() + new Random().nextInt(999999999)) + "";
		// 數據指紋 128位長 16個字節 md5
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			byte md5[] = md.digest(token.getBytes());
			// base64編碼--任意二進制編碼明文本符
			BASE64Encoder encoder = new BASE64Encoder();
			return encoder.encode(md5);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
}
