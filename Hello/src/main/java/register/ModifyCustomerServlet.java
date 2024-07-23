package register;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register/ModifyCustomerServlet")
public class ModifyCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        Customer customer = customerDao.getCustomerDetails(accountNumber);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/modify.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String emailId = request.getParameter("emailId");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        boolean updateSuccess = customerDao.updateCustomerDetails(accountNumber, fullName, address, emailId, dob, phone);
        if(updateSuccess) {
        	response.sendRedirect(request.getContextPath() + "/register/ViewCustomerDetailsServlet");
        }
        else {
        	request.setAttribute("errorMessage1", "You Have Produced Wrong Details Please Recheck It");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/modifyerror.jsp");
            dispatcher.forward(request, response);
        }
        
    }
}
