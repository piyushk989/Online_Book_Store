<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:tomato;">
    <div align="center">
    <h1 style="color:blue; border-bottom: 7px solid #4a208e; border-style: solid;">Online Book Store</h1>
    
    <h3>Add Book Here</h3>
    <font color=#FFFF00>${succMsg}</font>
    <font color='blue'>${failMsg}</font>
    
    <form:form action="saveBook?bookId=${book.bookId}" modelAttribute="book"  method="POST">
    <table style="background-color:teal">
    
      <tr>
          <td>Book Name :</td>
          <td><form:input path="bookName"/></td>
      </tr>
      
      <tr>
           <td>Book Price :</td>
           <td><form:input path="bookPrice"/></td>       
      </tr>
      
         
      <tr>
          <td>Author Name :</td>
          <td><form:input path="authorName"/></td>
      </tr>
      
      <tr>
         <td></td>
         <td style="color:#f44336"><input type="submit" value="Submit"/></td>
      </tr>
      
      
    </table>
    </form:form>  
    
    
    
    
    <a href="viewBooks">View All Books</a>
    </div>
   
 </body>
</html>   
    
    
    
    
    
    



