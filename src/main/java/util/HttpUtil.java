package util;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtil {
    private String value;
    
    public HttpUtil(String value) {
        this.value = value;
    }
    public <T> T toModel(Class<T> tClass) {
        try {
            return new ObjectMapper().readValue(value, tClass);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public <T> List<T> ListModel(Class<T> tClass){
        List<T> list = new ArrayList<T>();
        try {
            list.add(new ObjectMapper().readValue(value, tClass));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public static HttpUtil of (BufferedReader reader) {
        StringBuilder sb = new StringBuilder();
        try {
            String line;
            while((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return new HttpUtil(sb.toString());
    }
}
