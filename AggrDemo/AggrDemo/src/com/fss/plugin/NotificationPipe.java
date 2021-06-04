package com.fss.plugin;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.HashMap;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class NotificationPipe 
{
String action;
    
    String transId;
    String amt;
    String responseURL;
    String trackid;
    //Added By Vinodhini T -For Cust Id
    String custid ;
    //Ends
    String udf1;
    String udf2;
    String udf3;
    String udf4;
    String udf5;
    
    // Added for Merchant Aggregator -by Madhu Ram Kumar Starts
    String udf6;
    String udf7;
    String udf8;
    String udf9;
    String udf10;
    String udf11;
    String udf12;
    String udf13;
    String udf14;
    String udf15;
 // Added for Merchant Aggregator -by Madhu Ram Kumar Ends
    
    
    String paymentPage;
    String paymentId;
    String result;
    String auth;
    String ref;
    String avr;
    String date;
   // String currency;
    String errorURL;
    String language;
    String error;
    String errorcode;
    String error_text;
    String rawResponse;
    String alias;
    StringBuffer debugMsg;
    String responseCode;
    String zip;
    String addr;
    //String member;
   // String cvv2;
    //String cvv2Verification;
    String type;
   /* String card;     
    String expDay;   
    String expMonth; 
    String expYear;  
    String eci;      
    String cavv;     
    String xid;
    String resourcePath;
    String acsurl;
    String pareq;
    String pares;
    String error_service_tag;
    static String keystorePath;*/
    static String seperator = "\\";
    static String sep="/";
    String webAddress;
    String key = "";
    String hashFlg =null;
	
	//Added by Pandiselvi A on 11 Dec 2014 for PreAuthentication
	String mobnum;
	String bankCode;
	//End
	
	// Added for Merchant Aggregator
	Long termkey;
	String tranportalid;
	String tranpassword;
	
	// added by arun k
	String status; 
	 
	String pgtranid;
	//Added By Sudharsan 
	String custAcctNo;
	
	String custvpa; //FOR TranPortal UPI
	
	String customername;
	
	String email;
	
	String invoiceid;
	String expirydate;
	String smsstatus;
	String emailstatus;
	
    public NotificationPipe()
    {
        action = "";
        transId = "";
        amt = "";
        responseURL = "";
        trackid = "";
        udf1 = "";
        udf2 = "";
        udf3 = "";
        udf4 = "";
        udf5 = "";
        //Added By Vinodhini T -For Cust Id
         custid = "";
        paymentPage = "";
        paymentId = "";
        result = "";
        auth = "";
        ref = "";
        date = "";
        //currency = "";
        errorURL = "";
        language = "";
        error = "";
        rawResponse = "";
        //resourcePath = "";
       // keystorePath="";
        errorcode="";
        debugMsg = new StringBuffer();
        tranpassword ="";
        tranportalid="";
        status="";
        custvpa = "";
        //Added by sudharsan
        custAcctNo="";
        customername="";
        email="";
        mobnum="";
        invoiceid="";
        expirydate="";
        smsstatus="";
        emailstatus="";
        
    }
    private synchronized StringBuffer buildMerchAggrXMLRequest()
	{
		StringBuffer requestbuffer;
		
		requestbuffer = new StringBuffer();		
		try{
		requestbuffer = new StringBuffer();		
		requestbuffer.append("<request>");	
			
		
     if(type!=null)
        	if(type.length() > 0)
        	{
        		requestbuffer.append("<type>"+type+"</type>");
        	}
      		
        /*if(currency!=null)
        	if(currency.length() > 0)
        	{
        		requestbuffer.append("<currency>"+currency+"</currency>");
        	}*/
      
        if(bankCode!=null)
        	if(bankCode.length() > 0)
        	{
        		requestbuffer.append("<bankCode>"+bankCode+"</bankCode>");
        	}
        if(transId!=null)
        	if(transId.length() > 0)
        	{
        		requestbuffer.append("<transid>"+transId+"</transid>");
        	}
       

        if(language!=null)
        	if(language.length() > 0)
        	{
        		requestbuffer.append("<langid>"+language+"</langid>");
        	}
       

        if(amt!=null)
        	if(amt.length() > 0)
        	{
        		requestbuffer.append("<amt>"+amt+"</amt>");
        	}
		if(action!=null)
			if(action.length() > 0)
			{
				requestbuffer.append("<action>"+action+"</action>");
			}
		if(trackid!=null)
			if(trackid.length() > 0)
			{
				requestbuffer.append("<trackid>"+trackid+"</trackid>");
			}
		if(udf1!=null)
			if(udf1.length() > 0)
			{
				requestbuffer.append("<udf1>"+udf1+"</udf1>");
			}
		if(udf2!=null)
			if(udf2.length() > 0)
			{
				requestbuffer.append("<udf2>"+udf2+"</udf2>");
			}
		if(udf3!=null)
			if(udf3.length() > 0)
			{
				requestbuffer.append("<udf3>"+udf3+"</udf3>");
			}
		if(udf4!=null)
			if(udf4.length() > 0)
			{
				requestbuffer.append("<udf4>"+udf4+"</udf4>");
			}
		if(udf5!=null)
			if(udf5.length() > 0)
			{
				requestbuffer.append("<udf5>"+udf5+"</udf5>");
			}
		if(udf6!=null)
			if(udf6.length() > 0)
			{
				requestbuffer.append("<udf6>"+udf6+"</udf6>");
			}
		if(udf7!=null)
			if(udf7.length() > 0)
			{
				requestbuffer.append("<udf7>"+udf7+"</udf7>");
			}
		if(udf8!=null)
			if(udf8.length() > 0)
			{
				requestbuffer.append("<udf8>"+udf8+"</udf8>");
			}
		if(udf9!=null)
			if(udf9.length() > 0)
			{
				requestbuffer.append("<udf9>"+udf9+"</udf9>");
			}
		if(udf10!=null)
			if(udf10.length() > 0)
			{
				requestbuffer.append("<udf10>"+udf10+"</udf10>");
			}
		if(udf11!=null)
			if(udf11.length() > 0)
			{
				requestbuffer.append("<udf11>"+udf11+"</udf11>");
			}
		if(udf12!=null)
			if(udf12.length() > 0)
			{
				requestbuffer.append("<udf12>"+udf12+"</udf12>");
			}
		if(udf13!=null)
			if(udf13.length() > 0)
			{
				requestbuffer.append("<udf13>"+udf13+"</udf13>");
			}
		if(udf14!=null)
			if(udf14.length() > 0)
			{
				requestbuffer.append("<udf14>"+udf14+"</udf14>");
			}
		if(udf15!=null)
			if(udf15.length() > 0)
			{
				requestbuffer.append("<udf15>"+udf15+"</udf15>");
			}
		/*if(currency!=null)
			if(currency.length() > 0)
			{
				requestbuffer.append("<currencycode>"+currency+"</currencycode>");
			}*/

	        if(custid!=null)
	        	if(custid.length() > 0)
	        	{
	        		requestbuffer.append("<custid>"+custid+"</custid>");
	        	}
	        //FOR TRANPORTAL UPI,To Store Customer VPA
		if(custvpa != null)
		{
			if(custvpa.length() > 0)
			{
				requestbuffer.append("<customer_vpa>"+custvpa.trim()+"</customer_vpa>");
			}
		}
		     if(custAcctNo!=null)
		    	 if(custAcctNo.length()>0){
		    		 requestbuffer.append("<NBAcctNo>"+custAcctNo+"</NBAcctNo>"); 
		    	 }
		     
		     if(customername!=null)
		    	 if(customername.length()>0){
		    		 requestbuffer.append("<customername>"+customername+"</customername>");
		    	 }
		     
		     
		     if(email!=null)
		    	 if(customername.length()>0){
		    		 requestbuffer.append("<email>"+email+"</email>");
		    	 }
		     
		     
		     if(mobnum!=null)
		    	 if(mobnum.length()>0){
		    		 requestbuffer.append("<mobnum>"+mobnum+"</mobnum>");
		    	 }
		     
		     
		     if(invoiceid!=null)
		    	 if(invoiceid.length()>0){
		    		 requestbuffer.append("<invoiceid>"+invoiceid+"</invoiceid>");
		    	 }
		     if(expirydate!=null)
		    	 if(expirydate.length()>0){
		    		 requestbuffer.append("<expirydate>"+expirydate+"</expirydate>");
		    	 }
		     
		     
		
		return requestbuffer;
		}catch (Exception e) {
				return null;
		}finally{
			requestbuffer = null;
		}
		
	}
        
    @SuppressWarnings("unchecked")
	private static HashMap parseResponse(String response)
	{
		
		HashMap responseMap;
		int begin=0;
		int end=0;
		String beginString="";
		String value="";
		try{
		responseMap = new HashMap();
		response = response.trim();		
		if(response == null || !response.startsWith("<") || response.length() < 0)
		{
			return null;
		}
		else
		{
			try
			{
				do
				{
					beginString=response.substring(response.indexOf("<")+1,response.indexOf(">"));			
					begin=response.indexOf("<")+beginString.length()+2;
					end=response.indexOf("</"+beginString);
					value=response.substring(begin,end);
					end= end+ beginString.length()+3;					
					response = response.substring(end,response.length());
					System.out.println("beginString : " + beginString +",value : " + value);
					responseMap.put(beginString,value);					
					begin=0;
					end=0;
					beginString="";					
				}while(response.length()>0);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}		
		return responseMap;
		}catch (Exception e) {
			return null;
		}finally{
			 responseMap= null;
			 begin=0;
			 end=0;
			 beginString= null;
			 value= null;
		}
		
	}
    public synchronized void generateCheckSum() {
		StringBuffer hashReq = new StringBuffer();
		String hashStr = null;
		try {
			hashReq.append(this.getTranportalid());
			hashReq.append(this.getInvoiceid());
			hashReq.append(this.getAmt());
			hashReq.append(this.getTrackid());
			//hashReq.append(this.getCurrency());
			hashReq.append(this.getAction());
			//hashReq.append(this.getCard());
			//.append(this.getExpMonth());
			//hashReq.append(this.getExpYear());
			//hashReq.append(this.getCvv2());
			hashStr=  hashReq.toString();
			System.out.println("Hashing request:: "+ hashReq.toString()); 
			this.setUdf2(getSha256(hashStr));
			System.out.println("Hashed request"+ this.getUdf1()); 
			
		} catch (Exception e) {
			System.out.println("Problem occured while hashing request");
		}
		
	}
	public  String getSha256(String value) {
	    try{
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(value.getBytes());
	        return bytesToHex(md.digest());
	    } catch(Exception ex){
	        throw new RuntimeException(ex);
	    }
	 }

	 private static  String bytesToHex(byte[] bytes) {
		    StringBuffer result = new StringBuffer();
		    for (byte b : bytes) result.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
		    return result.toString();
		 }
    public synchronized int performMerchAggrInitializationTCPIP(String key1)
	{
		String request="";
		StringBuffer requestbuffer;
		String id = this.getTranportalid();	
		String pwd = this.getTranpassword();	
		String encrypted= "";
		String response="";
		String tranType="tran"; 
		try 
		{			
			
			requestbuffer = new StringBuffer();
			//if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
				generateCheckSum();
			requestbuffer = buildMerchAggrXMLRequest();
			requestbuffer.append("<tranportalid>"+id+"</tranportalid>");
			requestbuffer.append("<tranpassword>"+pwd+"</tranpassword>");
			//requestbuffer.append("<errorURL>"+errorURL+"</errorURL>");
		//	requestbuffer.append("<responseURL>"+responseURL+"</responseURL>");
			requestbuffer.append("</request>");	
			//requestbuffer.append("password=" +password + "&");
			if(this.action.equalsIgnoreCase("1")||this.action.equalsIgnoreCase("4"))
				webAddress = webAddress+"/MerchaggrPayment.htm?param=pymntInvoiceInit";
				//webAddress ="https://merchanthubtest.fssnet.co.in/fsspay/MerchaggrPayment.htm?param=pymntInvoiceInit";
			else
				webAddress = webAddress+"/MerchaggrPayment.htm?param=supportInitTCPIP";
			System.out.println("Tran ID:"+id);
			System.out.println("Tran Request:"+requestbuffer.toString());
			
				request=requestbuffer.toString();
				
		
			
			System.out.println("Tran ID:"+id);
			System.out.println("Tran Request:"+request);
			
			
			
			System.out.println("request"+request);
			
			//webAddress = webAddress +request;	
			
			System.out.println("WEBADDR:"+webAddress);
			

			response = sendMessage(request, webAddress, tranType);			
			if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
			{
				response =decryptAESPKCS5(response, key1);	
				
			}
			System.out.println("Final Response" +response);
			int parseresult = parseMerchAggrResult(response);
			if(parseresult == 0)
				return 0;
			else
			{
				error = "Error while connecting " + response;
				return -1;
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			error = "Error while processing request!";
			return -1;
		}
		finally{
			
			 request= null;
			 requestbuffer= null;
		}
	
	
	}
    @SuppressWarnings("unchecked")
	public synchronized int parseMerchAggrResult(String response)
	{
		HashMap resultMap;
		String responseTemp="";
		try
        {					
			resultMap = new HashMap();
			resultMap = parseResponse(response);	
			System.out.println("resultMap : " + resultMap);
		
         
            responseTemp = (String)resultMap.get("payid");//Modified by Punitha A
            if(responseTemp != null)
                this.paymentId = responseTemp.trim();
            System.out.println("paymentID : " + this.paymentId);
			
			responseTemp = (String)resultMap.get("result");
            if(responseTemp != null)
                this.result = responseTemp.trim();
            responseTemp = (String)resultMap.get("auth");
            if(responseTemp != null)
                auth = responseTemp.trim();
            responseTemp = (String)resultMap.get("ref");
            if(responseTemp != null)
                ref = responseTemp.trim();
            responseTemp = (String)resultMap.get("avr");
            if(responseTemp != null)
                avr = responseTemp.trim();
            responseTemp = (String)resultMap.get("postdate");
            if(responseTemp != null)
                date = responseTemp.trim();
            responseTemp = (String)resultMap.get("tranid");
            if(responseTemp != null)
                transId = responseTemp.trim();
            //Added By Vinodhini T
            responseTemp = (String)resultMap.get("custid");
            if(responseTemp != null)
                custid = responseTemp.trim();
            //Ends
            responseTemp = (String)resultMap.get("amt");
            if(responseTemp != null)
                amt = responseTemp.trim();
            responseTemp = (String)resultMap.get("trackid");
            if(responseTemp != null)
                trackid = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf1");
            if(responseTemp != null)
                udf1 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf2");
            if(responseTemp != null)
                udf2 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf3");
            if(responseTemp != null)
                udf3 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf4");
            if(responseTemp != null)
                udf4 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf5");
            if(responseTemp != null)
                udf5 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf6");
            if(responseTemp != null)
                udf6 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf7");
            if(responseTemp != null)
                udf7 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf8");
            if(responseTemp != null)
                udf8 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf9");
            if(responseTemp != null)
                udf9 = responseTemp.trim();
            responseTemp = (String)resultMap.get("udf10");
            if(responseTemp != null)
                udf10 = responseTemp.trim();
            responseTemp = (String)resultMap.get("error_code_tag");
            if(responseTemp != null)
                error = responseTemp.trim();
          
            responseTemp = (String)resultMap.get("error_text");
            if(responseTemp != null)
                error_text = responseTemp.trim();
            responseTemp = (String)resultMap.get("responsecode");
            if(responseTemp != null)
                responseCode = responseTemp.trim();
      
            responseTemp = (String)resultMap.get("error");
            if(responseTemp != null)
                errorcode = responseTemp.trim();
            responseTemp = (String)resultMap.get("pgtranid");
            if(responseTemp != null)
            	pgtranid = responseTemp.trim();
            
            
            responseTemp = (String)resultMap.get("mobilenum");
            if(responseTemp != null)
            	mobnum = responseTemp.trim();
            responseTemp = (String)resultMap.get("invoiceid");
            if(responseTemp != null)
            	invoiceid = responseTemp.trim();
            responseTemp = (String)resultMap.get("email");
            if(responseTemp != null)
            	email = responseTemp.trim();
            responseTemp = (String)resultMap.get("smsstatus");
            if(responseTemp != null)
            	smsstatus = responseTemp.trim();
            
            responseTemp = (String)resultMap.get("emailstatus");
            if(responseTemp != null)
            	emailstatus = responseTemp.trim();
            
            responseTemp = (String)resultMap.get("error");
            if(responseTemp != null)
            	error = responseTemp.trim();
            
                
                
                
            if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
            {
            return  validateRespCheckSum();
            }
             
            return 0;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            error = "Internal Error: " + e.getMessage();
            return -1;
        }finally{
    		
    		resultMap=null;
    		responseTemp=null;
        }
		
	}
    private int validateRespCheckSum() {
		StringBuffer resphash = new StringBuffer();
		String hashedVal = null;
	try {
		resphash.append(result != null? result:"");
		resphash.append(transId!= null? transId:"");
		resphash.append(amt!= null? amt:"");
		resphash.append(auth!= null? auth:"");
		resphash.append(pgtranid!= null? pgtranid:"");
		resphash.append(paymentId!= null? paymentId:"");
		resphash.append(trackid!= null? trackid:"");
		System.out.println("resp hash string received ::" +resphash.toString());
		if(udf2.equals(getSha256(resphash.toString())))
		{
		System.out.println("Hash validation success");
		}else
		{
		System.out.println("Hash validation Failed");
		return -1;
		}
	} catch (Exception e) {
	e.fillInStackTrace();
	System.out.println("problem occured while validating checksum");
		}
	return 0;		
	}

 
    public String encryptAESPKCS5(String encryptString, String key) throws Exception{		
		 byte[] encryptedText=null;
		 String encryptedData=null;
		 IvParameterSpec ivspec=null;
		 SecretKeySpec skeySpec=null;
		 Cipher cipher=null;
		 byte[]  text=null;
		 try{
			 ivspec = new IvParameterSpec(key.getBytes("UTF-8"));
			 skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
			 cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			 cipher.init(Cipher.ENCRYPT_MODE, skeySpec,ivspec);
			 text = encryptString.getBytes("UTF-8");
			 encryptedText = cipher.doFinal(text);
		     encryptedData=Base64.encodeBase64String(encryptedText);
		     encryptedData =URLEncoder.encode(encryptedData,"UTF-8");
		 }catch(Exception e){
			e.printStackTrace();
		 }
		 finally
		 {
			 encryptedText=null;
			 ivspec=null;
			 skeySpec=null;
			 cipher=null; 
			 text=null;
		 }
		  return encryptedData;	 
	 }
	 
		
	 public String decryptAESPKCS5(String encryptedString, String key) throws Exception{
		 byte[] decrypted=null;
		 SecretKeySpec skeySpec=null;
		 IvParameterSpec ivspec=null;
		 Cipher cipher =null;
		 byte[] textDecrypted=null;
		 try{
		     System.out.println("encryptedString : "+encryptedString);	
		     System.out.println("key : "+key);	
			 decrypted =Base64.decodeBase64(encryptedString);
			 skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
			 ivspec = new IvParameterSpec(key.getBytes("UTF-8"));
			 cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			 cipher.init(Cipher.DECRYPT_MODE, skeySpec,ivspec);
			 textDecrypted = cipher.doFinal(decrypted);
		 }catch(Exception e){
			e.printStackTrace();
		 }
		 finally
		 {
			  decrypted=null;
			  skeySpec=null;
			  ivspec=null;
			  cipher =null;
		 }
		 
		 return(new String(textDecrypted));
	 }
    
    private synchronized static String sendMessage(String request, String webAddress, String tranType)
	{
		String rawResponse="";
        if(webAddress.indexOf("https") != -1)
            System.setProperty("java.protocol.handler.pkgs", "com.sun.net.ssl.internal.www.protocol");
        try
        {
            if(webAddress.length() <= 0)
            {
                return null;
            }
            //URL url = new URL("http://10.44.72.55:8080/NEWPG//Payment.htm?param=paymentInit");
            System.out.println("url : "+webAddress);
            URL url = new URL(webAddress);
            URLConnection urlconnection;
            urlconnection = url.openConnection();
            urlconnection.setDoInput(true);
            urlconnection.setDoOutput(true);
            urlconnection.setUseCaches(false);
            if(tranType.equals("host"))
            	urlconnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            if(tranType.equals("tran"))
            	urlconnection.setRequestProperty("Content-Type", "application/xml");

            if(request.length() > 0)
            {
                DataOutputStream dataoutputstream = new DataOutputStream(urlconnection.getOutputStream());
                dataoutputstream.writeBytes(request);
                dataoutputstream.flush();
                dataoutputstream.close();
                BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
                if(tranType.equals("host"))
                	rawResponse = bufferedreader.readLine();
                else if(tranType.equals("tran"))
                {
                	StringBuffer buf = new StringBuffer();
                	do
                    {
                        String s = bufferedreader.readLine();
                        if(s == null)
                            break;
                        buf.append(s);
                    }while(true);
                	rawResponse = buf.toString();
                }
                
                return rawResponse;
            } else
            {
            	return null;
            }
        }
        catch(Exception exception)
        {
        	exception.printStackTrace();
            return null;
        }
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getTransId() {
		return transId;
	}
	public void setTransId(String transId) {
		this.transId = transId;
	}
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}
	public String getResponseURL() {
		return responseURL;
	}
	public void setResponseURL(String responseURL) {
		this.responseURL = responseURL;
	}
	public String getTrackid() {
		return trackid;
	}
	public void setTrackid(String trackid) {
		this.trackid = trackid;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getUdf1() {
		return udf1;
	}
	public void setUdf1(String udf1) {
		this.udf1 = udf1;
	}
	public String getUdf2() {
		return udf2;
	}
	public void setUdf2(String udf2) {
		this.udf2 = udf2;
	}
	public String getUdf3() {
		return udf3;
	}
	public void setUdf3(String udf3) {
		this.udf3 = udf3;
	}
	public String getUdf4() {
		return udf4;
	}
	public void setUdf4(String udf4) {
		this.udf4 = udf4;
	}
	public String getUdf5() {
		return udf5;
	}
	public void setUdf5(String udf5) {
		this.udf5 = udf5;
	}
	public String getUdf6() {
		return udf6;
	}
	public void setUdf6(String udf6) {
		this.udf6 = udf6;
	}
	public String getUdf7() {
		return udf7;
	}
	public void setUdf7(String udf7) {
		this.udf7 = udf7;
	}
	public String getUdf8() {
		return udf8;
	}
	public void setUdf8(String udf8) {
		this.udf8 = udf8;
	}
	public String getUdf9() {
		return udf9;
	}
	public void setUdf9(String udf9) {
		this.udf9 = udf9;
	}
	public String getUdf10() {
		return udf10;
	}
	public void setUdf10(String udf10) {
		this.udf10 = udf10;
	}
	public String getUdf11() {
		return udf11;
	}
	public void setUdf11(String udf11) {
		this.udf11 = udf11;
	}
	public String getUdf12() {
		return udf12;
	}
	public void setUdf12(String udf12) {
		this.udf12 = udf12;
	}
	public String getUdf13() {
		return udf13;
	}
	public void setUdf13(String udf13) {
		this.udf13 = udf13;
	}
	public String getUdf14() {
		return udf14;
	}
	public void setUdf14(String udf14) {
		this.udf14 = udf14;
	}
	public String getUdf15() {
		return udf15;
	}
	public void setUdf15(String udf15) {
		this.udf15 = udf15;
	}
	public String getPaymentPage() {
		return paymentPage;
	}
	public void setPaymentPage(String paymentPage) {
		this.paymentPage = paymentPage;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getAvr() {
		return avr;
	}
	public void setAvr(String avr) {
		this.avr = avr;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	/*public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}*/
	public String getErrorURL() {
		return errorURL;
	}
	public void setErrorURL(String errorURL) {
		this.errorURL = errorURL;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getErrorcode() {
		return errorcode;
	}
	public void setErrorcode(String errorcode) {
		this.errorcode = errorcode;
	}
	public String getError_text() {
		return error_text;
	}
	public void setError_text(String error_text) {
		this.error_text = error_text;
	}
	public String getRawResponse() {
		return rawResponse;
	}
	public void setRawResponse(String rawResponse) {
		this.rawResponse = rawResponse;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public StringBuffer getDebugMsg() {
		return debugMsg;
	}
	public void setDebugMsg(StringBuffer debugMsg) {
		this.debugMsg = debugMsg;
	}
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public static String getSeperator() {
		return seperator;
	}
	public static void setSeperator(String seperator) {
		NotificationPipe.seperator = seperator;
	}
	public static String getSep() {
		return sep;
	}
	public static void setSep(String sep) {
		NotificationPipe.sep = sep;
	}
	public String getWebAddress() {
		return webAddress;
	}
	public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getHashFlg() {
		return hashFlg;
	}
	public void setHashFlg(String hashFlg) {
		this.hashFlg = hashFlg;
	}
	
	public String getMobnum() {
		return mobnum;
	}
	public void setMobnum(String mobnum) {
		this.mobnum = mobnum;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public Long getTermkey() {
		return termkey;
	}
	public void setTermkey(Long termkey) {
		this.termkey = termkey;
	}
	
	public String getTranportalid() {
		return tranportalid;
	}
	public void setTranportalid(String tranportalid) {
		this.tranportalid = tranportalid;
	}
	public String getTranpassword() {
		return tranpassword;
	}
	public void setTranpassword(String tranpassword) {
		this.tranpassword = tranpassword;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPgtranid() {
		return pgtranid;
	}
	public void setPgtranid(String pgtranid) {
		this.pgtranid = pgtranid;
	}
	public String getCustAcctNo() {
		return custAcctNo;
	}
	public void setCustAcctNo(String custAcctNo) {
		this.custAcctNo = custAcctNo;
	}
	public String getCustvpa() {
		return custvpa;
	}
	public void setCustvpa(String custvpa) {
		this.custvpa = custvpa;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInvoiceid() {
		return invoiceid;
	}
	public void setInvoiceid(String invoiceid) {
		this.invoiceid = invoiceid;
	}
	public String getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}
	public String getSmsstatus() {
		return smsstatus;
	}
	public void setSmsstatus(String smsstatus) {
		this.smsstatus = smsstatus;
	}
	public String getEmailstatus() {
		return emailstatus;
	}
	public void setEmailstatus(String emailstatus) {
		this.emailstatus = emailstatus;
	}
	
	
}
