package com.bishe.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091600521671";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDzFK4m74TViyQwxPFMgSmsgi+qQKSWSm9uqbbe1Js3+gNDGLo5OLVbtq528vHM7KE2TtQJ10bUpzDz6VJqgt6jIoiy0tnSA5Ml7dXVHYlr3LE1iW1JI5/4wmLrVxspBtoun76d0/nxF+sGQe3eZDWUXOwF0KOZpau2YdwGtyjqMYu96HhOgBhQGe7S1F3d8Ajz0k5Uy8EK6G+cW65koxE4gq1c/02aYGsf5HOqNKbNzEh9x5nKdInMOBRYhtdU9NEqzWaaTiENuDk85qSBgbMTqLnkP5c5ZJnwSR8kraVwKMT7rPVomwYtC866jWRAi47BaN9PFdUON5IbV0CkG3vJAgMBAAECggEAN+3PMCg2EQgluI7n0il51DZUD0E2XVodD4I/EEAswpFkxMBgwJ+6orKCq920IuljImK6yNTeeDlLuyM5EkawQSrF9xcqhPbLmZOCermED+xEXcQUABsRSKQ5LFrrZeIsu0OIETpfrMhLDDKJL30xEsTajW/25HhI7PrRLD5iTJfM99djUdEJ/ULcA0UUNAJrpEcNePQcxEzp3UkVX3uVODvHjombXwJn5yW3yMccbLB1qkkixP9xaduRM/CWH6M5wR1fnxLMSt0NztfC9aM+eBo1Vvz33IQCRryjqYSdWDV/KhqCa5i973pgwZCkXDpNAyq6hrOxabrlqu5SHCP3gQKBgQD9OYJUO7G9fXfwkK5TucX5E1w/ZD4sn2OhkfPXD+iNittxsHJb7aQjzpou/zL4uZB920okq8HJzQCvxB5KWwFsxiEnGQXgonk1HtIPbAzat1ZBQe8CiMKDCfnhvsCCfmtUtmqslpk+iZiGybZxzEwC4f3WkFhCHD446KO8gUtVMQKBgQD1vrW155NuFj0gbnDQ/oyR6SRIfhDEiyLGf9aSlJkF9wMRDkTTgz8xEWToHdeswhl90SWdwt1bHO1JQTTal7KMo/qV6WEvXM9CqdguPu2rovypInzghObm27vwO950GTtV5QmSUCUrGr6A1SBBkf+FZX3rBw9Vohc9Fi39RyBKGQKBgBShCcAI+Orh/NJpRvplKP6omBxF81a5SWmRNVcw4ZYeWNBDOp3Il1WfcCoh+ioPG/lU0w53u5rQC51GEd2m2k/dODgyLqtlMRClySEegVGUG//G+kyvjYEVX/kHDDHVULMfBUO4JRXWKcnZRvawWQTnGkHPkpEYMe167lPeCKARAoGBAKY+WJDxUzQjCUEaVWmc+h1vOeNsnQ1JDsJ4EwFgU1DMtJ9iJr9rx2D7YmcAYTn2qOYLicX64GJV5FQtL4M9IkWwXMHzepJe17tCSQOoAIKfJQuKUC5W2hmMxswSxD+IHjLSWbJIU4ygcAWZqFOTX+evLArF4OLOX6gsi/oOltJpAoGBAJk3CYtxwfETN6Uji1iEJRMvuLQ5Uxw0WrJ3W6FJJXssGTYAzmfdhY8FlWdjNiOQbTfhg1LfUxFPV91V3O8R9EkPrD3LDTRXoenKU8VJdEZiV9h09Gdv15abaG0ijqlCcoF123hcoKrLEgcczrX/mqm/bgl0BOulyJuEjrhNZ3ra";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1ednCDqsYVNGxPdSdofB65ESx09SiIftPjGHTU/fcA217WHIB79kWXMzwtAS5m8tm+dRz5O9mQtk/H7bWEqUSq/BuIcwaS+XA0o+oEpaZsJVWIWhk2YNlfNVN/IZnrlxRoNQi/Iw+nYk67J4vY/hxV4ncT90gbv3vyFZR5rJc1KY6Zs+PekgkxrnRvoN19BdXPQICMPrds/6n0o8PREGPGPOouZ2CXaxTyswB+c0XoH4LU2sYn9b6Zp4dzuFHAXWs748CIIAPCkvVgeWLrIf2oitKK3m2DU50uwXfvCJnvAPm4qg2qHwNDeAHRsYo8QpLAfVkk78rg6X3467rQLHAwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://192.168.1.132:8080/Alipay/AlipaySuccess";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

