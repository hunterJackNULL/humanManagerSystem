package com.servlet;

/** 
* <p>Title:用于产生校验码的servlet类</p> 
* <p>Description:用于产生校验码的servlet类</p> 
* @version 1.0 
*/
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/validateColor")
public class ValidateColorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int codeLength = 5; // 验证码位数
	private static int imageWidth = 80; // 图片宽度
	private static int imageHeight = 32; // 图片高度

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置页面不缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		// 在内存中创建图象
		BufferedImage image = new BufferedImage(imageWidth, imageHeight, BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 生成随机类
		Random random = new Random();
		// 设定背景色
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, imageWidth, imageHeight);
		// 设定字体
		g.setFont(new Font("Times New Roman", Font.PLAIN, 30));
		// 画边框
		g.setColor(new Color(20, 20, 20));
		g.drawRect(0, 0, imageWidth - 1, imageHeight - 1);

		// 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(imageWidth);
			int y = random.nextInt(imageHeight);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		// 取随机产生的认证码
		// 可以自己设置数字字母等，本例只是产生数字
		String sRand = "";
		for (int i = 0; i < codeLength; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			// 将认证码显示到图象中
			// 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(rand, 13 * i + 6, 22);
		}
		// 将认证码存入SESSION中
		// 获取方式 request.getSession().getAttribute("checkCode");
		request.getSession().setAttribute("checkCode", sRand);
		// 图象生效
		g.dispose();
		// 输出图象到页面
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}

	/**
	 * * 获取随机颜色
	 * 
	 * @param fc
	 * @param bc
	 * @return
	 */
	private Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255) {
			fc = 255;
		}
		if (bc > 255) {
			bc = 255;
		}
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
}
