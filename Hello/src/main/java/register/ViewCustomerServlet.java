package register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/register/ViewCustomerDetailsServlet")
public class ViewCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Customer> customers = customerDao.getAllCustomers();
        request.setAttribute("customers", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/viewcustomer.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}