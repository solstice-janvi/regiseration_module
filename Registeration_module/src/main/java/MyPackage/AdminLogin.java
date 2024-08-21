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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/register";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "janvi2978";

    public AdminLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check user credentials
            String query = "SELECT name FROM registration WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Authentication successful
            	HttpSession session = request.getSession();
                String name = rs.getString("name");
                Cookie c = new Cookie("name", name);
                response.addCookie(c);
                
                response.setStatus(HttpServletResponse.SC_OK);
                request.getRequestDispatcher("adminhome").forward(request, response);
            } else {
                // Authentication failed
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid credentials");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }
}
