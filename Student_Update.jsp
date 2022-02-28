<%@    page   import="java.sql.*"    %>

<html>
<body bgcolor='cyan'>

<%
      Connection con=null;
      int STUDENT_NO=Integer.parseInt(request.getParameter("STUDENT_NO"));
      String STUDENT_NAME="";
      String STUDENT_DOB="";
      String STUDENT_DOJ="";
      

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "rajashri"); 

          String query="Select * from Student where STUDENT_NO=" + STUDENT_NO;

           Statement stmt=con.createStatement();
           ResultSet rs=stmt.executeQuery(query);

            if(rs.next())
             {
               STUDENT_NAME=rs.getString("STUDENT_NAME");
	       STUDENT_DOB=rs.getString("STUDENT_DOB");	
	        STUDENT_DOJ=rs.getString("STUDENT_DOJ");	
               	
               	
             }

           rs.close();
           stmt.close();
           con.close();
        }
     catch(Exception e)
        {
          System.out.println(e);
        } 

%>


<form action="Student_Edit.jsp">

<br><br><br>
<table border='1' align="center" bgcolor='violet'>

<tr>
<td>Student No:</td>
<td><%=STUDENT_NO %><input type="hidden" name="sno" value="<%=STUDENT_NO %>"></td>
</tr>

<tr>
<td>Student Name:</td>
<td><input type="text" name="sname"  value="<%=STUDENT_NAME %>"></td>
</tr>

<tr>
<td>Student Date Of Birth:</td>
<td><input type="text" name="dob"  value="<%=STUDENT_DOB %>"></td>
</tr>

<tr>
<td>Student Date Of Joining:</td>
<td><input type="text" name="doj"  value="<%=STUDENT_DOJ %>"></td>
</tr>



<tr>
<th colspan="2"><input type="submit" value="Submit"></th>
</tr>

</table>

</form>

</body>
</html>