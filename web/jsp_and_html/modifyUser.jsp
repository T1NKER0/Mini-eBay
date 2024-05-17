<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.CPEN410.*"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <title>Modify User</title>
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

        String currentPage = "modifyUser.jsp";
        String userName = session.getAttribute("userName").toString();
        String previousPage = session.getAttribute("currentPage").toString();

        //Create the appDBMAuth object
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
            %>Admin Role Verified
            <%session.setAttribute("currentPage", currentPage);%> 
            <%
            //Retrieve the list of all users
            ResultSet resUser = appDBAuth.listAllUsers();
            %>
            <!-- User Modification Form -->
            <form action="updateUser.jsp" method="POST">
                <table border="0">
                    <tr>
                        <td> Select User to Modify </td>
                        <td>
                            <select id="userNameModify" name="userNameModify" style="width: 200px; font-size: 14px;">
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
                    <tr>
                        <td> New Username </td>
                        <td><input type="text" id="newUserName" name="newUserName" required/></td>
                    </tr>
                    <tr>
                        <td> New Password </td>
                        <td><input type="password" id="newPass" name="newPass" required/></td>
                    </tr>
                    <tr>
                        <td> New Name </td>
                        <td><input type="text" id="newName" name="newName" required/></td>
                    </tr>
                
                    <tr>
                        <td> New Telephone </td>
                        <td><input type="text" id="newTelephone" name="newTelephone" required/></td>
                    </tr>
                </table>
                <input type="submit" id="Submit" value="Submit" />
                <input type="reset" id="Reset" value="Reset" />
            </form>

            <form action="welcomeMenu.jsp" method="GET">
                <button type="submit" name="welcomeMenu" value="welcomeMenu">Back to main page</button>
            </form>
            <%  

        }else{
            //Close any session associated with the user
            session.setAttribute("userName", null);

            //return to the login page
            response.sendRedirect("loginHashing.html");
        }
        //Close the connection to the database
        appDBAuth.close();
    }
}catch(Exception e) {
    e.printStackTrace();
    // Handle exceptions here
}finally{
    System.out.println("Finally");
}
%><!-- Session Info -->
sessionName=<%= session.getAttribute("userName")%>
</body>
</html>
