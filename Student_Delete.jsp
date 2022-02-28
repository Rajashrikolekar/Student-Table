<%@    page   import="java.sql.*"    %>

<html>
<body>

<%
       int STUDENT_NO=Integer.parseInt(request.getParameter("STUDENT_NO"));

      Connection con=null;

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "rajashri"); 

          String query="Delete from student where STUDENT_NO=" + STUDENT_NO;

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
    alert("Record deleted successfully");
    document.location.href="Student_List.jsp";
</script>

</body>
</html>







