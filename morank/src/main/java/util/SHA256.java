package util;
// �ؽ��±׷� ��ȯ
import java.security.MessageDigest;

public class SHA256 {
	
	//64자리 해쉬값 생성
	public static String getSHA256(String input) {
		
		//문자열을 추가하거나 변경 할 때 주로 사용하는 자료형
		StringBuffer result = new StringBuffer();
		
		try {
			//security.MessageDigest 모듈 사용
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			//테스트 (SHA-256)은 byte[]형
			byte[] salt = "Hello! This is Salt".getBytes();
			//reset()로 Digest 재설정
			digest.reset();
			//update()로 Digest 업데이트
			digest.update(salt);
			
			//byte[] digest(byte[] input) - byte배열로 해쉬를 반환
			//String.getBytes(charset) - 유니코드 문자열(String)을 Byte코드로 인코딩해주는 메소드 (charset 기본값은 사용자 플랫폼 설정값)
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			
			
			for (int i =0; i<chars.length; i++) {
				
				//byte&0xff 해주는 이유 - byte 8bit, int 32bit 공간에서 &(비트연산자)를 수행하는 경우,
				//비트수가 넓은 곳에 맞춰서 낮은 비트가 확장하게 되는데
				//가장 앞에 비트가 0인 경우는 0을 채우지만
				//1인 경우 모든 비트가 1이 되어 원본 값과 전혀 다른 수가 되기때문에 &0xff 연산을 수행함.
				String hex = Integer.toHexString(chars[i]&0xff);
				if(hex.length()==1) {
					//append()를 이용하여 계속해서 문자열을 추가해 나갈 수 있음
					result.append("0");
				}
				result.append(hex);
			}
			
		//예외처리
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//SHA-256은 byte로 리턴되기 때문에 String으로 변환이 필요함
		return result.toString();
	}
}
