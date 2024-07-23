package register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;


public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CustomerServlet() {
        super();
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("LoginServlet");
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String account = request.getParameter("account");
	    String transactions = request.getParameter("transactions");
	    String deposit = request.getParameter("deposit");
	    String withdraw = request.getParameter("withdraw");
	    String delete = request.getParameter("delete");

	    if (account != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/AccountServlet");
	        dispatcher.forward(request, response);
	    } else if (transactions != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/TransactionServlet");
	        dispatcher.forward(request, response);
	    } else if (deposit != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/DS");
	        dispatcher.forward(request, response);
	    } else if (withdraw != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/WithdrawServlet");
	        dispatcher.forward(request, response);
	    } else if (delete != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/DeleteServlet");
	        dispatcher.forward(request, response);
	    } else {
	    	request.getSession().invalidate();
	        response.sendRedirect(request.getContextPath() + "/LoginServlet");
	        return;
	    }
	    

	}
}