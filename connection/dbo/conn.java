
package connection.dbo;
import java.sql.*;
public class conn {
    public static Connection getcon()
    {
        Connection con = null;
       try {
   
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=dmart;encrypt=true;trustServerCertificate=true";
            con = DriverManager.getConnection(url, "karan", "2002");
        } 
       catch (Exception e) {
           System.out.println(e);
        }
       return con;
    }
}
