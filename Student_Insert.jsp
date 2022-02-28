<%@    page   import="java.sql.*"    %>

<html>
<body>

<%
       int sno=Integer.parseInt(request.getParameter("sno"));
       String sname=request.getParameter("sname");
       String dob=request.getParameter("dob");
       String doj=request.getParameter("doj");
      Connection con=null;

      try
        {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "rajashri"); 

          String query="Insert into Student values(" + sno + ",'" + sname + "','" + dob + "','" + doj + "')";

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
    alert("Record inserted successfully");
    document.location.href="Student_List.jsp";
</script>

</body>
</html>







