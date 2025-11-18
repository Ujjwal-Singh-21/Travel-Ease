<%-- <%
    session.invalidate(); // Clear all session data
    response.sendRedirect("index.html"); // Redirect to home page
%> --%>

<%
    session.invalidate(); // Ends session
    response.sendRedirect("index.html"); // Redirects to home
%>
