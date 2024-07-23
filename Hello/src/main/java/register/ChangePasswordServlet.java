package register;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangePasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/ChangePassword.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        boolean passwordChanged = validateAndChangePassword(accountNumber, oldPassword, newPassword);

        if (passwordChanged) {
            request.setAttribute("successMessage", "Password changed successfully.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to change password. Please check your credentials.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
        dispatcher.forward(request, response);
    }

    private boolean validateAndChangePassword(String accountNumber, String oldPassword, String newPassword) {
        String jdbcUrl = "jdbc:mysql://localhost:3307/bank?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String dbUser = "root";
        String dbPassword = "2301";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            if (isOldPasswordCorrect(accountNumber, oldPassword, connection)) {
                return updatePassword(accountNumber, newPassword, connection);
            } else {
                return false; 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Helper method to check if the provided old password is correct
    private boolean isOldPasswordCorrect(String accountNumber, String oldPassword, Connection connection) throws SQLException {
        String checkQuery = "SELECT COUNT(*) FROM customer WHERE account_number = ? AND password = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(checkQuery)) {
            preparedStatement.setString(1, accountNumber);
            preparedStatement.setString(2, oldPassword);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                resultSet.next();
                return resultSet.getInt(1) > 0;
            }
        }
    }
    private boolean updatePassword(String accountNumber, String newPassword, Connection connection) throws SQLException {
        String updateQuery = "UPDATE customer SET password = ? WHERE account_number = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, accountNumber);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        }
    }
}