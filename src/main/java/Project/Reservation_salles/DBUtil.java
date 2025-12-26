package Project.Reservation_salles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.io.InputStream;

public class DBUtil {
    private static String url;
    private static String username;
    private static String password;
    private static String driver;

    static {
        try (InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("db.properties")) {
            Properties p = new Properties();
            p.load(in);
            url = p.getProperty("jdbc.url");
            username = p.getProperty("jdbc.username");
            password = p.getProperty("jdbc.password");
            driver = p.getProperty("jdbc.driver");
            Class.forName(driver);
        } catch (Exception e) {
            throw new RuntimeException("Failed to load DB config", e);
        }
    }

    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(url, username, password);
    }
    

}

