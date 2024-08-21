package MyPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/adminhome")
public class Adminhome extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/register";
        String user = "root";
        String password = "janvi2978";

        Cookie[] cookies = request.getCookies();
        String adminName = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("name")) {
                adminName = cookie.getValue();
                break;
            }
        }

        List<Map<String, String>> users = new ArrayList<>();

        HttpSession session = request.getSession(false);
        if(session != null) {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM register_user";
            ResultSet rs = stmt.executeQuery(sql);

            
            
            while (rs.next()) {
                Map<String, String> userRecord = new HashMap<>();
                userRecord.put("id", String.valueOf(rs.getInt("id")));
                userRecord.put("name", rs.getString("name"));
                userRecord.put("email", rs.getString("email"));
                userRecord.put("password", rs.getString("password"));
                users.add(userRecord);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("users", users);
        request.setAttribute("adminName", adminName);
        request.getRequestDispatcher("adminhome.jsp").forward(request, response);
    }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
