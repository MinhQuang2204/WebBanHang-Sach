package vn.iotstar.changeAccount;

import java.util.Iterator;
import java.util.Random;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SMSOTP {
	// Install the Java helper library from twilio.com/docs/java/install

	// Find your Account SID and Auth Token at twilio.com/console
	// and set the environment variables. See http://twil.io/secure
	public static final String ACCOUNT_SID = "AC4e56c514e6bc9b76e8885ac7771da4c7";
	public static final String AUTH_TOKEN = "243211e1c12918f27bf379feb172191d";

	public int genOTP(int otpLen, String phoneNumber) {
		Random random = new Random();

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < otpLen; i++) {
			sb.append(random.nextInt(10));
		}
		String otpvalue = sb.toString();
		int otp = Integer.parseInt(otpvalue);
		
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		Message message = Message.creator(new com.twilio.type.PhoneNumber(phoneNumber),
				new com.twilio.type.PhoneNumber("+17792091951"), "Your OTP: " + otp).create();

		System.out.println(message.getSid() + "\n" + "Your OTP: " + otp);
		return otp;
	}
}
