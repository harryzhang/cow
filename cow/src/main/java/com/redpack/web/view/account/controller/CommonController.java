package com.redpack.web.view.account.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.text.ParseException;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redpack.utils.IDCardUtil;
import com.redpack.utils.ResponseUtils;
import com.redpack.web.view.base.controller.BaseController;
import com.redpack.web.view.base.controller.ValidCodeUtil;


/**
 * @Description 描述方法作用
 * @date 2015年5月27日 下午5:33:52
 * @File CommonController.java
*/
@Controller
@RequestMapping(value = "/common")
public class CommonController extends BaseController{
	
	private static final Logger logger = Logger.getLogger(CommonController.class);

	/**
	 * 生成验证码
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "imageCode")
	public String imageCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		// 在内存中创建图象
		int width = 65, height = 20;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 生成随机类
		Random random = new Random();
		// 设定背景色
		g.setColor(getRandColor(230, 255));
		g.fillRect(0, 0, 100, 25);
		// 设定字体
		g.setFont(new Font("Arial", Font.CENTER_BASELINE | Font.ITALIC, 18));
		// 产生0条干扰线，
		g.drawLine(0, 0, 0, 0);
		// 取随机产生的认证码(4位数字) 将验证码存入页面KEY值的SESSION里面
		String sRand = ValidCodeUtil.putValidcode(request);
		for (int i = 0; i < sRand.length(); i++) {
			char rand = sRand.charAt(i);
			// 将认证码显示到图象中
			g.setColor(getRandColor(100, 150));// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			g.drawString(String.valueOf(rand), 15 * i + 6, 16);
		}
		  for(int i=0;i<(random.nextInt(5)+5);i++){  
		        g.setColor(new Color(random.nextInt(255)+1,random.nextInt(255)+1,random.nextInt(255)+1));  
		        g.drawLine(random.nextInt(100),random.nextInt(30),random.nextInt(100),random.nextInt(30));  
		}
		
		// 图象生效
		g.dispose();
		ServletOutputStream responseOutputStream = response.getOutputStream();
		// 输出图象到页面
		ImageIO.write(image, "JPEG", responseOutputStream);
		// 以下关闭输入流！
		responseOutputStream.flush();
		responseOutputStream.close();
		// 获得页面key值
		return null;
	}

	/**
	 * 给定范围获得随机颜色
	 * 
	 * @param fc
	 * @param bc
	 * @return
	 */
	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
	
	
	/**
	 * 验证身份证号码
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws NumberFormatException
	 * @throws ParseException
	 * @date 2015-4-4 上午12:02:52
	 */
	@RequestMapping(value = "isIDNO")
	public void isIDNO(HttpServletRequest request,HttpServletResponse response) throws IOException, NumberFormatException, ParseException {
		JSONObject jsonObject = new JSONObject();
		String IDNO = request.getParameter("idNo");
		if (StringUtils.isBlank(IDNO)) {
			jsonObject.put("putStr", "0");
			ResponseUtils.renderText(response, null,jsonObject.toString());
			return;
		}
		long len = IDNO.length();
		// 验证身份证
		int sortCode = 0;
		int MAN_SEX = 0;
		if (len == 15) {
			sortCode = Integer.parseInt(IDNO.substring(12, 15));
		} else if(len == 18) {
			sortCode = Integer.parseInt(IDNO.substring(14, 17));
		}else{
			jsonObject.put("putStr", "0");
			ResponseUtils.renderText(response, null,jsonObject.toString());
			return;
		}
		if (sortCode % 2 == 0) {
			MAN_SEX = 2;// 女性身份证
		} else if (sortCode % 2 != 0) {
			MAN_SEX = 1;// 男性身份证
		} else {
			jsonObject.put("putStr", "1");// 身份证不合法
			ResponseUtils.renderText(response, null,jsonObject.toString());
			return;
		}
		String iDresutl = "";
		iDresutl = IDCardUtil.chekIdCard(MAN_SEX, IDNO);
		if (iDresutl != "") {
			jsonObject.put("putStr", "1");// 身份证不合法
			ResponseUtils.renderText(response, null,jsonObject.toString());
		}
	}
	
	
	public static void recursiveCode(String key,Map<String,Object> object,Map<String,Object> cityCodeMap){
		for (Map.Entry<String, Object> cityEntry : cityCodeMap.entrySet()) {  
			String cityKey = cityEntry.getKey();
			if(cityKey.contains(key+"_")){
				String code = cityKey.split("_")[1];
				object.put("c"+code, cityEntry.getValue());
			}
		}
	}
	
}
