
import java.io.IOException;

import com.connection.DatabaseConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Retrieving values from the frontend
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");


        //Creating Session
        HttpSession hs = request.getSession();

        //Inserting all values inside the database
        try {
            //Connecting database connection and querying in the database
            int addCustomer = DatabaseConnection.insertUpdateFromSqlQuery("insert into customers(name,email,password,phone)values('" + name + "','" + email + "','" + password + "','" + mobile + "')");

            //If customer registered successfully
            if (addCustomer > 0) {
                String message = "Customer register successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("customer-register.jsp");
            } else {
                //If customer fails to register 
                String message = "Customer registration fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("customer-register.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
