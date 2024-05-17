<%@ page import="java.lang.*" %>
<%@ page import="ut.JAR.CPEN410.*" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Update User</title>
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

        String currentPage = "updateUser.jsp";
        String userName = session.getAttribute("userName").toString();
        String previousPage = session.getAttribute("currentPage").toString();

        //Get the userName parameter from the previous page
        String oldUserName = request.getParameter("userNameModify");

        //Retrieve other form parameters
        String newUserName = request.getParameter("newUserName");
        String newPass = request.getParameter("newPass");
        String newName = request.getParameter("newName");
        String newTelephone = request.getParameter("newTelephone");

        //Create the appDBMnger object
        applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
        System.out.println("Connecting...");
        System.out.println(appDBAuth.toString());

        //Call the verifyUser method to check if the user is an admin
        ResultSet res = appDBAuth.verifyUser(userName, currentPage, previousPage);

        //Verify if the user has been authenticated
        if (res.next()){

            String sessionName=res.getString(3);
                            
            //Create the current page attribute
            session.setAttribute("currentPage", currentPage);
                            
            //Create a session variable
            if (session.getAttribute("userName")==null){

                //create the session variable
                session.setAttribute("userName", userName);

            }else{
                //Update the session variable
                session.setAttribute("userName", userName);
            }

            //Call the modifyUser method to update user details
            boolean updateSuccess = appDBAuth.modifyUser(oldUserName, newUserName, newPass,  newName, newTelephone);

            // Display success or failure message based on the update result
            if (updateSuccess) {
                %>
                <p>User details updated successfully for user: <%= oldUserName %></p>
                <form action="modifyUser.jsp" method="GET">
                    <button type="submit" name="modifyUser" value="modifyUser">Modify User</button>
                </form>
                <form action="welcomeMenu.jsp" method="GET">
                    <button type="submit" name="welcomeMenu" value="welcomeMenu">Back to main page</button>
                </form>
                <%
            }else{
                %>
                    <p>No user found with username: <%= oldUserName %></p>
                    <form action="modifyUser.jsp" method="GET">
                        <button type="submit" name="modifyUser" value="modifyUser">Modify User</button>
                    </form>
                    <form action="welcomeMenu.jsp" method="GET">
                        <button type="submit" name="welcomeMenu" value="welcomeMenu">Back to main page</button>
                    </form>
                <%
            }
        }else{
            //Close any session associated with the user
            session.setAttribute("userName", null);

            //return to the login page
            response.sendRedirect("loginHashing.html");
        }
        // Close the connection to the database
        appDBAuth.close();
    }  
}catch(Exception e){
    e.printStackTrace();
    // Handle exceptions here

}finally{
    System.out.println("Finally");
}
%>
</body>
</html>


