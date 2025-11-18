<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String url = "jdbc:mysql://localhost:3306/TravelEaseDB";
    String dbUser = "root";
    String dbPass = "tiger";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "SELECT * FROM users WHERE email=? AND password=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);

        rs = stmt.executeQuery();

        if (rs.next()) {
            String username = rs.getString("username"); // Assuming this column exists
            session.setAttribute("username", username); // ✅ Set session attribute
%>
            <script>
                alert("Login Successful! Welcome, <%= username %>");
                window.location.href = "dashboard.html";
            </script>
<%
        } else {
%>
            <script>
                alert("Invalid email or password!");
                window.location.href = "login.html";
            </script>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Error occurred! Try again.");
            window.location.href = "login.html";
        </script>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
