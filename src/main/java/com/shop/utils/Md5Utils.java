

package com.shop.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Md5Utils {
	public static String encrypt(String str) {
		byte[] digest = null;
		try {
			MessageDigest md5=MessageDigest.getInstance("md5");
			digest = md5.digest(str.getBytes("utf-8"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		String md55tr=new BigInteger(1,digest).toString(16);
		System.out.println(md55tr);
		return md55tr;
	}
	
}
