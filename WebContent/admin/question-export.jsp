<%@ include file="/admin/elements/header.jsp"%>
<title>All Questions</title>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="/admin/elements/sidebar-menu.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="/admin/elements/top-menu.jsp"%>
				<!-- End TOP -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Export Question</h1>
					<!-- DataTales Example -->
					<form action="/Question-Generation-System/question-set/create" method="post">
						<table>
							<tr>
							<td>College Name :</td>
							<td><input type="text" name="collegeName" required="required"></td>
							</tr>
							<tr>
							<td>Course :</td>
							<td><input type="text" name="course" required="required"></td>
							<td>Branch</td>
							<td><input type="text" name="branch" required="required"></td>
							</tr>
							<tr>
							<td>
							Exam Type :
							</td>
							<td><input type="text" name="examType" required="required"></td>
							<td>Year :</td>
							<td><input type="year" name="year" required="required"></td>
							</tr>
							<tr>
							<td>
							Subject Name :
							</td>
							<td><input type="text" name="subjectName" required="required"></td>
							</tr>
							<tr>
							<td>Time</td>
							<td><input type="time" name="time" required="required"></td>
							
							<td>Total Marks</td>
							<td><input type="number" name="totalMarks" required="required"></td>
							</tr>
							<tr>
							
								<td>Question Type</td>
								<td><select name="type" required="required">
										<option value="">Select Question Type</option>
										<option value="MCQ">MCQ</option>
										<option value="SUBJECTIVE">SUBJECTIVE</option>
								</select></td>
							</tr>
							<tr>
								<td>Section A Number of Questions Contain</td>
								<td><input type="number" name="noOfQuestion" required="required"></td>
							</tr>
							<tr>
								<td>Section B Number of Questions Contain</td>
								<td><input type="number" name="noOfQuestion" required="required"></td>
							</tr>
							
							<tr>
								<td>Section C Number of Questions Contain</td>
								<td><input type="number" name="noOfQuestion" required="required"></td>
							</tr>
							<tr>
								<td><input type="submit" value="Submit"></td>
							</tr>
							</table>
					</form>
					<% 
					List<QuestionDto> questionList = (List<QuestionDto>) request.getAttribute("questions");
					if(questionList!=null && !questionList.isEmpty()){
						
					%>
						<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Questions List</h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Serial No.</th>
											<th>Questions</th>
											<th>Type</th>
											<th>Marks</th>
										</tr>
									</thead>
									
									<tbody>
										<%
											int x = 1;
											
											for (QuestionDto question : questionList) {
										%>

										<tr>
											<td><%=x++%></td>
											<td><%=question.getQuestion()%></td>
											<td><%=question.getQuestionType()%></td>
											<td><%=question.getMarks() %></td>
										</tr>

										<%
											}
											}
										%>

									</tbody>
								</table>
							</div>
						</div>
						<input type="button" class="button-primary" value="Print" onclick="window.print()"/>
					</div>
						
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<%@ include file="/admin/elements/footer.jsp"%>
</body>

</html>