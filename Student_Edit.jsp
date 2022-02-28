<%@    page   import="java.sql.*"    %>

<html>
<body>

<%
       int STUDENT_NO=Integer.parseInt(request.getParameter("sno"));
       String STUDENT_NAME=request.getParameter("sname");
       String STUDENT_DOB=request.getParameter("dob");
       String STUDENT_DOJ=request.getParameter("doj");
 

      Connection con=null;

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "rajashri"); 

          String query="Update Student set STUDENT_NAME='" + STUDENT_NAME + "', STUDENT_DOB='" + STUDENT_DOB + "', STUDENT_DOJ='" + STUDENT_DOJ + "' where STUDENT_NO=" + STUDENT_NO;

           Statement stmt=con.createStatement();
           stmt.executeUpdate(query);

           stmt.close();
           con.close();
        }
     catch(Exception e)
        {
          System.out.println(e);
        } 

    
%>

<script language="javascript">
    alert("Record updated successfully");
    document.location.href="Student_List.jsp";
</script>

</body>
</html>







