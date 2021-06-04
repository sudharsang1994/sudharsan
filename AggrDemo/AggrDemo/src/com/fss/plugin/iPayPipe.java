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

public final  class iPayPipe
{
    String action;
    
    String transId;
    String amt;
    String responseURL;
    String trackId;
    //Added By Vinodhini T -For Cust Id
    String custid ;
    String siflag;
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
    String currency;
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
    String member;
    String cvv2;
    String cvv2Verification;
    String type;
    String card;     
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
    static String keystorePath;
    static String seperator = "\\";
    static String sep="/";
    String webAddress;
    String key = "";
    String hashFlg =null;
	
	//Added by Pandiselvi A on 11 Dec 2014 for PreAuthentication
	String mobilenum;
	String mmid;
	String otp;
    //End

	//Added  for Merchant saved card
	String savedCard;
	String bankCode;
	//End
	
	// Added for Merchant Aggregator
	Long termkey;
	String tranportalId;
	String tranportalPW;
	
	// added by arun k
	String status; 
	 
	String pgtranid;
	//Added By Sudharsan 
	String custAcctNo;
	
	String vpaurl;
	
	String custvpa; //FOR TranPortal UPI
	
    public iPayPipe()
    {
        action = "";
        transId = "";
        amt = "";
        responseURL = "";
        trackId = "";
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
        currency = "";
        errorURL = "";
        language = "";
        error = "";
        rawResponse = "";
        resourcePath = "";
        keystorePath="";
        errorcode="";
        debugMsg = new StringBuffer();
        tranportalPW ="";
    	
        status="";
        custvpa = "";
        //Added by sudharsan
        custAcctNo="";
        vpaurl="";
    }
        
	
	
	/***********************************************************************************************
	 * Purpose in brief : This method is used for build the request for Merchant Aggregator Transaction
	 * Written by 		: Madhu Ram Kumar C.
	 * Last Modified 	: 06-01-17
	 * Arguments passed : EMPTY
	 **********************************************************************************************/
	
