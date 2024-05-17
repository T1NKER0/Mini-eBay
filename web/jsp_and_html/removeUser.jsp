<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.CPEN410.*"%>
<%//Import the java.sql package to use the ResultSet class %>
<%@ page import="java.sql.*"%>

<html>
<head>
    <title>Remove User</title>
</head>
<body>
<%
try {
    // Check the authentication process
    if (session.getAttribute("userName") == null || session.getAttribute("currentPage") == null) {
        session.setAttribute("currentPage", null);
        session.setAttribute("userName", null);
        response.sendRedirect("loginHashing.html");
    } else {
        String currentPage = "removeUser.jsp";
        String userName = session.getAttribute("userName").toString();
        String previousPage = session.getAttribute("currentPage").toString();

        //Create the appDBAuth object
        applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
        System.out.println("Connecting...");
        System.out.println(appDBAuth.toString());

        //Call the verifyUser method.
		ResultSet res=appDBAuth.verifyUser(userName, currentPage, previousPage);

        //Verify if the user has been authenticated
		if (res.next()){
			String userActualName=res.getString(3);
					
			//Create the current page attribute
			session.setAttribute("currentPage", currentPage);
					
			//Create a session variable
			if (session.getAttribute("userName")==null ){
				//create the session variable
				session.setAttribute("userName", userName);
			}else{
				//Update the session variable
				session.setAttribute("userName", userName);
			}

            //Call listAllUsers method 
            ResultSet resUser = appDBAuth.listAllUsers(); 
            %>
                <!-- User Dropdown List -->
                <form action="deleteUser.jsp" method="POST">
                    <table border="0">
                        <tr>
                            <td> User </td>
                            <td>
                                <select id="userNameDelete" name="userNameDelete" style="width: 200px; font-size: 14px;">
                                    <option value="Select User">Select User</option>
                                    <%
                                    while (resUser.next()) {
                                    %>
                                    <option value="<%= resUser.getString(1) %>"><%= resUser.getString(1) %></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" id="Submit" value="Submit" />
                    <input type="reset" id="Reset" value="Reset" />
                </form>
                  <form action="welcomeMenu.jsp" method="POST">
                        <button type="submit" name="welcomeMenu" value="welcomeMenu">Back to main page</button>
                    </form> 
            <%
        }else{
            //Close any session associated with the user
            session.setAttribute("userName", null);

            //Return to the login page
            response.sendRedirect("loginHashing.html");
        }

        //Close the connection to the database
        appDBAuth.close();
    }
} catch (Exception e) {
    e.printStackTrace();
    // Handle exceptions here
} finally {
    System.out.println("Finally");
}
%>
sessionName=<%= session.getAttribute("userName") %>
</body>
</html>
