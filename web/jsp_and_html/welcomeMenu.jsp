<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.CPEN410.*"%>
<%//Import the java.sql package to use the ResultSet class %>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>Mini eBay Home Page</title>
	</head>
	<body>
	<%
	//Try to connect the database using the applicationDBManager and applicationDBAuthenticationGoodComplete class
	try{
		//Check the authentication process
		if (session.getAttribute("userName")==null || session.getAttribute("currentPage")==null) {
			session.setAttribute("currentPage", null);
			session.setAttribute("userName", null);
			response.sendRedirect("loginHashing.html");
		}
		else{
			String currentPage="welcomeMenu.jsp";
			String userName = session.getAttribute("userName").toString();
			String previousPage = session.getAttribute("currentPage").toString();
		
			//Create the appDBAuth object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Create the appDBMnger object
			applicationDBManager appDBMnger = new applicationDBManager();
			System.out.println("Connecting...");
			System.out.println(appDBMnger.toString());
				
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
					
				%>
				Welcome! <%=userActualName%>
				<a href="signout.jsp">Sign out</a> <br>
				
				<!-- Search Form-->
				<form action="searchProduct.jsp" method="GET">
					<label for="search">Search:</label>
					<input type="text" id="productName" name="productName" placeholder="Enter product name">
					<button type="submit">Search</button>
					

					<%ResultSet resDep=appDBMnger.listAllDepartments();%>
					<!-- Department Dropdown List -->
					<form action="searchProduct.jsp" method="GET">
						<table border="0">
							<tr>
								<td> Department </td>
								<td>
									<select id="dept_name" name="dept_name" style="width: 200px; font-size: 14px;">
										<option value="All Departments"> All Departments</option>
										<%
											while (resDep.next()) {
												%>
												<option value="<%= resDep.getString(1) %>"><%= resDep.getString(1) %></option>
												<%
											}
										%>
									</select>
								</td>
							</tr>
						</table>
						<input type="submit" id="Submit" value="submit" />
						<input type="reset" id="Submit" value="reset" />
					</form>
					<table>
					<%
					//draw the menu
					ResultSet menuRes = appDBAuth.menuElements(userName);
					String currentMenu="";

					while(menuRes.next()){

						//Check to create a new menu element
						if (currentMenu.compareTo(menuRes.getString(2))!=0){ 

							//A new element
						    currentMenu = menuRes.getString(2);
							%><tr><td><%=currentMenu%> <td></tr><%
						}

						//print the page title and establish a hyperlink
						%><tr><td>-</td><td><a href="<%=menuRes.getString(1)%>"><%=menuRes.getString(3)%></a><%
					} 
					//Close the table 
					%>
					</table>
					<%
					
				}else{
					//Close any session associated with the user
					session.setAttribute("userName", null);
					
					//return to the login page
					response.sendRedirect("loginHashing.html");
				}
				//res.close();

				//Close the connection to the database
				appDBAuth.close();
				appDBMnger.close();
			}
		}catch(Exception e){
			%>Nothing to show!<%
			e.printStackTrace();
			response.sendRedirect("loginHashing.html");
		}finally{
			System.out.println("Finally");
		}
		%>			
	</body>
</html>
