package in.crud;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/studentform")
public class Add extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String myusn = req.getParameter("usn1");
		String myname = req.getParameter("name1");
		String mybranch = req.getParameter("branch1");
		String mycontact = req.getParameter("contact1");
		String mygender = req.getParameter("gender1");
		String mycity = req.getParameter("city1");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/college", "root", "root");

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select count(*) as row_count from student");
			rs.next();
			int rowCount = rs.getInt("row_count");

			if (rowCount == 0) {

				st.executeUpdate("ALTER TABLE student AUTO_INCREMENT = 1");
			}

			PreparedStatement ps = con
					.prepareStatement("insert into student(usn,name,branch,contact,gender,city) values (?,?,?,?,?,?)");
			ps.setString(1, myusn);
			ps.setString(2, myname);
			ps.setString(3, mybranch);
			ps.setString(4, mycontact);
			ps.setString(5, mygender);
			ps.setString(6, mycity);

			int count = ps.executeUpdate();
			if (count > 0) {
				resp.sendRedirect("home");
			} else {
				req.setAttribute("message1", "Error : Cannot Add Data.....");
				RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
				rd.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
