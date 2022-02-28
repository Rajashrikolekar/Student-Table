<%@    page   import="java.sql.*"    %>

<html>
<body bgcolor='yellow'>

<center>
<a href="Student_Add.jsp">Add New Student</a>
<br><br>
</center>

<%
      Connection con=null;
      int STUDENT_NO=0;

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "rajashri"); 

          String query="Select * from Student order by STUDENT_NO";

           Statement stmt=con.createStatement();
           ResultSet rs=stmt.executeQuery(query);
%>

<table border="1" align="center" bgcolor='pink'>
<tr>
<th>Student No</th>
<th>Student Name</th>
<th>Student Date Of Birth</th>
<th>Student Date Of joining</th>
<th>Update</th>
<th>Delete</th>
</tr>

<%
            while(rs.next())
             {
               STUDENT_NO=rs.getInt("STUDENT_NO");
%>

<tr>
<td> <%=STUDENT_NO %> </td>
<td> <%=rs.getString("STUDENT_NAME") %> </td>
<td> <%=rs.getString("STUDENT_DOB") %> </td>
<td> <%=rs.getString("STUDENT_DOJ") %> </td>
<td> <a href="Student_Update.jsp?STUDENT_NO=<%=STUDENT_NO %>">Update</a> </td>
<td> <a href="Student_Delete.jsp?STUDENT_NO=<%=STUDENT_NO %>">Delete</a> </td>
</tr>

<%
             }
%>

</table>

<%
           rs.close();
           stmt.close();
           con.close();
        }
     catch(Exception e)
        {
          System.out.println(e);
        } 
%>

</body>
</html>