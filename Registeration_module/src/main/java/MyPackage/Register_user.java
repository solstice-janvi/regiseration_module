package MyPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



public class Register_user extends HttpServlet {
	 
  
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		 
		 String url = "jdbc:mysql://localhost:3306/register";
		 String username = "root";
		 String pass = "janvi2978";
		 
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection connection = DriverManager.getConnection(url, username , pass );
			
			String q = "insert into register_user(name, email, password ) VALUES (?,?,?)";
			
			PreparedStatement pstm = connection.prepareStatement(q);
			pstm.setString(1, name);
			pstm.setString(2, email);
			pstm.setString(3, password);
			
			pstm.executeUpdate();
			out.println("done....");
			System.out.println("Done");
			
		}catch (Exception e ) {
			e.printStackTrace();
			
		}
		
		
		
	}

	

}
