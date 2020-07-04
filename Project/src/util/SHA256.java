package util;

import java.security.MessageDigest;

public class SHA256 {

	
	//Secure Hash Algorithm 안전한 해시 알고리즘, 해시값을 리턴
	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256"); //?알고리즘 적용
			
			byte[] salt = "Hello! This is Salt.".getBytes(); //단순하게 sha256적용시 해커의 공격당하기 쉬움
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i=0; i<chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) result.append("0");
				result.append(hex);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
	
}