	private synchronized StringBuffer buildMerchAggrXMLRequest()
	{
		StringBuffer requestbuffer;
		
		requestbuffer = new StringBuffer();		
		try{
		requestbuffer = new StringBuffer();		
		requestbuffer.append("<request>");	
			
		if(cavv!=null)
		{
			if(cavv.length() > 0)
			{
				requestbuffer.append("<cavv>"+cavv+"</cavv>");
			}
		}	
     if(type!=null)
        	if(type.length() > 0)
        	{
        		requestbuffer.append("<type>"+type+"</type>");
        	}
        if(card!=null)
			if(card.length() > 0)
			{
				requestbuffer.append("<card>"+card+"</card>");
			}		
		if(cvv2!=null)
			if(cvv2.length() > 0)
			{
				requestbuffer.append("<cvv2>"+cvv2+"</cvv2>");
			}
		if(expYear!=null)
			if(expYear.length() > 0)
			{
				requestbuffer.append("<expyear>"+expYear+"</expyear>");
			}
		if(expMonth!=null)
			if(expMonth.length() > 0)
			{
				requestbuffer.append("<expmonth>"+expMonth+"</expmonth>");
			}
		if(member!=null)
        	if(member.length() > 0)
        	{
        		requestbuffer.append("<member>"+member+"</member>");
        	}
        if(currency!=null)
        	if(currency.length() > 0)
        	{
        		requestbuffer.append("<currency>"+currency+"</currency>");
        	}
       /* if(type!=null)
        	if(type.length() > 0)
        	{
        		requestbuffer.append("<type>"+type+"</type>");
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
        if(zip!=null)
        	if(zip.length() > 0)
        	{
        		requestbuffer.append("<zip>"+zip+"</zip>");
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
		if(trackId!=null)
			if(trackId.length() > 0)
			{
				requestbuffer.append("<trackid>"+trackId+"</trackid>");
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
		if(currency!=null)
			if(currency.length() > 0)
			{
				requestbuffer.append("<currencycode>"+currency+"</currencycode>");
			}
		if(eci!=null)
			if(eci.length() > 0)
			{
				requestbuffer.append("<eci>"+eci+"</eci>");
			}


	        /*Added by Pandiselvi A on 11 Dec 2014 for PreAuthenticated Transaction */
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
		    		 requestbuffer.append("<NBAcctNo>"+custAcctNo+"</NBAcctNo>"); // Added by sudharsan
		    	 }
		
		return requestbuffer;
		}catch (Exception e) {
				return null;
		}finally{
			requestbuffer = null;
		}
		
	}
	
	/**************************************************************************************************
	 * Purpose in brief : This method is used for parsing the Tranportal Response and assign to HashMAP
	 * Written by 		: Vijayarumugam K 
	 * Last Modified 	: 21 April 2009
	 * Arguments passed : response
	 *************************************************************************************************/
	
	@SuppressWarnings("unchecked")
	private static HashMap parseResponse(String response)
	{
		
	//	String  response1="<result>FAILURE</result><tranid>602201826328996057</tranid><rechargeid>602201826328996057</rechargeid><trackid>1674166900</trackid><rechargerNumber>96879837233</rechargerNumber><amt>165</amt><rechargeOperator>vodafone</rechargeOperator><rechargeCircle>TN<rechargeCircle><rechargeType>top</rechargeType><udf1>somesh</udf1><udf3>10000550</udf3><udf5></udf5></result>";
		

		
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
	
	@SuppressWarnings("unchecked")
	public synchronized int performMerchAggrInitializationHTTP(String key1)
	{
		String request="";
		StringBuffer requestbuffer;
		String id = this.getTranportalId();	
		String pwd =this.getTranportalPW();	
		String encrypted= "";
		String response="";
		try 
		{			
			requestbuffer = new StringBuffer();
			if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
			generateCheckSum();
			requestbuffer = buildMerchAggrXMLRequest();
			requestbuffer.append("<id>"+id+"</id>");
			requestbuffer.append("<password>"+pwd+"</password>");
			requestbuffer.append("<errorURL>"+errorURL+"</errorURL>");
			requestbuffer.append("<responseURL>"+responseURL+"</responseURL>");	
			requestbuffer.append("</request>");	
			//requestbuffer.append("<request><currency>356</currency><transid>1212400729123112</transid><langid>USA</langid><amt>713.15</amt><action>2</action><trackId>1002400731144140</trackId><udf5>trackid</udf5><currencycode>356</currencycode><id>FSS0000194</id><password>password@123</password><errorURL>https://www.letzpay.com/pgui/jsp/fssPayResponse</errorURL><responseURL>https://www.letzpay.com/pgui/jsp/fssPayResponse</responseURL></request>");

				 


			
			//requestbuffer.append("password=" +password + "&");
			if(this.action.equalsIgnoreCase("1")||this.action.equalsIgnoreCase("4"))
			webAddress = webAddress+"/MerchaggrPayment.htm?param=paymentInit";
			//webAddress = "http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=paymentInit";
			else
				webAddress = webAddress+"/MerchaggrPayment.htm?param=supportInit";
		//	webAddress="http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=rvslInit";
			
			System.out.println("Tran ID:"+id);
			System.out.println("Tran Request :: "+requestbuffer.toString());
			encrypted =encryptAESPKCS5(requestbuffer.toString(), key1);
			//System.out.println("Encoded :: "+encrypted);	
			request = "&trandata="+encrypted;
			//System.out.println("Encrypted:"+encrypted);
			request = request+"&errorURL="+errorURL+"&responseURL="+responseURL+"&tranportalId="+id;
			//System.out.println("request"+request);
			webAddress = webAddress +request;	
			System.out.println("WEBADDR :: "+webAddress);
			

			/*response = performHostedTransaction(request, webAddress);			
			if (response != null) {
				int i = response.indexOf(":");
				if (i == -1) {
					error = "Error while connecting " + response;
					return -1;
				} else {
					if (response != null) {
						paymentId = response.substring(0, i);
						System.out.println("pay id : "+paymentId);
						paymentPage = response.substring(i + 1);
						System.out.println("paymentPage : "+paymentPage);
						return 0;
					} else {
						error = "Error while connecting " + response;
						return -1;
					}
				}
			} else {
				error = "Error while connecting " + response;
				return -1;
			}*/
			return 0;
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
    
	public synchronized void generateCheckSum() {
		StringBuffer hashReq = new StringBuffer();
		String hashStr = null;
		try {
			hashReq.append(this.getTranportalId());
			hashReq.append(this.getTrackId());
			hashReq.append(this.getAmt());
			hashReq.append(this.getCurrency());
			hashReq.append(this.getAction());
			hashReq.append(this.getCard());
			hashReq.append(this.getExpMonth());
			hashReq.append(this.getExpYear());
			hashReq.append(this.getCvv2());
			hashStr=  hashReq.toString();
			System.out.println("Hashing request:: "+ hashReq.toString()); 
			this.setUdf10(getSha256(hashStr));
			System.out.println("Hashed request"+ this.getUdf10()); 
			
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
	@SuppressWarnings("unchecked")
	public synchronized int parseEncryptedMerchAggrResult(String response,String key)
	{
		HashMap resultMap;
		String responseTemp="";
		String[] response1=null;
		String[] response2=null;
		String[] response3=null;
		try
        {	
			System.out.println("Respponse"+response);
			
			
			if((response.contains("&tranportalId="))&&(response.contains("&trackID="))&&(response.contains("&FSSTranID=")))
				
			{
				response1 = response.split("&tranportalId=");
				
			if(response1[1].contains("&trackID="))
			response2 =response1[1].split("&trackID=");
	
			if(response1[1].contains("&FSSTranID="))
			 response3 =response1[1].split("&FSSTranID=");
			
			
			System.out.println("Trandata"+response1[0]);
			System.out.println("Tranportal ID"+response2[0]);
			System.out.println("trackID"+response2[1]);
			System.out.println("FSSTran ID"+response3[1]);
			response=response1[0];
			}
			
			else if((response.contains("&tranportalId="))&&(response.contains("&trackID=")))
			{
				response1 = response.split("&tranportalId=");
				
				if(response1[1].contains("&trackID="))
				response2 =response1[1].split("&trackID=");
				response=response1[0];
			}
			
			else if((response.contains("&tranportalId="))&&(response.contains("&FSSTranID=")))
			{
				response1 = response.split("&tranportalId=");
				
				if(response1[1].contains("&FSSTranID="))
				response2 =response1[1].split("&FSSTranID=");
				response=response1[0];
			}
			
			
			else if((response.contains("&trackID="))&&(response.contains("&FSSTranID=")))
			{
				response1 = response.split("&trackID=");
				
				if(response1[1].contains("&FSSTranID="))
				response2 =response1[1].split("&FSSTranID=");
				response=response1[0];
			}
			
			else if(response.contains("&tranportalId="))
					{
				response1 = response.split("&tranportalId=");
				response=response1[0];
					}
			
			else if(response.contains("&trackID="))
			{
		response1 = response.split("&trackID=");
		response=response1[0];
			}
			else if(response.contains("&FSSTranID="))
			{
		response1 = response.split("&FSSTranID=");
		response=response1[0];
			}
			
			
			response =decryptAESPKCS5(response, key);	
			System.out.println("resultMap : " + response);
			resultMap = new HashMap();
			resultMap = parseResponse(response);	
			System.out.println("resultMap : " + resultMap);
			responseTemp = (String)resultMap.get("url");
            if(responseTemp != null)
                this.acsurl = responseTemp.trim();
            responseTemp = (String)resultMap.get("PAReq");
            if(responseTemp != null)
                this.pareq = responseTemp.trim();
            responseTemp = (String)resultMap.get("payid");//Modified by Punitha A
            if(responseTemp != null)
                this.paymentId = responseTemp.trim();
            System.out.println("paymentID : " + this.paymentId);
			responseTemp = (String)resultMap.get("eci");
            if(responseTemp != null)
                this.eci = responseTemp.trim();
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
                trackId = responseTemp.trim();
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
            responseTemp = (String)resultMap.get("error_service_tag");
            if(responseTemp != null)
            	error_service_tag = responseTemp.trim();
            responseTemp = (String)resultMap.get("error_text");
            if(responseTemp != null)
                error_text = responseTemp.trim();
            responseTemp = (String)resultMap.get("responsecode");
            if(responseTemp != null)
                responseCode = responseTemp.trim();
            responseTemp = (String)resultMap.get("cvv2response");
            if(responseTemp != null)
                cvv2Verification = responseTemp.trim();
            responseTemp = (String)resultMap.get("pgtranid");
            if(responseTemp != null)
            	pgtranid = responseTemp.trim();
            	
        	if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()) && this.getUdf10() != null)
    			return validateRespCheckSum();
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
	
	
	
	
	public synchronized int parseEncryptedOTPAggrResult(String response,String key)
	{   
		
		HashMap resultMap;
		String responseTemp="";
		try
        {					
			
			response =decryptAESPKCS5(response, key);	
			System.out.println("resultMap : " + response);
			resultMap = new HashMap();
			resultMap = parseResponse(response);	
			System.out.println("resultMap : " + resultMap);
			 responseTemp = (String)resultMap.get("enrolled");
	         if(responseTemp != null)
	           status = responseTemp.trim(); 
	         responseTemp = (String)resultMap.get("error");
	        if(responseTemp != null)
	          error = responseTemp.trim();      
            responseTemp = (String)resultMap.get("tranid");
            if(responseTemp != null)
                transId = responseTemp.trim();
            responseTemp = (String)resultMap.get("trackid");
            if(responseTemp != null)
                trackId = responseTemp.trim();
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
            responseTemp = (String)resultMap.get("error_code_tag");
            if(responseTemp != null)
                error = responseTemp.trim();
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
	public synchronized int parseEncryptedVPAURLAggrResult(String response,String key)
	{   
		
		HashMap resultMap;
		String responseTemp="";
		try
        {					
			
			response =decryptAESPKCS5(response, key);	
			System.out.println("resultMap : " + response);
			resultMap = new HashMap();
			resultMap = parseResponse(response);	
			System.out.println("resultMap : " + resultMap);
			 responseTemp = (String)resultMap.get("vpaurl");
	         if(responseTemp != null)
	           vpaurl = responseTemp.trim(); 
	         responseTemp = (String)resultMap.get("error");
	        if(responseTemp != null)
	          error = responseTemp.trim();      
            responseTemp = (String)resultMap.get("tranid");
            if(responseTemp != null)
                transId = responseTemp.trim();
            responseTemp = (String)resultMap.get("trackid");
            if(responseTemp != null)
                trackId = responseTemp.trim();
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
            responseTemp = (String)resultMap.get("result");
            if(responseTemp != null)
            	result = responseTemp.trim();
            responseTemp = (String)resultMap.get("error_code_tag");
            if(responseTemp != null)
                error = responseTemp.trim();
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
/*	public static void main(String[] args) throws Exception {
	
	String res ="F%2f7Ibs%2ftHG05QMLa463TWhWy1C1hHCHToXm9XStDr0RmFIxqgLrH7kOZ%2fX0697oGjAtn0W0q5dtcXG7etEDxIUL7Ls5LrrnIifwUMqJ2hnYm%2fIK8Ja34CmUGEB9iXbBoh0XxRNPcRYtkbAF9D5HW8mq6DfQN9zQzxgkwQoBpAnFvgFYbpG%2bAEZMu1SxEBOzEOeu2KGEk37pREs51gigNHoSgZWS6wRoTsLNHB8GDGsB4tBiELIlx%2b4j4pyfZp4qeIJad8vf0mahweG7hJRx1Rce3WZyfJWiWmOUNs35pAXSYoZ1KGp9kwtdtzDTWk7D5K%2f%2fYZnQyZOaY%2frPxwANcUqJrbc%2babYUndxl08apZlqE%3d";
	res =URLDecoder.decode(res,"UTF-8");
	System.out.println("Res:"+res);
	String key ="7201291824237201";
	iPayPipe pipe = new iPayPipe();
	
	System.out.println("Response"+pipe.parseEncryptedMerchAggrResult(res, key));
		
	}*/
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
	 
	/*	public synchronized String performHostedTransaction(String request, String webAddress)
		{
			//webAddress = webAddress + "/Payment.htm?param=paymentInit";
			request="&"+request;
			String response="";
			String tranType="host"; // For Identifying the Type of Transaction
			response= sendMessage(request,webAddress, tranType);
			if(response!=null)
			{
				int i = response.indexOf(":");
				if(i == -1)
				{
					return null;
				} 
				else
				{	
					return response;
				}
			}
			else
				return null;
		}*/
		// Added by Jeeva D for tranportal TCPIP Refund & Inquiry on 28/12/17 - Starts
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

	 public synchronized int performMerchAggrInitializationTCPIP(String key1)
		{
			String request="";
			StringBuffer requestbuffer;
			String id = this.getTranportalId();	
			String pwd = this.getTranportalPW();	
			String encrypted= "";
			String response="";
			String tranType="tran"; 
			try 
			{			
				
				requestbuffer = new StringBuffer();
				if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
					generateCheckSum();
				requestbuffer = buildMerchAggrXMLRequest();
				requestbuffer.append("<id>"+id+"</id>");
				requestbuffer.append("<password>"+pwd+"</password>");
				requestbuffer.append("<errorURL>"+errorURL+"</errorURL>");
				requestbuffer.append("<responseURL>"+responseURL+"</responseURL>");	
				requestbuffer.append("</request>");	
				//requestbuffer.append("password=" +password + "&");
				if(this.action.equalsIgnoreCase("1")||this.action.equalsIgnoreCase("4"))
					webAddress = webAddress+"/MerchaggrPayment.htm?param=paymentInit";
				else
					webAddress = webAddress+"/MerchaggrPayment.htm?param=supportInitTCPIP";
				System.out.println("Tran ID:"+id);
				System.out.println("Tran Request:"+requestbuffer.toString());
				if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
				{
				encrypted =encryptAESPKCS5(requestbuffer.toString(), key1);
				System.out.println("Encoded::"+encrypted);	
				request = "&trandata="+encrypted;
				System.out.println("Encrypted:"+encrypted);
				//request=requestbuffer.toString();
				request = request+"&errorURL="+errorURL+"&responseURL="+responseURL+"&tranportalId="+id;
				}
				else{
					request=requestbuffer.toString();
					request = request+"&errorURL="+errorURL+"&responseURL="+responseURL+"&tranportalId="+id;
				}
			
				
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
	 

	 public synchronized int performMerchAggrTranOtp(String key1){

			String request="";
			StringBuffer requestbuffer;
			String id = this.getTranportalId();	
			String pwd =this.getTranportalPW();	
			String encrypted= "";
			String response="";
			String tranType="tran";
			String tranId=this.getTransId();
			try 
			{			
				
				requestbuffer = new StringBuffer();
				if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
					generateCheckSum();
				requestbuffer = buildMerchAggrXMLRequest();
				requestbuffer.append("<id>"+id+"</id>");
				requestbuffer.append("<tranid>"+tranId+"</tranid>");
				requestbuffer.append("<password>"+pwd+"</password>");
				requestbuffer.append("<errorURL>"+errorURL+"</errorURL>");
				requestbuffer.append("<responseURL>"+responseURL+"</responseURL>");	
				requestbuffer.append("</request>");	
				//requestbuffer.append("password=" +password + "&");
				if(this.action.equalsIgnoreCase("1"))
				webAddress = webAddress+"/MerchaggrPayment.htm?param=paymentOTPInit";
				//webAddress = "http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=paymentInit";
				else if(this.action.equalsIgnoreCase("2")||this.action.equalsIgnoreCase("8"))
					webAddress = webAddress+"/MerchaggrPayment.htm?param=supportInitTCPIP";
			//	webAddress="http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=rvslInit";
				else if(this.action.equalsIgnoreCase("6"))
					webAddress = webAddress+"/MerchaggrPayment.htm?param=mrchResendOTPInit";
				System.out.println("Tran ID:"+id);
				System.out.println("Tran Request:"+requestbuffer.toString());
				encrypted =encryptAESPKCS5(requestbuffer.toString(),key1);
				System.out.println("Encoded::"+encrypted);	
				request = "&trandata="+encrypted;
				System.out.println("Encrypted:"+encrypted);
				request = request+"&errorURL="+errorURL+"&responseURL="+responseURL+"&tranportalId="+id;
				System.out.println("request"+request);
				webAddress = webAddress +request;	
				System.out.println("WEBADDR:"+webAddress);
				response = sendMessage(request, webAddress, tranType);			
				int parseresult = parseEncryptedOTPAggrResult(response,key1);
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
	 public synchronized int performMerchAggrTranUPIIntent(String key1){

			String request="";
			StringBuffer requestbuffer;
			String id = this.getTranportalId();	
			String pwd =this.getTranportalPW();	
			String encrypted= "";
			String response="";
			String tranType="tran";
			String tranId=this.getTransId();
			try 
			{			
				
				requestbuffer = new StringBuffer();
				if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
					generateCheckSum();
				requestbuffer = buildMerchAggrXMLRequest();
				requestbuffer.append("<id>"+id+"</id>");
				requestbuffer.append("<tranid>"+tranId+"</tranid>");
				requestbuffer.append("<password>"+pwd+"</password>");
				requestbuffer.append("<errorURL>"+errorURL+"</errorURL>");
				requestbuffer.append("<responseURL>"+responseURL+"</responseURL>");	
				requestbuffer.append("</request>");	
				//requestbuffer.append("password=" +password + "&");
				if(this.action.equalsIgnoreCase("1"))
				webAddress = webAddress+"/MerchaggrPayment.htm?param=paymentInitTCPIP";
				//webAddress = "http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=paymentInit";
				else if(this.action.equalsIgnoreCase("2")||this.action.equalsIgnoreCase("8"))
					webAddress = webAddress+"/MerchaggrPayment.htm?param=supportInitTCPIP";
			//	webAddress="http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=rvslInit";
				else if(this.action.equalsIgnoreCase("6"))
					webAddress = webAddress+"/MerchaggrPayment.htm?param=mrchResendOTPInit";
				System.out.println("Tran ID:"+id);
				System.out.println("Tran Request:"+requestbuffer.toString());
				encrypted =encryptAESPKCS5(requestbuffer.toString(),key1);
				System.out.println("Encoded::"+encrypted);	
				request = "&trandata="+encrypted;
				System.out.println("Encrypted:"+encrypted);
				request = request+"&errorURL="+errorURL+"&responseURL="+responseURL+"&tranportalId="+id;
				System.out.println("request"+request);
				webAddress = webAddress +request;	
				System.out.println("WEBADDR:"+webAddress);
				response = sendMessage(request, webAddress, tranType);			
				int parseresult = parseEncryptedVPAURLAggrResult(response,key1);
				
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
	 public synchronized int performMerchAggrTranCollectMoney(String key1){

			String request="";
			StringBuffer requestbuffer;
			String id = this.getTranportalId();	
			String pwd =this.getTranportalPW();	
			String encrypted= "";
			String response="";
			String tranType="tran";
			String tranId=this.getTransId();
			try 
			{			
				System.out.println("Collect Money Request====================================================================>");
				requestbuffer = new StringBuffer();
				if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
					generateCheckSum();
				requestbuffer = buildMerchAggrXMLRequest();
				requestbuffer.append("<id>"+id+"</id>");
				requestbuffer.append("<tranid>"+tranId+"</tranid>");
				requestbuffer.append("<password>"+pwd+"</password>");
				requestbuffer.append("<errorURL>"+errorURL+"</errorURL>");
				requestbuffer.append("<responseURL>"+responseURL+"</responseURL>");	
				requestbuffer.append("</request>");	
				//requestbuffer.append("password=" +password + "&");
				if(this.action.equalsIgnoreCase("1"))
				webAddress = webAddress+"/MerchaggrPayment.htm?param=paymentCollectMnyTCPIP";
				//webAddress = "http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=paymentInit";
				else if(this.action.equalsIgnoreCase("2")||this.action.equalsIgnoreCase("8"))
					webAddress = webAddress+"/MerchaggrPayment.htm?param=supportInitTCPIP";
			//	webAddress="http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=rvslInit";
				else if(this.action.equalsIgnoreCase("6"))
					webAddress = webAddress+"/MerchaggrPayment.htm?param=mrchResendOTPInit";
				System.out.println("Tran ID:"+id);
				System.out.println("Tran Request:"+requestbuffer.toString());
				encrypted =encryptAESPKCS5(requestbuffer.toString(),key1);
				System.out.println("Encoded::"+encrypted);	
				request = "&trandata="+encrypted;
				System.out.println("Encrypted:"+encrypted);
				request = request+"&errorURL="+errorURL+"&responseURL="+responseURL+"&tranportalId="+id;
				System.out.println("request"+request);
				webAddress = webAddress +request;	
				System.out.println("WEBADDR:"+webAddress);
				response = sendMessage(request, webAddress, tranType);			
				int parseresult = parseEncryptedVPAURLAggrResult(response,key1);
				
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
	 
	// Added by Jeeva D for tranportal TCPIP Refund & Inquiry on 28/12/17 - Ends
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
				responseTemp = (String)resultMap.get("url");
	            if(responseTemp != null)
	                this.acsurl = responseTemp.trim();
	            responseTemp = (String)resultMap.get("PAReq");
	            if(responseTemp != null)
	                this.pareq = responseTemp.trim();
	            responseTemp = (String)resultMap.get("payid");//Modified by Punitha A
	            if(responseTemp != null)
	                this.paymentId = responseTemp.trim();
	            System.out.println("paymentID : " + this.paymentId);
				responseTemp = (String)resultMap.get("eci");
	            if(responseTemp != null)
	                this.eci = responseTemp.trim();
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
	                trackId = responseTemp.trim();
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
	            responseTemp = (String)resultMap.get("error_service_tag");
	            if(responseTemp != null)
	            	error_service_tag = responseTemp.trim();
	            responseTemp = (String)resultMap.get("error_text");
	            if(responseTemp != null)
	                error_text = responseTemp.trim();
	            responseTemp = (String)resultMap.get("responsecode");
	            if(responseTemp != null)
	                responseCode = responseTemp.trim();
	            responseTemp = (String)resultMap.get("cvv2response");
	            if(responseTemp != null)
	                cvv2Verification = responseTemp.trim();
	            responseTemp = (String)resultMap.get("error");
	            if(responseTemp != null)
	                errorcode = responseTemp.trim();
	            responseTemp = (String)resultMap.get("pgtranid");
	            if(responseTemp != null)
	            	pgtranid = responseTemp.trim();
	                
	                
	                
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
		resphash.append(trackId!= null? trackId:"");
		System.out.println("resp hash string received ::" +resphash.toString());
		if(udf10.equals(getSha256(resphash.toString())))
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



	public synchronized int performMerchAggrTranOtpSend(String key1){

			String request="";
			StringBuffer requestbuffer;
			String id = this.getTranportalId();	
			String pwd =this.getTranportalPW();	
			String otp=this.getOtp();
			String tranId=this.getTransId();
			String trackId=this.getTrackId();
			webAddress=this.getWebAddress();
			String errorURL=this.getErrorURL();
			String responseURL=this.getResponseURL();
			String amt=this.getAmt();
			String encrypted= "";
			String response="";
			String tranType="tran";
			try 
			{			
				
				requestbuffer = new StringBuffer();
				requestbuffer = buildMerchAggrXMLRequest();
				requestbuffer.append("<id>"+id+"</id>");
				requestbuffer.append("<password>"+pwd+"</password>");
				requestbuffer.append("<tranid>"+tranId+"</tranid>");
				requestbuffer.append("<trackid>"+trackId+"</trackid>");
				requestbuffer.append("<otp>"+otp+"</otp>");
				requestbuffer.append("<amt>"+amt+"</amt>");
				requestbuffer.append("<responseURL>"+responseURL+"</responseURL>");
				requestbuffer.append("<errorURL>"+errorURL+"</errorURL>");
				requestbuffer.append("<udf1>"+udf1+"</udf1>");
				requestbuffer.append("<udf2>"+udf2+"</udf2>");
				requestbuffer.append("<udf3>"+udf3+"</udf3>");
				requestbuffer.append("<udf4>"+udf4+"</udf4>");
				requestbuffer.append("<udf5>"+udf5+"</udf5>");
				requestbuffer.append("<udf6>"+udf6+"</udf6>");
				requestbuffer.append("<udf7>"+udf7+"</udf7>");
				requestbuffer.append("<udf8>"+udf8+"</udf8>");
				requestbuffer.append("<udf9>"+udf9+"</udf9>");
				requestbuffer.append("<udf10>"+udf10+"</udf10>");
				requestbuffer.append("</request>");	
				//requestbuffer.append("password=" +password + "&");
				webAddress = webAddress+"/MerchaggrPayment.htm?param=paymentAuthInit";
				//webAddress = "http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=paymentInit";
			//	webAddress="http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=rvslInit";
				
				System.out.println("Tran ID:"+id);
				System.out.println("Tran Request:"+requestbuffer.toString());
				encrypted =encryptAESPKCS5(requestbuffer.toString(),key1);
				System.out.println("Encoded::"+encrypted);	
				request = "&trandata="+encrypted;
				System.out.println("Encrypted:"+encrypted);
				request = request+"&errorURL="+errorURL+"&responseURL="+responseURL+"&tranportalId="+id;
				System.out.println("request"+request);
				webAddress = webAddress +request;	
				System.out.println("WEBADDR:"+webAddress);
				response = sendMessage(request, webAddress, tranType);			
				int parseresult = parseOTPMerchAggrResult(response,key1);
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
	 
	 
	 
	@SuppressWarnings("rawtypes")
	private int parseOTPMerchAggrResult(String response, String key1) {
		// TODO Auto-generated method stub
		{
			HashMap resultMap;
			String responseTemp="";
			try
	        {					

				response =decryptAESPKCS5(response, key1);	
				System.out.println("resultMap : " + response);
				resultMap = new HashMap();
				resultMap = parseResponse(response);	
				System.out.println("resultMap : " + resultMap);
				resultMap = parseResponse(response);	
				System.out.println("resultMap : " + resultMap);
				responseTemp = (String)resultMap.get("url");
	            if(responseTemp != null)
	                this.acsurl = responseTemp.trim();
	            responseTemp = (String)resultMap.get("PAReq");
	            if(responseTemp != null)
	                this.pareq = responseTemp.trim();
	            responseTemp = (String)resultMap.get("payid");//Modified by Punitha A
	            if(responseTemp != null)
	                this.paymentId = responseTemp.trim();
	            System.out.println("paymentID : " + this.paymentId);
				responseTemp = (String)resultMap.get("eci");
	            if(responseTemp != null)
	                this.eci = responseTemp.trim();
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
	                trackId = responseTemp.trim();
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
	            responseTemp = (String)resultMap.get("error_code_tag");
	            if(responseTemp != null)
	                error = responseTemp.trim();
	            responseTemp = (String)resultMap.get("error_service_tag");
	            if(responseTemp != null)
	            	error_service_tag = responseTemp.trim();
	            responseTemp = (String)resultMap.get("error_text");
	            if(responseTemp != null)
	                error_text = responseTemp.trim();
	            responseTemp = (String)resultMap.get("responsecode");
	            if(responseTemp != null)
	                responseCode = responseTemp.trim();
	            responseTemp = (String)resultMap.get("cvv2response");
	            if(responseTemp != null)
	                cvv2Verification = responseTemp.trim();
	            responseTemp = (String)resultMap.get("error");
	            if(responseTemp != null)
	                errorcode = responseTemp.trim();
	                
	        	if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
	    			return validateRespCheckSum();
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
	}
	public synchronized int performMerchAggrTranOtpResend(String key1){

		String request="";
		StringBuffer requestbuffer;
		String id = this.getTranportalId();	
		String pwd =this.getTranportalPW();	
		String encrypted= "";
		String response="";
		String tranType="tran";
		try 
		{			
			
			requestbuffer = new StringBuffer();
			if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
				generateCheckSum();
			requestbuffer = buildMerchAggrXMLRequest();
			requestbuffer.append("<id>"+id+"</id>");
			requestbuffer.append("<password>"+pwd+"</password>");
			requestbuffer.append("<errorURL>"+errorURL+"</errorURL>");
			requestbuffer.append("<responseURL>"+responseURL+"</responseURL>");	
			requestbuffer.append("</request>");	
			//requestbuffer.append("password=" +password + "&");
			if(this.action.equalsIgnoreCase("1")||this.action.equalsIgnoreCase("4"))
			webAddress = webAddress+"/MerchaggrPayment.htm?param=paymentOTPInit";
			//webAddress = "http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=paymentInit";
			else
				webAddress = webAddress+"/MerchaggrPayment.htm?param=supportInitTCPIP";
		//	webAddress="http://10.44.112.211:7090/fssaggregator/MerchaggrPayment.htm?param=rvslInit";
			
			System.out.println("Tran ID:"+id);
			System.out.println("Tran Request:"+requestbuffer.toString());
			encrypted =encryptAESPKCS5(requestbuffer.toString(),key1);
			System.out.println("Encoded::"+encrypted);	
			request = "&trandata="+encrypted;
			System.out.println("Encrypted:"+encrypted);
			request = request+"&errorURL="+errorURL+"&responseURL="+responseURL+"&tranportalId="+id;
			System.out.println("request"+request);
			webAddress = webAddress +request;	
			System.out.println("WEBADDR:"+webAddress);
			response = sendMessage(request, webAddress, tranType);			
			int parseresult = parseEncryptedOTPAggrResult(response,key1);
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


	public synchronized String getAction() {
		return action;
	}

	public synchronized void setAction(String action) {
		this.action = action;
	}

	public synchronized String getAmt() {
		return amt;
	}

	public synchronized void setAmt(String amt) {
		this.amt = amt;
	}

	public synchronized String getAuth() {
		return auth;
	}

	public synchronized void setAuth(String auth) {
		this.auth = auth;
	}

	public synchronized String getAvr() {
		return avr;
	}

	public synchronized void setAvr(String avr) {
		this.avr = avr;
	}


	public synchronized String getCurrency() {
		return currency;
	}

	public synchronized void setCurrency(String currency) {
		this.currency = currency;
	}

	public synchronized String getDate() {
		return date;
	}

	public synchronized void setDate(String date) {
		this.date = date;
	}

	public synchronized StringBuffer getDebugMsg() {
		return debugMsg;
	}

	public synchronized void setDebugMsg(StringBuffer debugMsg) {
		this.debugMsg = debugMsg;
	}

	public synchronized String getError() {
		return error;
	}

	public synchronized void setError(String error) {
		this.error = error;
	}

	public synchronized String getErrorURL() {
		return errorURL;
	}

	public synchronized void setErrorURL(String errorURL) {
		this.errorURL = errorURL;
	}


	public synchronized String getLanguage() {
		return language;
	}

	public synchronized void setLanguage(String language) {
		this.language = language;
	}


	public synchronized String getPaymentId() {
		return paymentId;
	}

	public synchronized void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public synchronized String getPaymentPage() {
		return paymentPage;
	}

	public synchronized void setPaymentPage(String paymentPage) {
		this.paymentPage = paymentPage;
	}

	public synchronized String getRawResponse() {
		return rawResponse;
	}

	public synchronized void setRawResponse(String rawResponse) {
		this.rawResponse = rawResponse;
	}

	public synchronized String getRef() {
		return ref;
	}

	public synchronized void setRef(String ref) {
		this.ref = ref;
	}

	public synchronized String getResponseURL() {
		return responseURL;
	}

	public synchronized void setResponseURL(String responseURL) {
		this.responseURL = responseURL;
	}

	public synchronized String getResult() {
		return result;
	}

	public synchronized void setResult(String result) {
		this.result = result;
	}

	public synchronized String getTrackId() {
		return trackId;
	}

	public synchronized void setTrackId(String trackId) {
		this.trackId = trackId;
	}

	public synchronized String getTransId() {
		return transId;
	}

	public synchronized void setTransId(String transId) {
		this.transId = transId;
	}

	public synchronized String getUdf1() {
		return udf1;
	}

	public synchronized void setUdf1(String udf1) {
		this.udf1 = udf1;
	}

	public synchronized String getUdf2() {
		return udf2;
	}

	public synchronized void setUdf2(String udf2) {
		this.udf2 = udf2;
	}

	public synchronized String getUdf3() {
		return udf3;
	}

	public synchronized void setUdf3(String udf3) {
		this.udf3 = udf3;
	}

	public synchronized String getUdf4() {
		return udf4;
	}

	public synchronized void setUdf4(String udf4) {
		this.udf4 = udf4;
	}

	public synchronized String getUdf5() {
		return udf5;
	}

	public synchronized void setUdf5(String udf5) {
		this.udf5 = udf5;
	}

	public synchronized void setAlias(String alias) {
		this.alias = alias;
	}


	public synchronized String getAddr() {
		return addr;
	}


	public synchronized void setAddr(String addr) {
		this.addr = addr;
	}


	public synchronized String getCard() {
		return card;
	}


	public synchronized void setCard(String card) {
		this.card = card;
	}


	public synchronized String getCavv() {
		return cavv;
	}


	public synchronized void setCavv(String cavv) {
		this.cavv = cavv;
	}


	public synchronized String getCvv2() {
		return cvv2;
	}


	public synchronized void setCvv2(String cvv2) {
		this.cvv2 = cvv2;
	}


	public synchronized String getCvv2Verification() {
		return cvv2Verification;
	}


	public synchronized void setCvv2Verification(String cvv2Verification) {
		this.cvv2Verification = cvv2Verification;
	}


	public synchronized String getEci() {
		return eci;
	}


	public synchronized void setEci(String eci) {
		this.eci = eci;
	}


	public synchronized String getExpDay() {
		return expDay;
	}


	public synchronized void setExpDay(String expDay) {
		this.expDay = expDay;
	}


	public synchronized String getExpMonth() {
		return expMonth;
	}


	public synchronized void setExpMonth(String expMonth) {
		this.expMonth = expMonth;
	}


	public synchronized String getExpYear() {
		return expYear;
	}


	public synchronized void setExpYear(String expYear) {
		this.expYear = expYear;
	}


	public synchronized String getMember() {
		return member;
	}


	public synchronized void setMember(String member) {
		this.member = member;
	}


	public synchronized String getResponseCode() {
		return responseCode;
	}


	public synchronized void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}


	public synchronized String getType() {
		return type;
	}


	public synchronized void setType(String type) {
		this.type = type;
	}


	public synchronized String getZip() {
		return zip;
	}


	public synchronized void setZip(String zip) {
		this.zip = zip;
	}


	public synchronized String getAlias() {
		return alias;
	}


	public synchronized String getError_text() {
		return error_text;
	}


	public synchronized void setError_text(String error_text) {
		this.error_text = error_text;
	}


	public synchronized String getResourcePath() {
		return resourcePath;
	}


	public synchronized void setResourcePath(String resourcePath) {
		this.resourcePath = resourcePath;
	}


	public synchronized String getKeystorePath() {
		return keystorePath;
	}


	public synchronized void setKeystorePath(String keystorePath) {
		this.keystorePath = keystorePath;
	}


	public synchronized String getAcsurl() {
		return acsurl;
	}


	public synchronized void setAcsurl(String acsurl) {
		this.acsurl = acsurl;
	}


	public synchronized String getPareq() {
		return pareq;
	}


	public synchronized void setPareq(String pareq) {
		this.pareq = pareq;
	}


	public synchronized String getPares() {
		return pares;
	}


	public synchronized void setPares(String pares) {
		this.pares = pares;
	}


	public synchronized String getError_service_tag() {
		return error_service_tag;
	}


	public synchronized void setError_service_tag(String error_service_tag) {
		this.error_service_tag = error_service_tag;
	}
	
	public synchronized String getWebAddress() {
		return webAddress;
	}

	public synchronized void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}


	public String getXid() {
		return xid;
	}


	public void setXid(String xid) {
		this.xid = xid;
	}


	

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getSiflag() {
		return siflag;
	}

	public void setSiflag(String siflag) {
		this.siflag = siflag;
	}

	public String getMobilenum() {
		return mobilenum;
	}

	public void setMobilenum(String mobilenum) {
		this.mobilenum = mobilenum;
	}

	public String getMmid() {
		return mmid;
	}

	public void setMmid(String mmid) {
		this.mmid = mmid;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}
	
	public String getSavedCard() {
		return savedCard;
	}

	public void setSavedCard(String savedCard) {
		this.savedCard = savedCard;
	}

	public Long getTermkey() {
		return termkey;
	}

	public void setTermkey(Long termkey) {
		this.termkey = termkey;
	}

	public String getTranportalId() {
		return tranportalId;
	}

	public void setTranportalId(String tranportalId) {
		this.tranportalId = tranportalId;
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



	public String getBankCode() {
		return bankCode;
	}



	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}


// Added by Jeeva D on 28/12/17 - Starts
	public String getErrorcode() {
		return errorcode;
	}



	public void setErrorcode(String errorcode) {
		this.errorcode = errorcode;
	}



	public String getTranportalPW() {
		return tranportalPW;
	}



	public void setTranportalPW(String tranportalPW) {
		this.tranportalPW = tranportalPW;
	}
	
	// Added by Jeeva D on 28/12/17 - Ends
	

	//
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}



	public String getHashFlg() {
		return hashFlg;
	}



	public void setHashFlg(String hashFlg) {
		this.hashFlg = hashFlg;
	}



	public String getPgtranid() {
		return pgtranid;
	}



	public void setPgtranid(String pgtranid) {
		this.pgtranid = pgtranid;
	}

	public synchronized String getCustvpa() {
		return custvpa;
	}
	public synchronized void setCustvpa(String custvpa) {
		this.custvpa = custvpa;
	}	

	public String getCustAcctNo() {
		return custAcctNo;
	}
	public void setCustAcctNo(String custAcctNo) {
		this.custAcctNo = custAcctNo;
	}	
	
	
	
	
public String getVpaurl() {
		return vpaurl;
	}



	public void setVpaurl(String vpaurl) {
		this.vpaurl = vpaurl;
	}



public static void main(String[] args) throws Exception {
	
String key ="0202795946850202";
String requ ="7X0bduCxuUSthKsKM/Byik3ooWXt5051vdzc6nI0rXGTTlapB4iaCDyk8iiMMNShwi2jIR1yunKnWgxPOZ1wJi2hvPedIvheSf+Mrv1n2i6ExvtuIQoiozZJ5Py+EURcOb53tPAUWG4CiMhaKoZHtJ4oXQrD9idYrABqC1EN4KuCe23d4wQoSrc3TWIRkQUq18BEBdwjtncV5QoC5I+NNNGI4dJEPlWzOvuJhsBdWRsjS7uH/E31TQkpx0l6qMdwTfHiIAtieipgKF7SJVxCSC4IARLaj3sGJawAwBL/zuzflXHcJnpinrGP4e6TgkjbDAOAem/WedQVwc7I5hEv8TO922gbrWb5lZcQ0xz6Wyz8uQEEH7ivvjLxoEnBmV2qeCTYFAzrKaiy4nDy+Zwg8/gm1Km2NDB7mkFmRE/8MT6mOikip9OSnYNHqnUZEqttVm0cFpm3bJ8LVCnmo2pHZ3Dtlj1OGUQS6PMJMCSpzWBbBGsZRIGDuoFopccIiq/wpFhl1vWeZ0AdddoiY5nwvMWSeIdDrN9BOLKL0/PbMRvuuXb2puO85ZJd7joQ9WOQnaGMt6QSynUF41bZYVVace9nke1oPzunZDHehqkZ1LN5AIigfpufgUNVvnnIKMSWev48sWH0/25N4/PEDTf2btwCZBhbSosWVL3IjA8ctp0S41LfMqHBlNGN1DAeKmtO";
			

//7X0bduCxuUSthKsKM/Byik3ooWXt5051vdzc6nI0rXGTTlapB4iaCDyk8iiMMNShwi2jIR1yunKnWgxPOZ1wJi2hvPedIvheSf+Mrv1n2i6ExvtuIQoiozZJ5Py+EURcOb53tPAUWG4CiMhaKoZHtJ4oXQrD9idYrABqC1EN4KuCe23d4wQoSrc3TWIRkQUq18BEBdwjtncV5QoC5I+NNNGI4dJEPlWzOvuJhsBdWRsjS7uH/E31TQkpx0l6qMdwTfHiIAtieipgKF7SJVxCSC4IARLaj3sGJawAwBL/zuzflXHcJnpinrGP4e6TgkjbDAOAem/WedQVwc7I5hEv8TO922gbrWb5lZcQ0xz6Wyz8uQEEH7ivvjLxoEnBmV2qeCTYFAzrKaiy4nDy+Zwg8/gm1Km2NDB7mkFmRE/8MT6mOikip9OSnYNHqnUZEqttVm0cFpm3bJ8LVCnmo2pHZ3Dtlj1OGUQS6PMJMCSpzWBbBGsZRIGDuoFopccIiq/wpFhl1vWeZ0AdddoiY5nwvMWSeIdDrN9BOLKL0/PbMRvuuXb2puO85ZJd7joQ9WOQnaGMt6QSynUF41bZYVVace9nke1oPzunZDHehqkZ1LN5AIigfpufgUNVvnnIKMSWev48sWH0/25N4/PEDTf2btwCZBhbSosWVL3IjA8ctp0S41LfMqHBlNGN1DAeKmtO
	iPayPipe pipe = new iPayPipe();
	String reqdec = null;
	reqdec= pipe.decryptAESPKCS5(requ, key);
	System.out.println("req"+ reqdec);
	/*try
	{
	String request = "<request><type>C</type><expyear>2017</expyear><expmonth>01</expmonth><member>Test</member><currency>1</currency><type>C</type><transid>602201911387706959</transid><langid>USA</langid><amt>1</amt><action>2</action><trackid>721692385</trackid><udf3>8681F6DEAB81434E2B8E695FC76E4DA8</udf3><udf4>FC</udf4><udf5>tranid</udf5><udf6>Test</udf6><udf7>Test</udf7><udf8>Test</udf8><udf9>Test</udf9><udf10>Test</udf10><currencycode>356</currencycode><custid>201502889575739</custid><id>FSS0000005</id><password></password><errorURL>https://merchanthubtest.fssnet.co.in/FSSAggr_MerchantDemo/jsp/fss/TranPipeResult.jsp</errorURL><responseURL>https://merchanthubtest.fssnet.co.in/FSSAggr_MerchantDemo/jsp/fss/TranPipeResult.jsp</responseURL></request>";
	String tranType ="tran"; 
	String response = null;
	response = sendMessage(request, "https://merchanthub.fsspay.com/PGAggregator/MerchaggrPayment.htm?param=supportInitTCPIP", tranType);
	System.out.println(response);
	}catch(Exception e)
	{
	e.printStackTrace();*/
	String key1 ="0202795946850202";
	String reqdecq ="<request><type>UPI</type><currency>356</currency><langid>IN</langid><amt>5.00</amt><action>1</action><trackId>1103101123162724</trackId><udf10>d0eea99a7dd0ca0fbdbf34dace158f01b9257c6e517ce4a966e46ba8b4fc4f14</udf10><currencycode>356</currencycode><customer_vpa>9810863933@upi</customer_vpa><id>TEST000087</id><password>password@123</password><errorURL>http://127.0.0.1:8080/pgui/jsp/fssPayResponse</errorURL><responseURL>http://127.0.0.1:8080/pgui/jsp/fssPayResponse</responseURL></request>";	
	iPayPipe pipes = new iPayPipe();
	String reqdecqq = null;
	reqdecqq= pipes.encryptAESPKCS5(reqdecq, key1);
	System.out.println("req==>"+ reqdecqq);
}	
	
}
	
	
	
	

