package kr.co.kic.dev1.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/member/join")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println(id);
		System.out.println(email);
		System.out.println(password);
		
		DataSource ds = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Context context = new InitialContext();
			//     /jdbc/kic��  context.xml �� name�Ӽ����� ��ġ�ؾ��Ѵ�.
			ds = (DataSource)context.lookup("java:comp/env/jdbc/kic");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			//�̹� ������� connection pool�� �ִ� connection ��ü�� �����´�.
			//�� �������� �����ϴ°��� �ƴϴ�.
			con = ds.getConnection();
			System.out.println("����");
			StringBuffer sql = new StringBuffer();
			sql.append("Insert into member(m_id, m_email, m_pwd) ");
			sql.append("values(?,?,password(?))");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				//con ��ü�� �����ϴ°� �ƴ϶� connection pool�� connection ��ü�� �ݳ��ϴ°��̴�.
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		
		response.sendRedirect("/member/join/success");
	}
}