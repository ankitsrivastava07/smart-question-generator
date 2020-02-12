<%@ include file="/admin/elements/header.jsp"%>

  <!-- Page Wrapper -->
  <div id="wrapper">
	<%@ include file = "/admin/elements/sidebar-menu.jsp" %>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">
	<%@ include file="/admin/elements/top-menu.jsp" %>
        <!-- Begin Page Content -->
       
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Welcome ! <%=name%></h1>
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
<%@ include file="/admin/elements/footer.jsp"%>
