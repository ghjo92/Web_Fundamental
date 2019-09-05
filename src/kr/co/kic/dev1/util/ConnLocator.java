package kr.co.kic.dev1.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnLocator {
	public static Connection getConnection() {
		DataSource ds = null;
		Connection con = null;
		try {
			Context context = new InitialContext();
			//java:comp/env/ 怨좎젙
			//jdbc/kic => context.xml�쓽 name�냽�꽦 媛믨낵 �씪移섑빐�빞 �븳�떎.
			ds = (DataSource)context.lookup(
					"java:comp/env/jdbc/kic");
			//ds.getConnection()��  Connection Pool�뿉 �씠誘� 留뚮뱾�뼱吏�
			//Connection 媛앹껜瑜� 媛��졇�삩�떎. 
			//�떎�떆留먰빐�꽌 �씠 �떆�젏�뿉�꽌 Connection 媛앹껜瑜� �깮�꽦�븯�뒗 寃껋씠 �븘�땲�씪
			//�씠誘� 留뚮뱾�뼱吏� Connection 媛앹껜瑜� �궗�슜�븯�뒗 寃껋씠�떎.
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
}
