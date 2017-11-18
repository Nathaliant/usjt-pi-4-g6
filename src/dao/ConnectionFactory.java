package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory
{
	static String user = "usjt";
	static String password = "usjt";
	
	static
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e)
		{
			throw new RuntimeException(e);
		}
	}

	public static Connection obtemConexao() throws SQLException
	{
    return DriverManager.getConnection("jdbc:mysql://localhost/usjt-pi-4?user="+user+"&password="+password);
	}
}