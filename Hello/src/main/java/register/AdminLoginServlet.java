package register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/register/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    	
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (isValidLogin(username, password)) {
        	response.sendRedirect(request.getContextPath() + "/AdminDashboardServlet");
        } else {
        	response.getWriter().println("Error: UserName Or Password Incorrect");
        }
    }

    private boolean isValidLogin(String accountNumber, String password) {
    	String jdbcUrl = "jdbc:mysql://localhost:3307/bank?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    	String dbUser = "root";
    	String dbPassword = "2301";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String checkQuery = "SELECT COUNT(*) FROM admin WHERE username = ? AND password = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(checkQuery)) {
                preparedStatement.setString(1, accountNumber);
                preparedStatement.setString(2, password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    resultSet.next();
                    return resultSet.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin.jsp");
            dispatcher.forward(request, response);
            String imagePath = request.getContextPath() +"/wall.jpg";
            request.setAttribute("backgroundImage", imagePath);
        
    }
}

