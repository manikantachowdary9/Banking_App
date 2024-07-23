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
import java.util.ArrayList;
import java.util.List;


@WebServlet("/register/MiniServlet")
public class MiniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }

    public MiniServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("loggedIn") != null
                && (boolean) request.getSession().getAttribute("loggedIn")) {
            List<Transaction> transactions = getLast10Transactions(request.getSession().getAttribute("accountNumber").toString());
            request.getSession().setAttribute("transactions", transactions);
            response.sendRedirect("DownloadPdfServlet");
            
        } else {
            response.sendRedirect("LoginServlet");
        }
    }
    private List<Transaction> getLast10Transactions(String accountNumber) {
        List<Transaction> transactions = new ArrayList<>();
        String jdbcUrl = "jdbc:mysql://localhost:3307/bank?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String dbUser = "root";
        String dbPassword = "2301";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String selectQuery = "SELECT * FROM transactions WHERE account_number = ? ORDER BY transaction_time DESC LIMIT 10";
            try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                preparedStatement.setString(1, accountNumber);
                System.out.println("SQL Query: " + preparedStatement.toString()); // Add this line

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Transaction transaction = new Transaction();
                        transaction.setAccountNumber(resultSet.getString("account_number"));
                        transaction.setAmount(resultSet.getBigDecimal("amount"));
                        transaction.setTransactionType(resultSet.getString("transaction_type"));
                        transaction.setTransactionTime(resultSet.getString("transaction_time"));
                        transactions.add(transaction);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
