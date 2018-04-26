package com.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import sun.misc.BASE64Encoder;

public class TokenProccessor {

	/*
	 * ��ҳ]�p�Ҧ��]�O��������H�b���s���u���@�ӡ^ 1�B�������c�y��ƨp�� 2�B�ۤv�Ыؤ@��������H 3�B��~���Ѥ@�Ӥ��@����k�A��^������H
	 */
	private TokenProccessor() {
	}

	private  final static TokenProccessor instance = new TokenProccessor();

	/**
	 * ��^������H
	 * 
	 * @return
	 */
	public static  TokenProccessor getInstance() {
		return instance;
	}

	/**
	 * �ͦ�Token Token�GNv6RRuGEVvmGjB+jimI/gw==
	 * 
	 * @return
	 */
	public String makeToken() { // checkException
		// 7346734837483 834u938493493849384 43434384
		String token = (System.currentTimeMillis() + new Random().nextInt(999999999)) + "";
		// �ƾګ��� 128��� 16�Ӧr�` md5
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			byte md5[] = md.digest(token.getBytes());
			// base64�s�X--���N�G�i��s�X���奻��
			BASE64Encoder encoder = new BASE64Encoder();
			return encoder.encode(md5);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
}
