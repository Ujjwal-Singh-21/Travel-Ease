<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <% // Check if user is logged in String user = (String)
session.getAttribute("username"); if (user == null) {
response.sendRedirect("index.html"); return; } %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <!-- <link rel="stylesheet" href="admin.css" /> -->
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: #f5f6fa;
        display: flex;
        height: 100vh;
        overflow-x: hidden;
      }

      .sidebar {
        width: 250px;
        background-color: #1e272e;
        color: #fff;
        height: 100vh;
        position: fixed;
        left: 0;
        top: 0;
        transition: transform 0.3s ease-in-out;
        z-index: 999;
      }

      .sidebar-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        background-color: #2f3640;
      }

      .logo {
        font-size: 22px;
      }

      #close-btn {
        font-size: 24px;
        cursor: pointer;
        display: none;
      }

      .sidebar-menu {
        list-style: none;
        padding: 0;
        margin-top: 20px;
      }

      .sidebar-menu li {
        padding: 15px 20px;
        display: flex;
        align-items: center;
        gap: 15px;
        cursor: pointer;
        transition: background 0.3s ease;
      }

      .sidebar-menu li:hover,
      .sidebar-menu li.active {
        background-color: #353b48;
      }

      .sidebar-menu li i {
        font-size: 18px;
      }

      .sidebar-menu li span {
        font-size: 16px;
      }

      .main-content {
        margin-left: 250px;
        padding: 20px;
        width: 100%;
        transition: margin-left 0.3s ease;
      }

      header {
        display: flex;
        align-items: center;
        gap: 15px;
      }

      #menu-btn {
        font-size: 26px;
        cursor: pointer;
        display: none;
      }

      /* Responsive behavior */
      @media (max-width: 768px) {
        .sidebar {
          transform: translateX(-100%);
        }

        .sidebar.active {
          transform: translateX(0);
        }

        #close-btn {
          display: block;
        }

        #menu-btn {
          display: block;
        }

        .main-content {
          margin-left: 0;
        }

        .main-content.shift {
          margin-left: 250px;
        }
      }
    </style>
  </head>
  <body>
    <div class="sidebar" id="sidebar">
      <div class="sidebar-header">
        <h2 class="logo">TravelEase</h2>
        <i class="ri-close-line" id="close-btn"></i>
      </div>
      <ul class="sidebar-menu">
        <li class="active">
          <i class="ri-dashboard-line"></i> <span>Dashboard</span>
        </li>
        <li><i class="ri-user-line"></i> <span>Users</span></li>
        <li><i class="ri-settings-3-line"></i> <span>Settings</span></li>
        <li><i class="ri-file-chart-line"></i> <span>Reports</span></li>
        <li>
          <a href="logout.jsp"
            ><i class="ri-logout-circle-r-line"></i> <span>Logout</span></a
          >
        </li>
      </ul>
    </div>

    <div class="main-content">
      <header>
        <i class="ri-menu-line" id="menu-btn"></i>
        <h1>Admin Panel</h1>
      </header>
      <section>
        <p>This is the main content area.</p>
      </section>
    </div>

    <script>
      const sidebar = document.getElementById("sidebar");
      const menuBtn = document.getElementById("menu-btn");
      const closeBtn = document.getElementById("close-btn");
      const mainContent = document.querySelector(".main-content");

      menuBtn.addEventListener("click", () => {
        sidebar.classList.add("active");
        mainContent.classList.add("shift");
      });

      closeBtn.addEventListener("click", () => {
        sidebar.classList.remove("active");
        mainContent.classList.remove("shift");
      });
    </script>
  </body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Session check and getting username
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: #f5f6fa;
        display: flex;
        height: 100vh;
        overflow-x: hidden;
      }

      .sidebar {
        width: 250px;
        background-color: #1e272e;
        color: #fff;
        height: 100vh;
        position: fixed;
        left: 0;
        top: 0;
        transition: transform 0.3s ease-in-out;
        z-index: 999;
      }

      .sidebar-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        background-color: #2f3640;
      }

      .logo {
        font-size: 22px;
      }

      #close-btn {
        font-size: 24px;
        cursor: pointer;
        display: none;
      }

      .sidebar-menu {
        list-style: none;
        padding: 0;
        margin-top: 20px;
      }

      .sidebar-menu li {
        padding: 15px 20px;
        display: flex;
        align-items: center;
        gap: 15px;
        cursor: pointer;
        transition: background 0.3s ease;
      }

      .sidebar-menu li:hover,
      .sidebar-menu li.active {
        background-color: #353b48;
      }

      .sidebar-menu li i {
        font-size: 18px;
      }

      .sidebar-menu li span {
        font-size: 16px;
      }

      .sidebar-menu li a {
        color: white;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 15px;
      }

      .main-content {
        margin-left: 250px;
        padding: 20px;
        width: 100%;
        transition: margin-left 0.3s ease;
      }

      header {
        display: flex;
        align-items: center;
        gap: 15px;
      }

      #menu-btn {
        font-size: 26px;
        cursor: pointer;
        display: none;
      }

      /* Responsive behavior */
      @media (max-width: 768px) {
        .sidebar {
          transform: translateX(-100%);
        }

        .sidebar.active {
          transform: translateX(0);
        }

        #close-btn {
          display: block;
        }

        #menu-btn {
          display: block;
        }

        .main-content {
          margin-left: 0;
        }

        .main-content.shift {
          margin-left: 250px;
        }
      }
    </style>
  </head>
  <body>
    <div class="sidebar" id="sidebar">
      <div class="sidebar-header">
        <h2 class="logo">TravelEase</h2>
        <i class="ri-close-line" id="close-btn"></i>
      </div>
      <ul class="sidebar-menu">
        <li class="active">
          <i class="ri-dashboard-line"></i> <span>Dashboard</span>
        </li>
        <li><i class="ri-user-line"></i> <span>Users</span></li>
        <li><i class="ri-settings-3-line"></i> <span>Settings</span></li>
        <li><i class="ri-file-chart-line"></i> <span>Reports</span></li>
        <li>
          <a href="logout.jsp">
            <i class="ri-logout-circle-r-line"></i> <span>Logout</span>
          </a>
        </li>
      </ul>
    </div>

    <div class="main-content">
      <header>
        <i class="ri-menu-line" id="menu-btn"></i>
        <h1>Admin Panel</h1>
      </header>
      <section>
        <p>Welcome, <strong><%= user %></strong>! This is the main content area.</p>
      </section>
    </div>

    <script>
      const sidebar = document.getElementById("sidebar");
      const menuBtn = document.getElementById("menu-btn");
      const closeBtn = document.getElementById("close-btn");
      const mainContent = document.querySelector(".main-content");

      menuBtn.addEventListener("click", () => {
        sidebar.classList.add("active");
        mainContent.classList.add("shift");
      });

      closeBtn.addEventListener("click", () => {
        sidebar.classList.remove("active");
        mainContent.classList.remove("shift");
      });
    </script>
  </body>
</html>

