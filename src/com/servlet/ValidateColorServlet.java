package com.servlet;

/** 
* <p>Title:���ڲ���У�����servlet��</p> 
* <p>Description:���ڲ���У�����servlet��</p> 
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
	private static int codeLength = 5; // ��֤��λ��
	private static int imageWidth = 80; // ͼƬ���
	private static int imageHeight = 32; // ͼƬ�߶�

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ����ҳ�治����
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		// ���ڴ��д���ͼ��
		BufferedImage image = new BufferedImage(imageWidth, imageHeight, BufferedImage.TYPE_INT_RGB);
		// ��ȡͼ��������
		Graphics g = image.getGraphics();
		// ���������
		Random random = new Random();
		// �趨����ɫ
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, imageWidth, imageHeight);
		// �趨����
		g.setFont(new Font("Times New Roman", Font.PLAIN, 30));
		// ���߿�
		g.setColor(new Color(20, 20, 20));
		g.drawRect(0, 0, imageWidth - 1, imageHeight - 1);

		// �������155�������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(imageWidth);
			int y = random.nextInt(imageHeight);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		// ȡ�����������֤��
		// �����Լ�����������ĸ�ȣ�����ֻ�ǲ�������
		String sRand = "";
		for (int i = 0; i < codeLength; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			// ����֤����ʾ��ͼ����
			// ���ú�����������ɫ��ͬ����������Ϊ����̫�ӽ�������ֻ��ֱ������
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(rand, 13 * i + 6, 22);
		}
		// ����֤�����SESSION��
		// ��ȡ��ʽ request.getSession().getAttribute("checkCode");
		request.getSession().setAttribute("checkCode", sRand);
		// ͼ����Ч
		g.dispose();
		// ���ͼ��ҳ��
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}

	/**
	 * * ��ȡ�����ɫ
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
