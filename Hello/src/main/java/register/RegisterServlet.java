package register;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

@WebServlet("/RegisterServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/signup.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String address = request.getParameter("address");
        String emailId = request.getParameter("email_id");
        String account = request.getParameter("account");
        String phone = request.getParameter("phone");
        String balance = request.getParameter("balance");
        String dob = request.getParameter("dob");
        Part filePart = request.getPart("id_proof");

        int accountNumber = generateUniqueAccountNumber();
        String password = generateRandomPassword();

        boolean registrationSuccess = customerDao.registerCustomer(accountNumber, fullName, address, emailId, password, account, balance, dob, filePart, phone);

        if (registrationSuccess) {
            request.getSession().setAttribute("ac", accountNumber);
            request.getSession().setAttribute("pass", password);

            response.sendRedirect(request.getContextPath() + "/register/RegisterSuccesfullServlet");
        } else {
            request.setAttribute("errorMessage", "You Have Produced Wrong Details Please Recheck It");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/registererror.jsp");
            dispatcher.forward(request, response);
        }
    }

    private int generateUniqueAccountNumber() {
        int newAccountNumber;
        do {
            newAccountNumber = 100000000 + new java.security.SecureRandom().nextInt(900000000);
        } while (customerDao.isAccountNumberExists(newAccountNumber));

        return newAccountNumber;
    }

    private String generateRandomPassword() {
        java.security.SecureRandom random = new java.security.SecureRandom();
        byte[] randomBytes = new byte[16];
        random.nextBytes(randomBytes);

        return java.util.Base64.getEncoder().encodeToString(randomBytes);
    }

}
