<%@ include file="/admin/elements/header.jsp"%>

<title>Add Question</title>
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
				<form action="/Question-Generation-System/question/create"
					method="Post">
					<table>
						<tr>
							<td>Question :</td>
							<td><textarea rows="6" cols ="70" name="question" placeholder="Enter Your Question here...." required 
								class="form-control form-control-user"></textarea></td>
						</tr>
						<tr>
						<td>Marks :</td>
						<td>
						<input type="number" name="marks" required>
						</td>
						
						</tr>
						
						<tr>
							<td>Question Type :</td>
							<td><select name="questiontype" onchange="showOptions(this)" required="required">
									<option value="">Select Type</option>
									<option value="mcq">MCQ</option>
									<option value="subjective">SUBJECTIVE</option></td>
						</tr>
						<tr class="options">
							<td>Options :</td>

						</tr>
						<tr class="options">
							<td>Option 1</td>
							<td><input type="option"   name="option" 
								class="form-control form-control-user" ></td>

							<td>Option 2</td>
							<td><input type="option"   name="option" 
								class="form-control form-control-user" ></td>
						</tr>
						<tr class="options">

							<td>Option 3</td>
							<td><input type="option"  name="option" 
								class="form-control form-control-user" ></td>

							<td>Option 4</td>
							<td><input type="option"  name="option" 
								class="form-control form-control-user" ></td>
						</tr>

						<!-- <tr>
							<td>Correct Option :
							<td>
							<td><input type="radio" name="correct_option"
								value="option 1">Option 1</td>

							<td><input type="radio" name="correct_option"
								value="option 2">Option 2</td>


							<td><input type="radio" name="correct_option"
								value="option 3">Option 3</td>

							<td><input type="radio" name="correct_option"
								value="option ">Option 3</td>
						</tr> -->

						<tr>
							<td>
								<button class="btn btn-primary btn-user btn-block">
									<span>Submit</span>
								</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- /.container-fluid -->
		<!-- End of Main Content -->
		<%@ include file="/admin/elements/footer.jsp"%>