package in.crud;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class homepage extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Student> stud = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from student");

			while (rs.next()) {
				int si = rs.getInt("SI");
				String usn = rs.getString("usn");
				String name = rs.getString("name");
				String branch = rs.getString("branch");
				String contact = rs.getString("contact");
				String gender = rs.getString("gender");
				String city = rs.getString("city");
				stud.add(new Student(si, usn, name, branch, contact, gender, city));
			}
			req.setAttribute("students", stud);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/home.jsp");
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			resp.getWriter().println("Error: " + e.getMessage());
			e.printStackTrace();
		}
	}

	public static class Student {
		private int si;
		private String usn;
		private String name;
		private String branch;
		private String contact;
		private String gender;
		private String city;

		public Student(int si, String usn, String name, String branch, String contact, String gender, String city) {
			super();
			this.si = si;
			this.usn = usn;
			this.name = name;
			this.branch = branch;
			this.contact = contact;
			this.gender = gender;
			this.city = city;
		}

		public int getSi() {
			return si;
		}

		public void setSi(int si) {
			this.si = si;
		}

		public String getUsn() {
			return usn;
		}

		public void setUsn(String usn) {
			this.usn = usn;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getBranch() {
			return branch;
		}

		public void setBranch(String branch) {
			this.branch = branch;
		}

		public String getContact() {
			return contact;
		}

		public void setContact(String contact) {
			this.contact = contact;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

	}
}
