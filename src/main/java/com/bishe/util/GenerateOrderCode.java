package com.bishe.util;

import java.util.Random;

public class GenerateOrderCode {
	
	/*用于混淆生成验证码*/
	private final String salt="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
	private final int length=7;
	
	
	
	public String getSalt() {
		return salt;
	}

	public int getLength() {
		return length;
	}

	//生成随机验证码
	public String GenerateCode() {
        //由Random生成随机数
        Random random=new Random();  
        StringBuffer sb=new StringBuffer();
        //长度为几就循环几次
        for(int i=0; i<this.length; ++i){
          //产生0-61的数字
          int number=random.nextInt(62);
          //将产生的数字通过length次承载到StringBuffer中
          sb.append(salt.charAt(number));
        }
        //将承载的字符转换成字符串
        return sb.toString();
	}
	
	//生成随机订单号
	public String GenerateNum() {
			
	        //由Random生成随机数
	        Random random=new Random(); 
	        String num =String.valueOf(random.nextInt(9)+1);
	        //长度为几就循环几次
	        for(int i=0; i<this.length; ++i){
	          //产生0-61的数字
	          int number=random.nextInt(62);
	          num=num+String.valueOf(number);
	        }
	        //将承载的字符转换成字符串
	        return num.trim();
	}
	
}
