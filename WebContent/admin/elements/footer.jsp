  <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
<!-- Bootstrap core JavaScript-->
<script
	src="/Question-Generation-System/admin/vendor/jquery/jquery.min.js"></script>
<script
	src="/Question-Generation-System/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script
	src="/Question-Generation-System/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/Question-Generation-System/admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script
	src="/Question-Generation-System/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script
	src="/Question-Generation-System/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script
	src="/Question-Generation-System/admin/js/demo/datatables-demo.js"></script>
<script>

function setDeleteQuestionId(obj){
	var questionId=$(obj).attr("data-item-id");
	$("#deleteConfirmLink").attr("data-item-id",questionId);
}

function deleteQuestion(obj){
	var questionId=$(obj).attr("data-item-id");
	window.location.href="/Question-Generation-System/question/delete?questionId="+questionId;
}

function showOptions(obj){
	var questionType=$(obj).val();
	if(questionType=="mcq"){
		$(".options").show();
	}else{
		$(".options").hide();
	}
}

</script>
	
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="/Question-Generation-System/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Question Delete Modal-->
  <div class="modal fade" id="questionDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Delete Question</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Do you want to delete this question?</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
         <button a id="deleteConfirmLink" class="btn btn-primary" onClick="deleteQuestion(this)" data-item-id="">Delete</a> </button>
        </div>
      </div>
    </div>
  </div>
</body>

</html>