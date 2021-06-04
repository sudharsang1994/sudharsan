package com.fss.plugin;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class BrowsePlan {

	String transId ;
	String type;
	String rechargerNumber;
	String tranportalId;
	String tranportalPW;
	String errorURL;
	String responseURL;
	String trackId;
	String recharge;
	String rechargeOperator;
	String rechargeCircle;
	String rechargeType;
	String udf1;
	String udf2;
	String udf3;
	String udf4;
	String udf5;
	String udf6;
	String udf7;
	String udf8;
	String udf9;
	String udf10;
	String udf11;
	String udf12;
	String udf13;
	String webAddress;
	String  error;  
	String mode;
	String mobileNumber;
	String key;
	String bankCode;
	String amount;
	String rechargeRequestId;
	String result;

	  String billertranid;
	String planId;
	String rechargeAmt;
	String   rechargeVldty;
	String rechargeTlktime;
	String rechargeDesc;
    String encryptresponse ;
    String hashFlg =null; 

	public BrowsePlan()
	{  
		key="";
		transId="";
		type="";
		error="";
		rechargerNumber="";
		errorURL="";
		responseURL="";
		mobileNumber="";
		recharge="";
		rechargeOperator="";
		rechargeCircle="";
		rechargeType="";
		trackId="";
		webAddress="";
		udf1="";
		udf2="";
		udf3="";
		udf4="";
		udf5="";
		udf6="";
		udf7="";
		udf8="";
		udf9="";
		udf10="";
		udf11="";
		udf12="";
		udf13="";
		bankCode="";
		mode="";
		mobileNumber="";
		amount="";
		rechargeRequestId="";
		result="";

		  planId="";
		rechargeAmt="";
		rechargeVldty="";
		rechargeTlktime="";
		rechargeDesc="";
		encryptresponse="";
		hashFlg="";
		billertranid="";
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
		if(mode!=null)
			if(mode.length() > 0)
			{
				requestbuffer.append("<recharge>"+mode+"</recharge>");
			}

		if(mobileNumber!=null)
			if(mobileNumber.length() > 0)
			{
				requestbuffer.append("<rechargernumber>"+mobileNumber+"</rechargernumber>");
			}
		if(rechargeOperator!=null)
			if(rechargeOperator.length() > 0)
			{
				requestbuffer.append("<rechargeoperator>"+rechargeOperator+"</rechargeoperator>");
			}
		if(rechargeType!=null)
			if(rechargeType.length() > 0)
			{
				requestbuffer.append("<rechargeType>"+rechargeType+"</rechargeType>");
			}
		if(rechargeCircle!=null)
			if(rechargeCircle.length() > 0)
			{
				requestbuffer.append("<rechargecircle>"+rechargeCircle+"</rechargecircle>");
			}
		
		if(trackId!=null)
			if(trackId.length() > 0)
			{
				requestbuffer.append("<trackid>"+trackId+"</trackid>");
			}
		if(transId!=null)
			if(transId.length() > 0)
			{
				requestbuffer.append("<transid>"+transId+"</transid>");
			}
		
		
		
				requestbuffer.append("<udf1>"+udf1+"</udf1>");
		
				requestbuffer.append("<udf2>"+udf2+"</udf2>");
			
				requestbuffer.append("<udf3>"+udf3+"</udf3>");
		
				requestbuffer.append("<udf4>"+udf4+"</udf4>");
			
			    requestbuffer.append("<udf5>"+udf5+"</udf5>");
			    requestbuffer.append("<udf10>"+udf10+"</udf10>");
			
		if(bankCode!=null)
			if(bankCode.length() > 0)
			{
				requestbuffer.append("<bankcode>"+bankCode+"</bankcode>");
			}
		
		if(amount!=null)
			if(amount.length() > 0)
			{
				requestbuffer.append("<amt>"+amount+"</amt>");
			}
		// for not Recharge case
		if(transId!=null && !"R".equals(type)){
			if(transId.length() > 0)
			{
				requestbuffer.append("<transid>"+transId+"</transid>");
			}
		}
		// for Recharge case
		if(transId!=null && type.equals("R")){
			if(transId.length() > 0)
			{
				requestbuffer.append("<rechargepymntid>"+transId+"</rechargepymntid>");
			}
		}
		
		
		return requestbuffer;
		}catch (Exception e) {
				return null;
				
		}finally{
			requestbuffer = null;
		}
		
	}
	public synchronized int performMerchAggrInitializationRecharge()
	{

		String request="";
		StringBuffer requestbuffer;
		String id = this.getTranportalId();	
		String pwd = this.getTranportalPW();
		String key=this.getKey();
		String encrypted= "";
		String decryptResponse="";
		String tranType="tran"; 
		String errorURL=this.getErrorURL();
		String responseURL=this.getResponseURL();
		String webAddress=this.getWebAddress();
		String checkPlan="";
		String[] response1=null;
		String[] response2=null;
		String[] response3=null;
		
		try 
		{			

			requestbuffer = new StringBuffer();
			if(!type.equalsIgnoreCase("B"))
			{
			if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()))
				generateCheckSum();
			}
			requestbuffer = buildMerchAggrXMLRequest();
			System.out.println(requestbuffer);
			requestbuffer.append("<id>"+id+"</id>");
			requestbuffer.append("<password>"+pwd+"</password>");	
			requestbuffer.append("</request>");	
		     webAddress = webAddress+"/aggrRecharge.htm?param=rechargeInit";
			
			System.out.println("Request : "+requestbuffer.toString());
			request = requestbuffer.toString();
			System.out.println("request"+request);
			System.out.println("WEBADDR:"+webAddress);
			encrypted =encryptAESPKCS5(request,key);
			System.out.println("Encoded::"+encrypted);	
			request = "&trandata="+encrypted;
			System.out.println("Encrypted:"+encrypted);
			request = request+"&tranportalId="+id;
			System.out.println("request"+request);
			System.out.println("WEBADDR:"+webAddress);
			
			decryptResponse = sendMessage(request, webAddress, tranType);
			
			System.out.println("decryptResponse:"+decryptResponse);
			
			if(!decryptResponse.startsWith("<"))
			{
				
				
				if((decryptResponse.contains("&tranportalId="))&&(decryptResponse.contains("&trackID="))&&(decryptResponse.contains("&FSSTranID=")))
					
				{
					response1 = decryptResponse.split("&tranportalId=");
					
				if(response1[1].contains("&trackID="))
				response2 =response1[1].split("&trackID=");
		
				if(response1[1].contains("&FSSTranID="))
				 response3 =response1[1].split("&FSSTranID=");
				
				
				System.out.println("Trandata"+response1[0]);
				System.out.println("Tranportal ID"+response2[0]);
				System.out.println("trackID"+response2[1]);
				System.out.println("FSSTran ID"+response3[1]);
				decryptResponse=response1[0];
				}
				
				else if((decryptResponse.contains("&tranportalId="))&&(decryptResponse.contains("&trackID=")))
				{
					response1 = decryptResponse.split("&tranportalId=");
					
					if(response1[1].contains("&trackID="))
					response2 =response1[1].split("&trackID=");
					decryptResponse=response1[0];
				}
				
				else if((decryptResponse.contains("&tranportalId="))&&(decryptResponse.contains("&FSSTranID=")))
				{
					response1 = decryptResponse.split("&tranportalId=");
					
					if(response1[1].contains("&FSSTranID="))
					response2 =response1[1].split("&FSSTranID=");
					decryptResponse=response1[0];
				}
				
				
				else if((decryptResponse.contains("&trackID="))&&(decryptResponse.contains("&FSSTranID=")))
				{
					response1 = decryptResponse.split("&trackID=");
					
					if(response1[1].contains("&FSSTranID="))
					response2 =response1[1].split("&FSSTranID=");
					decryptResponse=response1[0];
				}
				
				else if(decryptResponse.contains("&tranportalId="))
						{
					response1 = decryptResponse.split("&tranportalId=");
					decryptResponse=response1[0];
						}
				
				else if(decryptResponse.contains("&trackID="))
				{
			response1 = decryptResponse.split("&trackID=");
			decryptResponse=response1[0];
				}
				else if(decryptResponse.contains("&FSSTranID="))
				{
			response1 = decryptResponse.split("&FSSTranID=");
			decryptResponse=response1[0];
				}
				
			String encryptResponse=decryptAESPKCS5(decryptResponse,key);
			System.out.println("encryptResponse:"+encryptResponse);
			
			int parseresult = parseMerchAggrResult(encryptResponse);
			this.encryptresponse=encryptResponse;
			System.out.println("parseresult"+parseresult);
			if(parseresult == 0)
				return 0;
			else
			{
				error = "Error while parsing ";
				return -1;
			}
			}
			else
			{
		
			int parseresult = parseMerchAggrResult(decryptResponse);
			System.out.println("parseresult"+parseresult);
			if(parseresult == 0)
				return 0;
			else
			{
				error = "Error while parsing ";
				return -1;
			}
			}
			
			
			} 
		catch (Exception e) 
		{
			e.printStackTrace();
			error = e.getMessage();
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
			hashReq.append(this.getAmount());
			hashReq.append(this.getMobileNumber());
			hashReq.append(this.getMode());
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


	private int validateRespCheckSum() {
		StringBuffer resphash = new StringBuffer();
		String hashedVal = null;
	try {
		resphash.append(result != null? result:"");
		resphash.append(transId!= null? transId:"");
		resphash.append(amount!= null? amount:"");
		resphash.append(trackId!= null? trackId:"");
		resphash.append(mobileNumber!= null? mobileNumber:"");
		resphash.append(billertranid!= null? billertranid:"");
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
	       // if(tranType.equals("host"))
	        	urlconnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	       /* if(tranType.equals("tran"))
	        	urlconnection.setRequestProperty("Content-Type", "application/xml");*/

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

	
	
	public synchronized ArrayList  parseBrowseResponse()
	{
		String response="",planid4="",beginplans="",endPlans="",plans="",plan="",
		planid="",planid2="",planid3="",planid5="";
	    int endplanslgnth, p1, p1end,p2,p1end2,p3,p1end3,p4,p1end4,p5,p1end5, planend,nwResponse;

		ArrayList<BrowsePlan> a=new ArrayList<BrowsePlan>();
		List<ArrayList> myList = new ArrayList<ArrayList>();
		
		System.out.println("parsebrowseplan() ----->"+response);	
		
		response=this.getEncryptresponse();
	
		
		if(response == null || response.length() < 0){
			
			System.out.println("return response ");	
			return a;
		}
		
		 beginplans=response.substring(0,10);
		 endplanslgnth=response.indexOf("</plans>");
		endPlans=response.substring(endplanslgnth,endplanslgnth+8);
		System.out.println(beginplans+"------"+endPlans);
		if(beginplans=="<plans>"&&endPlans=="</plans>"){
			
			System.out.println(beginplans+"------"+endPlans);
		}
		 plans=response.substring(13,endplanslgnth);
			System.out.println(plans);
		try {
			do{
				 plan=plans.trim();
				 
				 p1=plan.indexOf("<planId>");
			 p1end=plan.indexOf("</planId>");
				 planid=plan.substring(p1+8, p1end);
				 
				 p2=plan.indexOf("<rechrgAmt>");
				 p1end2=plan.indexOf("</rechrgAmt>");
				 planid2=plan.substring(p2+11, p1end2);

				 p3=plan.indexOf("<rechrgVldty>");
				 p1end3=plan.indexOf("</rechrgVldty>");
				 planid3=plan.substring(p3+13, p1end3);
				
				
				 p4=plan.indexOf("<rechrgTlktme>");
			 p1end4=plan.indexOf("</rechrgTlktme>");
			 if(plan.indexOf("</rechrgTlktme>")!=-1)
			 {
				 planid4=plan.substring(p4+14, p1end4);
				
				
				 
				 p5=plan.indexOf("<rechrgDesc>");
				 p1end5=plan.indexOf("</rechrgDesc>");
				 planid5=plan.substring(p5+12, p1end5);
				
				 }
				 else
				 {
					 p4=plan.indexOf("<rechrgDesc>");
					 p1end4=plan.indexOf("</rechrgDesc>");
					 planid4=plan.substring(p4+12, p1end4);
				 }
		
				BrowsePlan browsePlan=new BrowsePlan();
				if(planid!=null){

				browsePlan.setPlanId(planid);		
				browsePlan.setRechargeAmt(planid2);	
				browsePlan.setRechargeVldty(planid3);	
				 if(plan.indexOf("</rechrgTlktme>")!=-1)
				 {
				browsePlan.setRechargeTlktime(planid4);
				browsePlan.setRechargeDesc(planid5);
				 }
				 else
					 browsePlan.setRechargeDesc(planid4);
					
}
				 
   a.add(browsePlan);
			 nwResponse=plans.indexOf("</plan>", 1);
 plans=plan.substring(nwResponse+7);


}while(plan.length()>0);
			
		 
} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println(e+" exception occured at parsebrowseResponse");
			error=e.getMessage();
			
		}
		

   return a;
	
	}
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
	public synchronized  int parseMerchAggrResult(String response)
	{
		HashMap resultMap;
		String responseTemp="";
		try
	    {		
			resultMap = new HashMap();
			resultMap = parseResponse(response);	
			System.out.println("resultMap : " + resultMap);
			
			responseTemp = (String)resultMap.get("result");
	        if(responseTemp != null)
	            this.result = responseTemp.trim();
	        
	        responseTemp = (String)resultMap.get("rechargeType");
	        if(responseTemp != null)
	            this.rechargeType = responseTemp.trim();
	        
	        
	        responseTemp = (String)resultMap.get("rechargeCircle");
	        if(responseTemp != null)
	            this.rechargeCircle = responseTemp.trim();
	        
	        

	        responseTemp = (String)resultMap.get("rechargerNumber");
	        if(responseTemp != null)
	        	  this.mobileNumber = responseTemp.trim();
	        
	        responseTemp = (String)resultMap.get("amt");
	        if(responseTemp != null)
	        this.amount = responseTemp.trim();
	        
	        
	        responseTemp = (String)resultMap.get("rechargeOperator");
	        if(responseTemp != null)
	            this.rechargeOperator = responseTemp.trim();
	        
	        
	        responseTemp = (String)resultMap.get("amt");
	        if(responseTemp != null)
	           this.amount = responseTemp.trim();
	        
	        responseTemp = (String)resultMap.get("trackid");
	        if(responseTemp != null)
	            trackId = responseTemp.trim();
	        
	        responseTemp = (String)resultMap.get("billertranid");
	        if(responseTemp != null)
	        	billertranid = responseTemp.trim();
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
	        responseTemp = (String)resultMap.get("udf10");
	        if(responseTemp != null)
	            udf10 = responseTemp.trim();
	        responseTemp = (String)resultMap.get("error");
	        if(responseTemp != null)
	        	error = responseTemp.trim();
	        responseTemp = (String)resultMap.get("tranid");
	        if(responseTemp != null)
	        	transId = responseTemp.trim();
	        if(!type.equalsIgnoreCase("B"))
	        {
	        if(this.getHashFlg()!= null && "Y".equalsIgnoreCase(this.getHashFlg()) && this.getUdf10() != null)
				return validateRespCheckSum();
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



	public String getTransId() {
		return transId;
	}



	public void setTransId(String transId) {
		this.transId = transId;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getRechargerNumber() {
		return rechargerNumber;
	}



	public void setRechargerNumber(String rechargerNumber) {
		this.rechargerNumber = rechargerNumber;
	}



	public String getTranportalId() {
		return tranportalId;
	}



	public void setTranportalId(String tranportalId) {
		this.tranportalId = tranportalId;
	}



	public String getTranportalPW() {
		return tranportalPW;
	}



	public void setTranportalPW(String tranportalPW) {
		this.tranportalPW = tranportalPW;
	}



	public String getErrorURL() {
		return errorURL;
	}



	public void setErrorURL(String errorURL) {
		this.errorURL = errorURL;
	}



	public String getResponseURL() {
		return responseURL;
	}



	public void setResponseURL(String responseURL) {
		this.responseURL = responseURL;
	}



	public String getHashFlg() {
		return hashFlg;
	}

	public void setHashFlg(String hashFlg) {
		this.hashFlg = hashFlg;
	}

	public String getTrackId() {
		return trackId;
	}



	public void setTrackId(String trackId) {
		this.trackId = trackId;
	}



	public String getRecharge() {
		return recharge;
	}



	public void setRecharge(String recharge) {
		this.recharge = recharge;
	}



	public String getRechargeOperator() {
		return rechargeOperator;
	}



	public void setRechargeOperator(String rechargeOperator) {
		this.rechargeOperator = rechargeOperator;
	}



	public String getRechargeCircle() {
		return rechargeCircle;
	}



	public void setRechargeCircle(String rechargeCircle) {
		this.rechargeCircle = rechargeCircle;
	}



	public String getRechargeType() {
		return rechargeType;
	}



	public void setRechargeType(String rechargeType) {
		this.rechargeType = rechargeType;
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



	public String getWebAddress() {
		return webAddress;
	}



	public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}



	public String getError() {
		return error;
	}



	public void setError(String error) {
		this.error = error;
	}






	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}



	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}



	public String getKey() {
		return key;
	}



	public void setKey(String key) {
		this.key = key;
	}



	public String getBankCode() {
		return bankCode;
	}



	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}



	public String getAmount() {
		return amount;
	}



	public void setAmount(String amount) {
		this.amount = amount;
	}



	public String getRechargeRequestId() {
		return rechargeRequestId;
	}



	public void setRechargeRequestId(String rechargeRequestId) {
		this.rechargeRequestId = rechargeRequestId;
	}



	public String getResult() {
		return result;
	}



	public void setResult(String result) {
		this.result = result;
	}



	public String getPlanId() {
		return planId;
	}



	public void setPlanId(String planId) {
		this.planId = planId;
	}



	public String getRechargeAmt() {
		return rechargeAmt;
	}



	public void setRechargeAmt(String rechargeAmt) {
		this.rechargeAmt = rechargeAmt;
	}



	public String getRechargeVldty() {
		return rechargeVldty;
	}



	public void setRechargeVldty(String rechargeVldty) {
		this.rechargeVldty = rechargeVldty;
	}



	public String getRechargeTlktime() {
		return rechargeTlktime;
	}



	public void setRechargeTlktime(String rechargeTlktime) {
		this.rechargeTlktime = rechargeTlktime;
	}



	public String getRechargeDesc() {
		return rechargeDesc;
	}



	public void setRechargeDesc(String rechargeDesc) {
		this.rechargeDesc = rechargeDesc;
	}

	public String getEncryptresponse() {
		return encryptresponse;
	}

	public void setEncryptresponse(String encryptresponse) {
		this.encryptresponse = encryptresponse;
	}

	@Override
	public String toString() {
		return "BrowsePlan [transId=" + transId + ", type=" + type
				+ ", rechargerNumber=" + rechargerNumber + ", tranportalId="
				+ tranportalId + ", tranportalPW=" + tranportalPW
				+ ", errorURL=" + errorURL + ", responseURL=" + responseURL
				+ ", trackId=" + trackId + ", recharge=" + recharge
				+ ", rechargeOperator=" + rechargeOperator
				+ ", rechargeCircle=" + rechargeCircle + ", rechargeType="
				+ rechargeType + ", udf1=" + udf1 + ", udf2=" + udf2
				+ ", udf3=" + udf3 + ", udf4=" + udf4 + ", udf5=" + udf5
				+ ", udf6=" + udf6 + ", udf7=" + udf7 + ", udf8=" + udf8
				+ ", udf9=" + udf9 + ", udf10=" + udf10 + ", udf11=" + udf11
				+ ", udf12=" + udf12 + ", udf13=" + udf13 + ", webAddress="
				+ webAddress + ", error=" + error + ", mobile=" + mode
				+ ", mobileNumber=" + mobileNumber + ", key=" + key
				+ ", bankCode=" + bankCode + ", amount=" + amount
				+ ", rechargeRequestId=" + rechargeRequestId + ", result="
				+ result + ", planId=" + planId + ", rechargeAmt="
				+ rechargeAmt + ", rechargeVldty=" + rechargeVldty
				+ ", rechargeTlktime=" + rechargeTlktime + ", rechargeDesc="
				+ rechargeDesc + ", encryptresponse=" + encryptresponse + ",billertranid="+billertranid+"]";
	}

	



}
