
import com.connection.DatabaseConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
@WebServlet("/AddTeams")
public class AddTeams extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Creating session
        HttpSession session = request.getSession();
        
            try {
 
                //String imageName = null;
                String teamName = null;
                
                teamName = request.getParameter("team");
                
                try {
                    String id = (String) session.getAttribute("uname");
                    System.out.println(id);
                    //Querying to insert product in the table
                    int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into teams(team_name) values('" + teamName + "')");
                    //If product inserted sucessfully in the database
                    if (i > 0) {
                        String success = "Team added successfully.";
                        //Adding method in session.
                        session.setAttribute("message", success);
                        //Response send to the admin-add-product.jsp
                        response.sendRedirect("admin-add-team.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception ex) {
                //If any occur occured
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }
      
    }
    
}
