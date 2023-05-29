import static connection.dbo.conn.getcon;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/deletestore"})
public class deletestore extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String storeId = request.getParameter("id");
    if (storeId != null) {
        try {
            Connection con = getcon();
            String query = "Delete FROM [add-store] WHERE id = '"+ storeId +"'";
            Statement statement = con.createStatement();
            int rowsAffected = statement.executeUpdate(query);
            if (rowsAffected > 0) {
                response.sendRedirect("view-store.jsp"); // Redirect to the view page after deletion
            } else {
                response.getWriter().println("Failed to delete the store.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred while deleting the store.");
        }
    } else {
        response.getWriter().println("Invalid store ID.");
    }
        
        }
    }

  


