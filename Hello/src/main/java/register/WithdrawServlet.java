package register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/register/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/withdraw.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("LoginServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = (String) request.getSession().getAttribute("accountNumber");
        String amountParam = request.getParameter("amount1");
        BigDecimal amount = new BigDecimal(amountParam);

        BigDecimal balance = customerDao.getBalance(accountNumber);

        if (balance != null && balance.compareTo(amount) >= 0) {
            customerDao.updateBalance(accountNumber, amount);
            customerDao.insertTransaction(accountNumber, amount, "Withdraw");
            AccountDetails accountDetails = customerDao.getAccountDetails(accountNumber);
            request.setAttribute("accountDetails", accountDetails);
            request.getSession().setAttribute("amount", amount);
            System.out.println("Amount retrieved: " + amount);
            response.sendRedirect(request.getContextPath() + "/WithdrawsuccessServlet");
        } else {
            request.setAttribute("errorMessage", "You Are Unable to Withdraw Because You Are Not Having Sufficient Balance In Your Account");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/withdrawerror.jsp");
            dispatcher.forward(request, response);
        }
    }

}
