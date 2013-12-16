package uj.psi.cw5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws ClassNotFoundException
    {
    	Class.forName("org.sqlite.JDBC");
    	System.out.println("HELOL");
        SQLiteDatabaseSetup s = new SQLiteDatabaseSetup();
        s.databaseSetup();
    }
}
