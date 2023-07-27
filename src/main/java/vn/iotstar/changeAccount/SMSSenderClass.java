package vn.iotstar.changeAccount;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class SMSSenderClass {
	public static void main(String[] args) {
		try {
			// Construct data
			String apiKey = "apikey=" + "NjM2ZDY0NTA2YTdhNjQ0MjUyNjc2YjRlNGIzOTU5NzA=";
			String message = "&message=" + "This is your message";
			String sender = "&sender=" + "Jims Autos";
			String numbers = "&numbers=" + "0389850690";
			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.txtlocal.com/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			
			System.out.println(stringBuffer.toString()); 
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			System.out.println("Error "+e); 
		}
	}
}
