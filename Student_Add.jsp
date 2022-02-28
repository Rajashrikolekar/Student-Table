<%@    page   import="java.sql.*"    %>

<html>
<body bgcolor='yellow'>

<%
      Connection con=null;
      int STUDENT_NO=0;

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "rajashri"); 

          String query="Select max(STUDENT_NO) maxnum from Student";

           Statement stmt=con.createStatement();
           ResultSet rs=stmt.executeQuery(query);

            if(rs.next())
                   STUDENT_NO=rs.getInt("maxnum");

           rs.close();
           stmt.close();
           con.close();
        }
     catch(Exception e)
        {
          System.out.println(e);
        } 

     STUDENT_NO++;
%>


<form action="Student_Insert.jsp">

<br><br><br>
<table bgcolor="red" align="center" border="1">

<tr>
<td>Student No:</td>
<td><%=STUDENT_NO %><input type="hidden" name="sno" value="<%=STUDENT_NO %>"></td>
</tr>

<tr>
<td>Student Name:</td>
<td><input type="text" name="sname"></td>
</tr>

<tr>
<td>Student Date of Birth:</td>
<td><input type="text" name="dob"></td>
</tr>

<tr>
<td>Student Date of Joining:</td>
<td><input type="text" name="doj"></td>
</tr>


<tr>
<th colspan="2"><input type="submit" value="Submit"></th>
</tr>

</table>

</form>

</body>
</html>