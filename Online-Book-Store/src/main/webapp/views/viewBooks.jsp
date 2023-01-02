<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
  border: 1px solid black;
  padding: 5px;
  style="font-family:'Courier New'";
  border-bottom: 1px solid #4a208e;
  background-color: 000000;
  color: white;
}
table {
  border-spacing: 15px;
}
</style>


</head>
<body style="background-color:teal;">
<div align="center">

      <a href="/">+Add New Book</a>
      
      <table style="background-color:#ff7065">
           <thead>
              <tr>
                  <th>Book Id</th>
                  <th>Book Name</th>
                  <th>Book Price</th>
                  <th>Author Name</th>
                  <th>Action</th>
                  
              
              </tr>
              </thead>
           <tbody>                                   <%--JSTL code tag library to iterate  the collection --%>
             <c:forEach items="${books}" var="b">     <%--take one object from "{books}" and store in "b" and 
                                                       execute in d loop--%>
                 
                                                       
                 <tr>                      
                     <td>${b.bookId}</td>
                     <td>${b.bookName}</td>                    <%--books ====> for(Book b: bookList){
                                                               b.getBookId();
                                                               b.getBookName();
                                                                   }--%>
                     <td>${b.bookPrice}</td>
                     <td>${b.authorName}</td>
                     
                     <td>
                          <a href="editBook?bid=${b.bookId}">Edit</a>
                          <a href="deleteBook?bid=${b.bookId}">Delete</a>
                     
                     
                     </td>
                 
                 </tr>
                 
                 
                 
                 </c:forEach>                                  
           
           </tbody>
      
      
      
      </table>

</div>


</body>
</html>