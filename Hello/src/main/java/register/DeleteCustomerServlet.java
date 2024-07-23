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
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

@WebServlet("/register/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        if (isBalanceZero(accountNumber)) {
            if (deleteCustomer(accountNumber)) {
                response.sendRedirect(request.getContextPath() + "/AdminDashboardServlet");
            } else {

                response.getWriter().println("Error: Unable to delete the account.");
            }
        } else {
        
            response.getWriter().println("Error: Account balance is not zero. Cannot delete the account.");
        }
    }

    private boolean isBalanceZero(String accountNumber) {
        String jdbcUrl = "jdbc:mysql://localhost:3307/bank?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String dbUser = "root";
        String dbPassword = "2301";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String query = "SELECT balance FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, accountNumber);
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    double balance = resultSet.getDouble("balance");
                    return balance == 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }

    private boolean deleteCustomer(String accountNumber) {
        String jdbcUrl = "jdbc:mysql://localhost:3307/bank?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String dbUser = "root";
        String dbPassword = "2301";
        
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String deleteQuery = "DELETE FROM customer WHERE account_number = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setString(1, accountNumber);
                int rowsAffected = preparedStatement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/deletecustomer.jsp");
            dispatcher.forward(request, response);
    }

}
