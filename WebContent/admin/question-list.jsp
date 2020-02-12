<%@ include file = "/admin/elements/header.jsp" %>
<title>All Questions</title>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		
<%@ include file = "/admin/elements/sidebar-menu.jsp" %>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="/admin/elements/top-menu.jsp" %>
				<!-- End TOP -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<form action="/Question-Generation-System/question-set/list" method="Post">
						<table>
							<tr>
								<td>Filter By </td>
								<td> &nbsp;<select name="type">
										<option value="">Select Question Type</option>
										<option value="MCQ">MCQ</option>
										<option value="SUBJECTIVE">SUBJECTIVE</option>
								</select></td>
								<td><input type="submit" value="Submit"></td>
							</tr>
							</table>
					</form>
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
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									
									<tbody>
										<%
											int x = 1;
											List<QuestionDto> questionList = (List<QuestionDto>) request.getAttribute("questions");
											for (QuestionDto question : questionList) {
										%>

										<tr>
											<td><%=x++%></td>
											<td><%=question.getQuestion()%></td>
											<td><%=question.getQuestionType()%></td>
											<td><%=question.getMarks()%></td>
											<td><a
												href="/Question-Generation-System/question/edit?questionId=<%=question.getId()%>">Edit</a></td>
											<td><a data-toggle="modal" data-target="#questionDeleteModal" data-item-id="<%=question.getId()%>"
												href="#" onClick="setDeleteQuestionId(this)">Delete</a></td>
										</tr>
										<%
											}
										%>

									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

<%@ include file="/admin/elements/footer.jsp" %>
</body>

</html>