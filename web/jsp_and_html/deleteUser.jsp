<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.CPEN410.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Delete User</title>
</head>
<body>
<%
try {   
    // Check the authentication process
    if (session.getAttribute("userName") == null || session.getAttribute("currentPage") == null) {
        session.setAttribute("currentPage", null);
        session.setAttribute("userName", null);
        response.sendRedirect("loginHashing.html");
    }else{
        
        String currentPage="deleteUser.jsp";
        String userName = session.getAttribute("userName").toString();
        String previousPage = session.getAttribute("currentPage").toString();
        String userNameDelete = request.getParameter("userNameDelete");

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

            //Call deleteUser method
            boolean deleteUserResult = appDBAuth.deleteUser(userNameDelete);
            
            //User was succesfully deleted
            if (deleteUserResult) {
                %>
                User successfully deleted <br>
                <form action="removeUser.jsp" method="GET">
                    <button type="submit" name="removeUser" value="removeUser">Remove User</button>
                </form>
                <form action="welcomeMenu.jsp" method="GET">
                    <button type="submit" name="welcomeMenu" value="welcomeMenu">Back to main page</button>
                </form>
                <%
            }else{ //Failed to delete
                %>
                Deletion Failed <br>
                <form action="removeUser.jsp" method="GET">
                    <button type="submit" name="removeUser" value="removeUser">Remove User</button>
                </form>
                <form action="welcomeMenu.jsp" method="GET">
                    <button type="submit" name="welcomeMenu" value="welcomeMenu">Back to main page</button>
                </form>
                <%
            }
        } else {
            //Close any session associated with the user
            session.setAttribute("userName", null);

            //Return to the login page
            response.sendRedirect("loginHashing.html");
        }
        //Close connection to database
        appDBAuth.close();
    }
}catch(Exception e){
    %>Nothing to show!<%
    e.printStackTrace();
}finally{
    System.out.println("Finally");
}
%>sessionName=<%=session.getAttribute("userName")%>
</body>
</html>
