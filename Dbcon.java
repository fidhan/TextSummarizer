package dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *

 **/
public class Dbcon {

    Connection con;

    public Connection getcon() throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getCon("jdbc:mysql://localhost:3306/rists", "root", "");
        return con;
    }
}
