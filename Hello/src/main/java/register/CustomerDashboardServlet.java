package register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register/CustomerDashboardServlet")
public class CustomerDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {         
			String accountNumber = (String) request.getSession().getAttribute("accountNumber");
            AccountDetails accountDetails = customerDao.getAccountDetails(accountNumber);
            request.setAttribute("accountDetails", accountDetails);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customerdashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("LoginServlet");
        }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
