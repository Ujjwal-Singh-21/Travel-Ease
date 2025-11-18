<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String url = "jdbc:mysql://localhost:3306/TravelEaseDB";
    String dbUser = "root";
    String dbPass = "tiger";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, dbUser, dbPass);

        // Check if email already exists
        String checkSql = "SELECT email FROM users WHERE email = ?";
        ps = con.prepareStatement(checkSql);
        ps.setString(1, email);
        rs = ps.executeQuery();

        if (rs.next()) {
%>
            <script>
                alert("Email already registered! Please use another email.");
                window.location.href = "register.html";
            </script>
<%
        } else {
            // Now insert new user
            ps.close(); // Close previous statement
            String insertSql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            ps = con.prepareStatement(insertSql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);

            int i = ps.executeUpdate();

            if (i > 0) {
%>
                <script>
                    alert("Registration successful! Please login.");
                    window.location.href = "login.html";
                </script>
<%
            } else {
%>
                <script>
                    alert("Registration failed. Please try again.");
                    window.location.href = "register.html";
                </script>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Error occurred! Please try again.");
            window.location.href = "register.html";
        </script>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
