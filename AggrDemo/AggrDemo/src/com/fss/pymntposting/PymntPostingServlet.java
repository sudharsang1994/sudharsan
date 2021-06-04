package com.fss.pymntposting;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fss.plugin.iPayPipe;

public class PymntPostingServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PymntPostingServlet() {
        super();
    }
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		byte[] b = null;
		String url=null;
		String param=null;
		ServletOutputStream out=response.getOutputStream();
		byte[] resByte=null;
		String req=null;
		String res=null;
		String resp[]=null;
		iPayPipe pipe = new iPayPipe();
		String key = "";
		
		try {
			System.out.println("Payment Posting Messge Receiced");
			//key ="7129842055647129";
			
			key ="7129842055647129"; //SIT terminal key
			b  = getMessageBytes(request);
			
			//req = request.getParameter("trandata");
			req = new String(b);

			req = req.replace("trandata=", "");
			req = URLDecoder.decode(req,"UTF-8");
			System.out.println("Response from FSSPay::"+req);
			pipe.parseEncryptedMerchAggrResult(req, key);
			System.out.println("Response from FSSPay::"+req);
			out.print("success");
			out.flush();
			out.close();
			return;


		} catch (Exception e) {
			e.fillInStackTrace();
		}
		finally
		{
			 b = null;
			 url=null;
			 param=null;
			 res=null;
			 resp=null;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public byte[] getMessageBytes(HttpServletRequest httpservletrequest) throws IOException
	{
		BufferedInputStream bufferedinputstream = null;
		ByteArrayOutputStream bytearrayoutputstream = null;
		byte[] byteStream = null;
		try
		{
			bufferedinputstream = new BufferedInputStream(httpservletrequest.getInputStream());
			bytearrayoutputstream = new ByteArrayOutputStream(4096);
			do
			{
				byte[] abyte0 = new byte[2048];
				int i = bufferedinputstream.read(abyte0);
				if(i == -1)
					break;
				bytearrayoutputstream.write(abyte0, 0, i);
			} while(true);
			
			byteStream = bytearrayoutputstream.toByteArray();
		}
		finally
		{
			if (bufferedinputstream != null)
				bufferedinputstream.close();
			if (bytearrayoutputstream != null)
				bytearrayoutputstream = null;
			
			bufferedinputstream = null;
			bytearrayoutputstream = null;
		}
		return byteStream;
	}
/*	public static void main(String[] args) {
		String msg = "";
		String key = "";
		iPayPipe pipe = new iPayPipe();
		try {
		
		msg = "Cp1jHOsCNgrW0AmpupA3WUKEf6azMbEqYYOUJ8v/e3ZVgqEOgF1TvyKbG5NMBiFm1dLzVIarRTIvxJZIfOU+Cfqj4ign856xs3voE/ax7VQym/RfvCxp2i0VPXJMD/vQbziUt+MoAXC9QcJDQS/Fm8F4tty4+wqBt8yeZJVVbx+Mx2Pr2LU06CljfhCDD1xPEkYJav6udLr7Bla7+fjQwARF9JuVe/SJGSFBz2Xm6Q+2QrEljPtAa1uiiS/An2y61QbUakOI1dGAChssj2+ASqlbxCBL/8KLweq4LCDNE4FearPek7kbTEjMgUM2QBIcv+UeVSkHNUX5CxOBVrrBCmbYwtuIIK+ii8g2OsdXmIfznn2YMKGSoHDtZjwwWjMXdt1AktdAZbC/nFvz7PQ6Vz8lc2hBrB0yDLaiVlUAVSzKjPiWihtHN+9WE0kh614OmK5OT3BIfuJN65vDjLwk4tZJDshjnB9mE9MXGQm+CxAF2Q/U1V6Ohq0S6kVXnmpr";
		//msg = URLEncoder.encode(msg,"UTF-8");
		key = "7350031047507350";
		pipe.parseEncryptedMerchAggrResult(msg, key);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
			
		}*/
	
	public void sample(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		System.out.println("yes received");
		
		byte[] b = null;
		String url=null;
		String param=null;
		ServletOutputStream out=response.getOutputStream();
		byte[] resByte=null;
		String req=null;
		String res=null;
		String resp[]=null;
		iPayPipe pipe = new iPayPipe();
		String key = "";
		
		try {
			System.out.println("Payment Posting Messge Receiced");
			//key ="7129842055647129";
			
			key ="7129842055647129"; //SIT terminal key
			b  = getMessageBytes(request);
			
			//req = request.getParameter("trandata");
			req = new String(b);

			req = req.replace("trandata=", "");
			req = URLDecoder.decode(req,"UTF-8");
			System.out.println("Response from FSSPay::"+req);
			pipe.parseEncryptedMerchAggrResult(req, key);
			System.out.println("Response from FSSPay::"+req);
			out.print("success");
			out.flush();
			out.close();
			return;


		} catch (Exception e) {
			e.fillInStackTrace();
		}
		finally
		{
			 b = null;
			 url=null;
			 param=null;
			 res=null;
			 resp=null;
		}
		
	}
}
