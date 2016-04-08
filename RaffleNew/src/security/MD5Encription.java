package security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Encription {
	private String password;
	private String cryptPassword;
	private MessageDigest md;

	public String crypto(String password) throws NoSuchAlgorithmException {
		this.password = password;

		md = MessageDigest.getInstance("MD5");
		byte[] passBytes = password.getBytes();
		md.reset();
		byte[] digisted = md.digest(passBytes);
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < digisted.length; i++) {
			sb.append(Integer.toHexString(0xff & digisted[i]));
		}
		return sb.toString();
	}
}
