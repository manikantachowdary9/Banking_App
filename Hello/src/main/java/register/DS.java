package register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/register/DS")
public class DS extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/deposit.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("LoginServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = (String) request.getSession().getAttribute("accountNumber");
        String amountParam = request.getParameter("amount1");
        BigDecimal amount1 = new BigDecimal(amountParam);

        boolean isUpdated = customerDao.updateBalanceForDeposit(accountNumber, amount1);
        if (isUpdated) {
            customerDao.insertTransactionForDeposit(accountNumber, amount1, "Deposit");
            AccountDetails accountDetails = customerDao.getAccountDetails(accountNumber);
            request.setAttribute("accountDetails", accountDetails);
            request.getSession().setAttribute("amount1", amount1);
            response.sendRedirect(request.getContextPath() + "/DSSuccessServlet");
        } else {
            response.sendRedirect("/error.jsp");
        }
    }
}
