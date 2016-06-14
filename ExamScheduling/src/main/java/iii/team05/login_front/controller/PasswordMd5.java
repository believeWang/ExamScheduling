package iii.team05.login_front.controller;

import java.security.MessageDigest;

public class PasswordMd5 {
	private MessageDigest mDigest;
	public PasswordMd5() {
		try {
			 mDigest = MessageDigest.getInstance("MD5");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public byte[] encryption(String password){
		byte[] temp = password.getBytes();
		temp = mDigest.digest(temp);
		return temp;
		
	}
	
}
