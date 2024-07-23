package register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/delete.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("/AccountServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = (String) request.getSession().getAttribute("accountNumber");

        if (customerDao.isBalanceZero(accountNumber)) {
            if (customerDao.deleteAccount(accountNumber)) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
            } else {
                response.sendRedirect("/error.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Account because the balance is not zero.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/deleteerror.jsp");
            dispatcher.forward(request, response);
        }
    }
}
