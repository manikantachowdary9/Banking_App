package register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
@WebServlet("/register/TransactionServlet")
public class TransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("loggedIn") != null
                && (boolean) request.getSession().getAttribute("loggedIn")) {
            String accountNumber = request.getSession().getAttribute("accountNumber").toString();
            List<Transaction> transactions = customerDao.getLast10Transactions(accountNumber);
            request.setAttribute("transactions", transactions);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/transaction.jsp");
            dispatcher.forward(request, response);
            String jsonTransactions = new Gson().toJson(transactions);
            request.setAttribute("transactions", jsonTransactions);
        } else {
            response.sendRedirect("LoginServlet");
        }
        

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
