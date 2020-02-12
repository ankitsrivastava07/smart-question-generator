<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="elements/header.jsp"></jsp:include>
	<%
		String name = session.getAttribute("name") != null ? session.getAttribute("name").toString() : null;
		out.println("Welcome " + name);
	%>
<button><a href="/Question-Generation-System/logout">LogOut</a></button>
<button><a href="/Question-Generation-System/question/create-question.jsp">Add Question</a></button>
<button><a href="/Question-Generation-System/question/delete-question.jsp">Delete All Questions</a></button>
<button><a href="/Question-Generation-System/question/list">Show Questions</a></button>


<jsp:include page="elements/footer.jsp"></jsp:include>