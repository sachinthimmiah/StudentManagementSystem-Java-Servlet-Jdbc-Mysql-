package in.crud;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.concurrent.locks.ReentrantLock;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletestud")
public class Delete extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String si = req.getParameter("id");
		if (si != null && !si.isEmpty()) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "root");
				PreparedStatement ps = con.prepareStatement("delete from student where SI=?");
				ps.setInt(1, Integer.parseInt(si));
				int count = ps.executeUpdate();
				if (count > 0) {
					resp.sendRedirect("home");
				} else {
					resp.getWriter().println("Error: Student not found or unable to delete.");
				}

			} catch (Exception e) {
				resp.getWriter().println("Error: " + e.getMessage());
				e.printStackTrace();
			}
		} else {
			resp.getWriter().println("Error: Student ID is missing.");
		}

	}

}
