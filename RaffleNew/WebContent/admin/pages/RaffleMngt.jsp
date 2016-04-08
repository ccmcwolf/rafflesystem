<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../dist/js/sb-admin-2.js"></script>

<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">
<link href="../bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Spanky's Raffle</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> New Comment <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
									class="pull-right text-muted small">12 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-envelope fa-fw"></i> Message Sent <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-tasks fa-fw"></i> New Task <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>See
								All Alerts</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-alerts --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links --> </nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Reffel management</h1>
					</div>

					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-plus"></i>&nbsp;&nbsp;&nbsp;&nbsp;New reffel
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-6">
											<form role="form">
												<div class="form-group">
													<label>Reffel campaign name</label> <input
														class="form-control" type="text">
													<p class="help-block">Add name for your raffel
														campaign.</p>
												</div>
												<div class="form-group">
													<label>Organizer name</label> <input class="form-control"
														type="text">
													<p class="help-block">Add name of campaign organizer.</p>
												</div>

												<label>Contact email</label>
												<div class="form-group input-group">
													<span class="input-group-addon">@</span> <input type="text"
														class="form-control">
												</div>

												<div class="row">
													<div class="col-lg-4">
														<label>Minimum prize limit</label>
														<div class="form-group input-group">
															<input type="text" class="form-control"> <span
																class="input-group-addon">.00</span>
														</div>
													</div>

													<div class="col-lg-4">
														<label>Maximim prize limit</label>
														<div class="form-group input-group">
															<input type="text" class="form-control"> <span
																class="input-group-addon">.00</span>
														</div>
													</div>
													<div class="col-lg-4">
														<label>Raffles count</label>
														<div class="form-group input-group">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
											</form>
										</div>

										<div class="col-lg-3">
											<form role="form">
												<div class="form-group">
													<label>Starts on</label> <input class="form-control"
														type="date">
													<p class="help-block">Starting date of campaign.</p>
												</div>
											</form>
										</div>

										<div class="col-lg-3">
											<form role="form">
												<div class="form-group">
													<label>End on</label> <input class="form-control"
														type="date">
													<p class="help-block">Ending date of campaign.</p>
												</div>
											</form>
										</div>

										<div class="col-lg-6">
											<label>Confirm</label>
											<div class="panel panel-success">
												<br> <br> <br> <br> <br> <br>
												<br>
											</div>
										</div>
										<div class="col-lg-6"
											style="border-top-color: rgb(240, 240, 240); border-top-style: solid; border-top-width: 1px; padding: 20px 20px 20px 20px;">
											<form role="form" class=" pull-right">
												<div class="form-group">
													<button type="submit" class="btn btn-success">Submit
														reffel</button>
													<button type="reset" class="btn btn-default">Reset</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<br>
					<hr>
					<br> <br>
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-pencil"></i>&nbsp;&nbsp;&nbsp;&nbsp;Edit
									reffels
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-6">
											<form role="form">
												<div class="form-group">
													<label>Available reffels</label>&nbsp;&nbsp;|&nbsp;&nbsp;<small>Select
														one for browse data.</small> <select multiple class="form-control">
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
													</select>
												</div>


												<div class="form-group">
													<label>Summery</label>
													<div class="panel panel-success">
														<br> <br> <br> <br> <br> <br>
														<br>
													</div>
												</div>
											</form>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label>Campaign</label> <input class="form-control"
													type="text">
											</div>
											<div class="form-group">
												<label>Organizer</label> <input class="form-control"
													type="text">
											</div>

											<label>Contact email</label>
											<div class="form-group input-group">
												<span class="input-group-addon">@</span> <input type="text"
													class="form-control">
											</div>

											<div class="row">
												<div class="col-lg-5">
													<label>Minimum prize limit</label>
													<div class="form-group input-group">
														<input type="text" class="form-control"> <span
															class="input-group-addon">.00</span>
													</div>
												</div>

												<div class="col-lg-5">
													<label>Maximim prize limit</label>
													<div class="form-group input-group">
														<input type="text" class="form-control"> <span
															class="input-group-addon">.00</span>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-lg-5">
													<form role="form">
														<div class="form-group">
															<label>Starts on</label> <input class="form-control"
																type="date">
														</div>
													</form>
												</div>

												<div class="col-lg-5">
													<form role="form">
														<div class="form-group">
															<label>End on</label> <input class="form-control"
																type="date">
														</div>
													</form>
												</div>
											</div>

											<div class="col-lg-12"
												style="border-top-color: rgb(240, 240, 240); border-top-style: solid; border-top-width: 1px; padding: 20px 20px 20px 20px;">
												<form role="form" class=" pull-right">
													<div class="form-group">
														<button type="submit" class="btn btn-success">Submit
															reffel</button>
														<button type="reset" class="btn btn-default">Reset</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /#page-wrapper -->


		</div>
		<!-- /#wrapper -->
</body>
</html>