<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="question.dto.QuestionDto"%>
<%@page import="question.constants.QuestionType"%>
<%@page import="question.dto.QuestionOption"%>
<%@ include file="/admin/elements/header.jsp"%>

<!-- Page Wrapper -->
<div id="wrapper">
	<%@ include file="/admin/elements/sidebar-menu.jsp"%>
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
		<!-- Main Content -->
		<div id="content">
			<%@ include file="/admin/elements/top-menu.jsp"%>
			<!-- Begin Page Content -->
			<div class="container-fluid">
				<%
					long questionId = Long.parseLong((request.getParameter("questionId")));
					QuestionDto questionDto = (QuestionDto) request.getAttribute("question");
				%>

				<form action="/Question-Generation-System/question/edit"
					method="Post">

					<table>
						<tr>

							<td><input type="hidden" name="questionId"
								value="<%=questionId%>"></td>

						</tr>
						<tr>

							<td>New Question :</td>
							<td><textarea rows="6" cols="70" name="newQuestion" 
									placeholder="Enter your Question here..."  required="required"><%=questionDto.getQuestion()%></textarea></td>
									
						</tr>
                        <tr>
                        <td>
                        Marks :
                        </td>
                        <td>
                        <input type="number" name="marks" required value="<%=questionDto.getMarks()%>" required="required">
                        </td>
                        </tr>
						<tr>
							<td>Question Type :</td>
							<td><select name="questiontype" onchange="showOptions(this)" required="required">
									<option>Select Type</option>
									<option value="mcq"
										<%if (questionDto.getQuestionType() == QuestionType.MCQ)
				out.println("selected");%>>MCQ</option>
									<option value="subjective" 
										<%
											if (questionDto.getQuestionType() == QuestionType.SUBJECTIVE)
												out.println("selected");%>>SUBJECTIVE
									</option></td>
						</tr>
						<%
							List<QuestionOption> options = questionDto.getOptions();
						
							int counter = 1;
							if(!options.isEmpty()){
							for (QuestionOption questionOption : options) {
						%>
						
						<tr class="options">

							<td>Option <%=counter++%></td>
							<td><input type="text" name="option" class="form-control form-control-user"
								value="<%=questionOption.getOption()%>" ></td>
						</tr>
						<%
						}
						}
						%>
						<tr>
							<td><input type="submit" class="btn btn-primary btn-user btn-block" value="Update" class="form-control form-control-user"></td>
							<td></td>
						</tr>
					</table>
			</div>
		</div>
		<!-- /.container-fluid -->
		<!-- End of Main Content -->
		<%@ include file="/admin/elements/footer.jsp"%>