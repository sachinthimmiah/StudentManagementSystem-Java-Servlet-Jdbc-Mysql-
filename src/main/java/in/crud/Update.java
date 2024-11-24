package in.crud;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updatestudform")
public class Update extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String si = req.getParameter("id1");

		if (si == null || si.isEmpty()) {
			resp.getWriter().println("Student ID (SI) is missing.");
			return;
		}

		String myusn = req.getParameter("usn1");
		String myname = req.getParameter("name1");
		String mybranch = req.getParameter("branch1");
		String mycontact = req.getParameter("contact1");
		String mygender = req.getParameter("gender1");
		String mycity = req.getParameter("city1");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root",
					"root");
			PreparedStatement ps = con.prepareStatement(
					"UPDATE student SET usn = ?, name = ?, branch = ?, contact = ?, gender = ?, city = ? WHERE SI = ?");
			ps.setString(1, myusn);
			ps.setString(2, myname);
			ps.setString(3, mybranch);
			ps.setString(4, mycontact);
			ps.setString(5, mygender);
			ps.setString(6, mycity);
			ps.setInt(7, Integer.parseInt(si));
			int count = ps.executeUpdate();
			if (count > 0) {
				resp.sendRedirect("home");
			} else {
				req.setAttribute("message", "Error : Cannot update Data.....");
				RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
				rd.forward(req, resp);
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			resp.getWriter().println("Error while updating student information: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
