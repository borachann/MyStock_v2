<%@page import="java.math.MathContext"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kosign.wecafe.forms.Cart"%>
<%@page import="com.kosign.wecafe.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link rel="shortcut icon" href="images/favicon_1.ico">

<title>Stock Management</title>

<!-- Base Css Files --> 
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Font Icons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css"
	rel="stylesheet">

<!-- animate css -->
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	rel="stylesheet" />

<!-- Waves-effect -->
<link
	href="${pageContext.request.contextPath}/resources/css/waves-effect.css"
	rel="stylesheet">

<!-- sweet alerts -->
<link
	href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css"
	rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->


<script src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/numeral.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
.panel-body:hover {
	cursor: pointer;
}
.panel-body img {
	width: 80px;
	height: 100px;
}
#addtocart {
	width: 80%;
}
.modal-content {
	border-radius: 0;
}
.hidebtn {
	display: none;
}
.borderRed {
	border-color: red;
}
 @media print {
  @page { margin: 0; }
  body { margin: 1cm; }
}  
#myCarousel1{
    		interval: false;
	};
#tblprint{
	border-collapse: collapse;
}
#tblprint td{
	border: 1px solid black;
}
</style>

</head>
<body>

	<div id="wrapper" class="hidden-print">


		<!-- Top Bar Start -->
		<%@ include file="topbar.jsp"%>
		<!-- Top Bar End -->
		<div>
			<button id="btnSendMessage">SEND MESSAGE</button>
			<input type="text" id="txtMessage" /> 
			<div style="width: 50%; float: left; margin-left: 3%;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img/user.png"
					width="35px" height="35px"> <label class="control-label"
					id="cusname" style="color: blue; margin-right: 1%;">
					${user.username} </label>
				<button type="button" id="btnSignout" class="btn btn-warning">Sign
					Out</button>
			</div>
			<div align="right">

				<div style="float: right; margin-left: 10px;">
					<img
						src="${pageContext.request.contextPath}/resources/images/img/add_to_cart.jpg"
						width="55px" height="34px">
					<!-- <button type="button" id="btnCart" class="btn btn-primary">
						<span id="totalproduce" class="badge">0 </span> product
					</button> -->
				</div>
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/images/img/order.png"
						width="55px" height="34px">
					<button type="button" class="btn btn-primary">
						<span class="badge">0 </span> Order
					</button>
				</div>
			</div>
		</div>

		<div id="myCarousel1" class="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 888px;">
				<%
					List<Product> products = (List<Product>) request.getAttribute("products");
				//out.println("products" + products);
					int A = products.size();
					int i;
					boolean T = true;
					do {
						if (T) {
							T = false;
				%>
				<div class="item active" style="width: 70%; margin: 0 auto;">
					<%
						} else {
					%>
					<div class="item" style="width: 70%; margin: 0 auto;">
						<%
							}
						%>
						<div style="margin-top: 17%">
							<%
								for (i = A - 1; i >= A - 6 && i >= 0; i--) {
							%><div class="col-sm-6">
								<div class="panel panel-default form-group">
									<div class="panel-body" data-id="<%=products.get(i).getProductId()%>">
										<div style="float: left;">
											<div id="idpro" style="display: none;"><%=products.get(i).getProductId()%></div>
											<div style="width: 300px;">
											<span class='col-md-8'>
												<img id="imgpro"
													src="${pageContext.request.contextPath}/resources/images/products/<%=products.get(i).getImage()%>">
												<span id="Proname"> <%=products.get(i).getProductName()%></span>
											</span>
												<span class='col-md-4 pull-right'><select class='form-control' style='margin-top: 35px;' id='saleType' data-uQty="<%=products.get(i).getUnit().getQty()%>">
										 	<option value="<%=products.get(i).getSalePrice()%>" data-unitQty="<%=products.get(i).getUnit().getQty()%>"><%=products.get(i).getUnit().getUnitName()%></option>
										 	<%-- <option value="<%=products.get(i).getCostPrice()%>" data-unitQty="1"><%=products.get(i).getUnit().getTo()%></option> --%>
										 	<%
											 	boolean existOption = true;
										 		List<Cart> cartsPrice = (List<Cart>) request.getAttribute("carts"); 
										 		for (Cart cart : cartsPrice) {
										 			if (cart.getProductId().compareTo(products.get(i).getProductId()) == 0) {
										 				if(cart.getPrice().equals(products.get(i).getCostPrice())){
										 					existOption = false;
										 	%>				<option selected value="<%=products.get(i).getCostPrice()%>" data-unitQty="1"><%=products.get(i).getUnit().getTo()%></option>
										 				<%}%>
										 			<%}%>
										 	<%	}%>
										 	<%if((cartsPrice.size() < 1) || existOption) {%>
										 		<option value="<%=products.get(i).getCostPrice()%>" data-unitQty="1"><%=products.get(i).getUnit().getTo()%></option>
										 	<%} %>	
										<%--  <%
										 		boolean existOption = true;
										 		List<Cart> cartsPrice = (List<Cart>) request.getAttribute("carts");
										 	for (Cart cart : cartsPrice) { 
												if (cart.getProductId().equals(products.get(i).getProductId())) {existOption = false;
													if(cart.getPrice().equals(products.get(i).getCostPrice())){%>
										 				<option selected value="<%=products.get(i).getCostPrice()%>" data-unitQty="1"><%=products.get(i).getUnit().getTo()%></option>
										 		<%}else{ %>
										 				<option value="<%=products.get(i).getCostPrice()%>" data-unitQty="1"><%=products.get(i).getUnit().getTo()%></option>
										 		<%} 
												}else{%>
													<option value="<%=products.get(i).getCostPrice()%>" data-unitQty="1"><%=products.get(i).getUnit().getTo()%></option>
											<% }
											}%>
											<% if(existOption){%>
												<option value="<%=products.get(i).getCostPrice()%>" data-unitQty="1"><%=products.get(i).getUnit().getTo()%></option>
											<% existOption = false;} %> --%>
										 	</select></span>
											</div>

											<input type="text" class="form-control"
												value="<%=products.get(i).getProductId()%>" id="pro_id"
												style="display: none;"> <input type="text"
												class="form-control"
												value="<%=products.get(i).getProductName()%>" id="pro_nm"
												style="display: none;">
										</div>
										<div style="text-align: right;">
											<%	boolean exitsprice = true;
												for(Cart cart : cartsPrice) {
													if (cart.getProductId().equals(products.get(i).getProductId())) { exitsprice = false;%>
														<span id="PRICE"><%=cart.getPrice()%></span><span>&nbsp;$</span>
													<%}%>
											<%} if(exitsprice){%>
												<span id="PRICE"><%=products.get(i).getSalePrice()%></span><span>&nbsp;$</span>
												<%} %>
											<div>
												<br> <a href="#"> <span id="btnminus" class="glyphicon glyphicon-minus"></span> </a>
												<%
													List<Cart> carts = (List<Cart>) request.getAttribute("carts");
															boolean exist = false;
															for (Cart cart : carts) {
																if (cart.getProductId().equals(products.get(i).getProductId())) {
																	exist = true;
												%>
												<input name="orderqty" id='txtqty' type="text"
													readonly="readonly" style="width: 10%; text-align: center;"
													value="<%=cart.getQuantity()%>">
													
												<%
													}
															}
															if (!exist) {
												%>
												<input id='txtqty' name="orderqty" type="text"
													readonly="readonly" style="width: 10%; text-align: center;"
													value="<%=0%>">
												<%
													}
												%>

												<a href="#"> <span id="btnplus" class="glyphicon glyphicon-plus"></span>
												</a>
											</div>
											<br>	<%=products.get(i).getQuantity().divide(products.get(i).getUnit().getQty())%> 
											 		<%=products.get(i).getUnit().getUnitName()%>, 
											 		<%=products.get(i).getQuantity().remainder(products.get(i).getUnit().getQty(),new MathContext(2))%> 
											  		<%=products.get(i).getUnit().getTo()%> 
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>

					<%
						if (A / 6 >= 1) {
								A = A - 6;
							} else
								A = 0;
						} while (A >= 1);
					%>
				</div>
				<!-- Left and right controls -->

		
				<a class="left carousel-control" href="#myCarousel1" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel1" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>




		<!-- ############################################################# -->
		<!-- Modal HTML -->
		<div id="myModal" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" aria-hidden="true">
							<span class="button b-close"><span>×</span></span>
						</button>
						<h4 class="modal-title" id="productNm">Coca Cola</h4>
					</div>
					<div class="modal-body form-horizontal" style="height: 290px;">
						<div class="row">
							<div class="col-sm-4">
								<img
									src="${pageContext.request.contextPath}/resources/images/products/drink.jpg"
									style="height: 250px;" id="imgProduct">
							</div>
							<div class="col-sm-8">
								<div class="form-group">
									<label class="control-label col-sm-3">Price :</label>
									<div class="col-sm-9">
										<label class="control-label col-sm-3"  id="productprice">0.5$</label>
										<input type="text" class="form-control" maxlength="30" style="display: none;" id="txtproductprice">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3" for="txtName">Qty :</label>
									<div class="col-sm-9">
										<div class="row">
											<span class="col-sm-5">
												<input type="text" class="form-control" maxlength="30" name="txtName" id="qtytxt">
											</span>
											<span class="col-sm-7">
												<select class="form-control" id="editSaleType"></select>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3" id="comment"
										for="txtcomment">Comment :</label>
									<div class="col-sm-9">
										<textarea id="procomment" rows="4" class="form-control"
											style="resize: none;"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="height: 80px;overflow: auto;">
						<button type="button" class="btn btn-default" id="btnUpdate">
							<span class="button b-close"><span>Update</span></span>
							<!-- 							<span style="display:none;" class='btnhidden' id='orderID'></span> -->
						</button>
						<button type="button" class="btn btn-primary" id="cancelbtn">
							<span class="button b-close"><span>Cancel</span></span>
						</button>
					</div>
				</div>
			</div>
		</div>


		<!-- ############################################################# -->

		<div id="addtocart" style="display: none;" class="hidden-print" style="width: 80%;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true" id="closepopup">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">មុខ ទំនិញ</h4>

				</div>
				<div class="modal-body" style="overflow: auto;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ឈ្មោះ</th>
								<th>តំលៃ</th>
								<th>ចំនួន</th>
								<th>សរុប</th>
								<th>ផ្សេងទៀត</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="orderdetail">

						</tbody>
					</table>
<hr>
					<div class="form-horizontal">
						<div>
							<label class="control-label col-md-2" >លក់ជូន :</label>
							<div class="col-md-3">
								<input type="text" class="form-control" maxlength="30"  id="tocusname"
									style="margin-bottom: 2px;">
							</div>
							<label class="control-label col-md-2" >ប្រាក់សរុប $ :</label>
							<div class="col-md-2">
								<input type="text" class="form-control" maxlength="30"
									readonly="readonly"  id="totalamount"
									style="margin-bottom: 2px;">
							</div>
							<label class="control-label col-md-1" >ដុល្លា :</label>
							<div class="col-md-2">
								<input type="text" class="form-control" maxlength="30"  id="txtpay" value="0"
									style="margin-bottom: 2px;">
							</div>
						</div>
						<div>
							<label class="control-label col-md-2" >អាស័យ​ដ្ឋាន :</label>
							<div class="col-md-3">
								<input type="text" class="form-control" id="cusaddr"
									style="margin-bottom: 2px;">
							</div>
							<label class="control-label col-md-2">ប្រាក់សរុប ៛ :</label>
							<div class="col-md-2">
								<input type="text" class="form-control" maxlength="30" 
									readonly="readonly" name="txtName" id="totalreil"
									style="margin-bottom: 2px;">
							</div>
							<label class="control-label col-md-1">រៀល :</label>
							<div class="col-md-2">
								<input type="text" class="form-control" maxlength="30" id="txtpayreil" value="0"
									style="margin-bottom: 2px;" readonly="readonly">
							</div>
						</div>
						<div>
							<label class="control-label col-md-2" >ទូរស័ព្ទ :</label>
							<div class="col-md-3">
								<input type="text" class="form-control" id="cusphone"
									style="margin-bottom: 2px;">
							</div>
							<label class="control-label col-md-2">អត្រាប្រាក់ :</label>
							<div class="col-md-2">
								<input type="text" class="form-control" maxlength="30"
									readonly="readonly"  id="exchangerate"
									style="margin-bottom: 2px;">
							</div>
							<label class="control-label col-md-1">អាប់ ៛ :</label>
							<div class="col-md-2">
								<input type="text" class="form-control" maxlength="30" value="0"
									readonly="readonly"  id="txtchange"
									style="margin-bottom: 2px;">
							</div>
						</div>
						<div>
							<label class="control-label col-md-2" >ថ្ងៃខែឆ្នាំ :</label>
							<div class="col-md-3">
								<input type="text" class="form-control" id="cusdate" readonly="readonly"
									style="margin-bottom: 2px;">
							</div>
							<label class="control-label col-md-2"></label>
							<div class="col-md-2">
							</div>
							<label class="control-label col-md-1">អាប់ $ : </label>
							<div class="col-md-2">
								<input type="text" class="form-control" maxlength="30" value="0"
									readonly="readonly"  id="txtchangedollar"
									style="margin-bottom: 2px;">
							</div>
						</div>
					
					</div>
				</div>
				<div class="modal-footer" style="height: 80px; overflow: auto;">
					<div align="right">
						<button type="button" id="btnbuymore" class="btn btn-default">
							<span class="button b-close"><span>បន្ថៃមទំនិញ</span></span>
						</button>
						<button type="button" id="btnconfirm"
							class="btn btn-default hidebtn b-close">
							<span class="button b-close"><span>យល់ព្រម</span></span>
						</button>
						<button type="button" id="btnconfirmorder"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Confirm</span></span>
						</button>
						<button type="button" id="btncancel"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>លុបចោល</span></span>
						</button>
						<button type="button" id="btncancelorder"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Cancel Order</span></span>
						</button>
					</div>
				</div>
			</div>
		</div>
		
<!-- Modal -->
<!-- <div class="modal fade" id="form_request_stock" role="dialog " >
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Form Request</h4>
			</div>
			<div class="modal-body">
				<div class=" form">					
						<form class="cmxform form-horizontal tasi-form" id="signupForm"
							method="get" action="#" novalidate="novalidate">
							<div class="form-group ui-widget">
								<label for="product_name" class="control-label col-lg-2">Product
									Name *</label>
								<div class="col-lg-10">
									<input class=" form-control" required="required"
										id="product_name" name="product_name" type="text"> 
										<input class="hidebtn" id="product_id">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">Request Qty
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="product_qty"
										name="product_qty" type="text">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">In Stock
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="remain_qty"
										name="remain_qty" type="text">
								</div>
							</div>
							<div class="form-group" align="right">
								<button class="btn btn-success waves-effect waves-light"
									style="width: 100px;" id="btn_add" type="button">Add</button>
								<button class="btn btn-default waves-effect waves-light"
									style="width: 100px; margin-right: 10px;" id="btn_cancel_add"
									type="button">Cancel</button>
							</div>
						</form>
						===================
						<h5 class="pull-left page-title"># Product List</h5>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<table id="datatable"
									class="table table-striped table-bordered dataTable">
									<thead>
									</thead>
									<thead>
										<tr>
											<th>#</th>
											<th>Product Name</th>
											<th style="text-align: center;">Request Qty</th>
											<th style="text-align: center;">In Stock</th>
											<th style="text-align: center;">Edit</th>
										</tr>
									</thead>
									<tbody id="tbllistimport">
									</tbody>
								</table>
							</div>
						</div>
						===================
						<div class="form-group" align="right">
							<button class="btn btn-success waves-effect waves-light"
								style="width: 100px;" id="btn_save" type="button">Save</button>
							<button class="btn btn-default waves-effect"
								style="width: 100px; margin-right: 10px;" id="btn_cancel_save"
								type="button">Cancel</button>
						</div>
					</div>
					.form
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> -->



		<div id="form_request_stock1"
			style="display: none; width: 80%; height: auto;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Form Request Products</h4>

				</div>
				<div class="modal-body" style="height: auto;">
					<div class=" form">					
						<form class="cmxform form-horizontal tasi-form" id="signupForm"
							method="get" action="#" novalidate="novalidate">
							<div class="form-group ui-widget">
								<label for="product_name" class="control-label col-lg-2">Product
									Name *</label>
								<div class="col-lg-10">
									<input class=" form-control" required="required"
										id="product_name" name="product_name" type="text"> 
										<input class="hidebtn" id="product_id">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">Request Qty
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="product_qty"
										name="product_qty" type="text">
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">In Stock
									*</label>
								<div class="col-lg-10">
									<input class="form-control " required="required" id="remain_qty"
										name="remain_qty" type="text">
								</div>
							</div>

							<div class="form-group" align="right">

								<button class="btn btn-success waves-effect waves-light"
									style="width: 100px;" id="btn_add" type="button">Add</button>
								<button class="btn btn-default waves-effect waves-light"
									style="width: 100px; margin-right: 10px;" id="btn_cancel_add"
									type="button">Cancel</button>
							</div>
						</form>
						<!-- =================== -->
						<h5 class="pull-left page-title"># Product List</h5>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<table id="datatable"
									class="table table-striped table-bordered dataTable">
									<thead>

									</thead>
									<thead>
										<tr>
											<th>#</th>
											<th>Product Name</th>
											<th style="text-align: center;">Request Qty</th>
											<th style="text-align: center;">In Stock</th>
											<th style="text-align: center;">Edit</th>
										</tr>
									</thead>
									<tbody id="tbllistimport">

									</tbody>
								</table>
							</div>
						</div>

						<!-- =================== -->
						<div class="form-group" align="right">
							<button class="btn btn-success waves-effect waves-light"
								style="width: 100px;" id="btn_save" type="button">Save</button>
							<button class="btn btn-default waves-effect"
								style="width: 100px; margin-right: 10px;" id="btn_cancel_save"
								type="button">Cancel</button>
						</div>

					</div>
					<!-- .form -->
				</div>

			</div>
		</div>


	<span class="hidden-print">	<%@ include file="footer.jsp"%></span>
		<%@ include file="owedPaymentAdd.jsp"%>
		<!-- ======================================================================================= -->
	</div>
	<script>
		var resizefunc = [];
	</script>

	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/chat/moment-2.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>

	<!-- sweet alerts -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.init.js"></script>

	<!-- flot Chart -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.selection.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.crosshair.js"></script>

	<!-- Counter-up -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/counterup/waypoints.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>

	<!-- CUSTOM JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dashboard.js"></script>

	<!-- Chat -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.chat.js"></script>

	<!-- Todo -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.todo.js"></script>

	<!-- bpopup -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
		
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.ui.autocomplete.scroll.min.js"></script>
<!-- Request Stock -->
<script type="text/javascript">
	/* ==============================================
	Counter Up
	=============================================== */
	jQuery(document).ready(function($) {
		$(function() {
		    $('.carousel').each(function(){
		        $(this).carousel({
		            interval: false
		        });
		    });
		});
						var _thisRow;
						
						//Check qty for input only number
						
						$("#product_qty,#remain_qty").keypress(function(e){
							checkOnlyNumber(e);
						});
						
						//Click button save cancel
						/* $("#btn_cancel_save").click(function() {
							if (confirm("Do you want to cancel?")) {
								$("#tbllistimport tr").remove();
								//$("#form_request_stock").bPopup().close();
							}
						}); */
						
						//Click cancel add to list
						$("#btn_cancel_add").click(function() {
							clear();
							$("#btn_update").html("Add");
							$("#btn_update").attr("id", "btn_add");
						});
						
						$("#txtpay").on("blur",function(){
							var paid = 0, paidreil = 0;
							
							if($(this).val() != ""){
								paid = ($("#totalamount").val() - $(this).val()).toFixed(2)
								if(paid <= 0){									
									paidreil = (paid * $("#exchangerate").val()).toFixed(0);
									$("#txtpayreil").val('0');
									$("#txtchange").val(numeral(Math.abs(paidreil)).format('0,0'));
									$("#txtchangedollar").val(Math.abs(paid));
								}
								else{
									paidreil = (paid * $("#exchangerate").val()).toFixed(0);
									$("#txtpayreil").val(numeral(paidreil).format('0,0'));
									$("#txtchange").val('0');
									$("#txtchangedollar").val('0');
								}
							}
						});
						$("#txtpayreil").on("dblclick",function(){
							$(this).removeAttr('readonly');
						});
						$("#txtpayreil").on("blur",function(){
							var paid = 0;
							var total = 0;
							$(this).removeAttr('readonly');
							paid = ($("#txtpay").val() != "") ? $("#txtpay").val() : 0;
							
							total = (paid * parseInt($("#exchangerate").val())) + parseInt($(this).val());
							totalreil = (parseInt($("#totalreil").val().replace(',', '')));
							if(total > totalreil){
								$("#txtchange").val(numeral(total - totalreil).format('0,0'));
								$("#txtchangedollar").val((total - totalreil)/parseInt($("#exchangerate").val()));
							}else
							{
								$("#txtchange").val('0');
								("#txtchangedollar").val('0');
							}
								
						});
						//Click request stock
						/* $("#btn_request_stock").click(function() {
							searchProduct();
							$('#form_request_stock').modal({
								"backdrop":"static"
							});
							//$("#form_request_stock").bPopup();
						}); */
						$("#btnSearch").click(function(e){
							e.preventDefault(); 
							
							/* if ($("#txtMessage").val() != "")
								url = "${pageContext.request.contextPath}/seller/searchbyname/" + $("#txtMessage").val();
							else
								url = "${pageContext.request.contextPath}/seller/searchbyname/"; */
							
							var url = "${pageContext.request.contextPath}/seller/searchbyname/" + $("#txtMessage").val()
															
							$.ajax({
								url :  url,
								type : 'POST',
								datatype : 'JSON', 
								beforeSend : function(xhr) {
									xhr.setRequestHeader("Accept", "application/json");
									xhr.setRequestHeader("Content-Type", "application/json");
								},
								success : function(data) {
									console.log(data);
									 $("#myCarousel1").html(''); 
									if(data.searchpro.length != 0){
										 var str = "", b = true, A = data.searchpro.length;
										 
									do{
										if (b){
											str += "<div class='carousel-inner' role='listbox' style='height: 888px;'>";
											str += "<div class='item active' style='width: 70%; margin: 0 auto;'>";
											b =false
										}else{
											str += "<div class='item' style='width: 70%; margin: 0 auto;'>";
										}
										 	str += "<div style='margin-top: 17%'>";
										 	
										// alert(	data[0].searchpro.productId);	
										/* var carts = [], count = 0;  */	 
									 	
										for (i = A - 1; i >= A - 6 && i >= 0; i--) {
											
										 	str += "<div class='col-sm-6'>";
										 	str += "<div class='panel panel-default form-group'>";
										 	str += "<div class='panel-body' data-id='"+ data.searchpro[i].productId +"'>";
										 	str += "<div style='float: left;'>"
										 	str += "<div id='idpro' style='display: none;'>" + data.searchpro[i].productId + "</div>";
										 	str += "<div style='width: 300px;'><span class='col-md-8'> <img id='imgpro' src='${pageContext.request.contextPath}/resources/images/products/"+  data.searchpro[i].image + "'/>";
										 	str += "<span id='Proname'> " + data.searchpro[i].productName + "</span></span>";
										 	str += "<span class='col-md-4 pull-right'><select class='form-control' style='margin-top: 33px;' id='saleType' data-uQty='"+ data.searchpro[i].unit.qty +"'>";
										 	str += "<option value='"+ data.searchpro[i].salePrice +"'data-unitQty='"+ data.searchpro[i].unit.qty + "'>" + data.searchpro[i].unit.unitName + "</option>";
										 	var existOption = true;
										 	for(var j = 0; j < data.carts.length; j++) {
										 		if (data.carts[j].productId == data.searchpro[i].productId) {
										 			if (data.carts[j].price == data.searchpro[i].costPrice) {
										 				existOption = false;
										 				str += "<option selected value='"+ data.searchpro[i].costPrice.toFixed(2) +"'data-unitQty='1'>" + data.searchpro[i].unit.to + "</option>";
										 			}
										 		}
										 	}
										 	if(data.carts.length <1 || existOption)
										 		str += "<option value='"+ data.searchpro[i].costPrice.toFixed(2) +"'data-unitQty='1'>" + data.searchpro[i].unit.to + "</option>";
										 	str += "</select></span></div>";
										 	str += "<input type='text' class='form-control' value='" + data.searchpro[i].productId + "'";
										 	str += " id='pro_id' style='display: none;'>";
										 	str += "<input type='text' class='form-control' value='" +data.searchpro[i].productName + "'";
										 	str += " id='pro_nm' + style='display: none;'></div>";
										 	str += "<div style='text-align: right;'>";
										 	var existPrice = false;
										 	for(var j = 0; j < data.carts.length; j++) {
										 		if (data.carts[j].productId == data.searchpro[i].productId) {
										 			existPrice = true;
										 			str += "<span id='PRICE'>"+ data.carts[j].price.toFixed(2) + "</span><span>&nbsp; $</span>";
										 		}
										 	}
										 	if (!existPrice) {
										 		str += "<span id='PRICE'>"+ data.searchpro[i].salePrice.toFixed(2) + "</span><span>&nbsp; $</span>";
										 	}
										 	str += "<div><br><a href='#'><span id='btnminus' class='glyphicon glyphicon-minus'> </span></a> "; 
										 	
											var exist = false;  
										 	for(var j = 0; j < data.carts.length; j++) {
										 		
										 		if (data.carts[j].productId == data.searchpro[i].productId) {
										 			exist = true;
										 			str += "<input name='orderqty' id='txtqty' type='text' readonly='readonly' style='width: 10%; text-align: center;' value='" + data.carts[j].quantity + "'>";
										 		}
										 	}
										 	
										 	if (!exist) {
												str += " <input id='txtqty' name='orderqty' type='text' readonly='readonly' style='width: 10%; text-align: center;' value='0'>";													
											} 
											
											str += "<a href='#'> <span id='btnplus' class='glyphicon glyphicon-plus'></span></a></div>";
											str += "<br>" +Math.floor(data.searchpro[i].quantity/data.searchpro[i].unit.qty) + " " + data.searchpro[i].unit.unitName; 
										 	str += ", " + data.searchpro[i].quantity%data.searchpro[i].unit.qty + " " + data.searchpro[i].unit.to;
											str += "</div></div></div></div>";										
										}  
										str += "</div></div>";
										if (A / 6 >= 1) {
											A = A - 6;
										} else
											A = 0;
										} while (A >= 1);
										str += "</div>";
										str += "<a class='left carousel-control' href='#myCarousel1' role='button' data-slide='prev'>";
									 	str += "<span class='glyphicon glyphicon-chevron-left'></span>";
									 	str += "<span class='sr-only'>Previous</span></a>";
									 	str += "<a class='right carousel-control' href='#myCarousel1' role='button' data-slide='next'>";
									 	str += "<span class='glyphicon glyphicon-chevron-right'></span>";
									 	str += "<span class='sr-only'>Next</span></a></div>";
									 }
									 $("#myCarousel1").html(str);
								},
								error : function(data, status, er) {
									console.log("error: " + data + "status: " + status + "er: ");
								} 
							});
							 
						});
						$(document).on("blur", "#product_name ,#product_qty,#remain_qty",
								function() {
									if ($(this).val() == "") {
										$(this).addClass("borderRed");
										return;
									} else
										$(this).removeClass("borderRed");
						});
						// change price of produce when change type of sale paroduce
						$(document).on("change", "#saleType", function(){
							var cost_price = $(this).find(":selected").val();
							
							var uQty = $(this).find(":selected").data('unitqty');
							
							$(this).parents(".panel-body").find("#PRICE").text(cost_price);
							$(this).data("uqty",uQty);
							
							
							if($(this).parents(".panel-body").find("#txtqty").val() == 0)
								return;
							
							var proId = $(this).parents(".panel-body").find("#pro_id").val();
							var price = $(this).parents(".panel-body").find("#PRICE").html();
							var saletype = $(this).parents(".panel-body").find("#saleType").find(":selected").text();
							json = {
								    "productId": proId,
								    "price": price,
								    "saleType": saletype,
								    "unitqty" : uQty
								};
							
							console.log(json);
							$.ajax({
							    url: "${pageContext.request.contextPath}/seller/changeCate",
							    type: 'POST',
							    datatype: 'JSON',
							    data: JSON.stringify(json),
							    beforeSend: function(xhr) {
							        xhr.setRequestHeader("Accept", "application/json");
							        xhr.setRequestHeader("Content-Type", "application/json");
							    },
							    success: function(data) {
							     /*   getsizeSession();
							        for (i = 0; i < data.length; i++) {
							            if (data[i].productId == proId) {
							                _this.parents(".panel-body").find("#txtqty").val(data[i].quantity);
							                break;
							            }
							        }*/
							    },
							    error: function(data, status, er) {
							        console.log("error: " + data + "status: " + status + "er: ");
							    }
							});
							
						});
						
						$(document).on("click", "#btn_add", function() {
											if ($("#product_name").val() == "") {
												$("#product_name").addClass("borderRed");
												return;
											} else
												$("#product_name").removeClass("borderRed");
											if ($("#product_qty").val() == "") {
												$("#product_qty").addClass("borderRed");
												return;
											} else
												$("#product_qty").removeClass("borderRed");
											if ($("#remain_qty").val() == "") {
												$("#remain_qty").addClass("borderRed");
												return;
											} else
												$("#remain_qty").removeClass("borderRed");
											
											var isAdded=false;
											
											$('#tbllistimport tr').each(function() {
												var pro_name=$(this).find("td").eq(3).html()
													if($("#product_name").val()==pro_name){
														alert("Product is already added");
														isAdded=true ;
													}
											});
											
											if(isAdded==false){
											var st = "";
											st += "<tr><td style='display: none;'>"
													+ $('#product_id').val()
													+ "</td>";
											st += "<td style='display: none;'>"
													+ $('#supID').val()
													+ "</td>";
											st += "<td>"
													+ ($("#tbllistimport tr").length + 1)
													+ "</td>";
											st += "<td>"
													+ $("#product_name").val()
													+ "</td>";
											st += "<td>" + $("#product_qty").val()
													+ "</td>";
											st += "<td>" + $("#remain_qty").val()
													+ "</td>";
											st += "<td><a href= 'javascript:;' id='btn_edit'>Edit</a> | <a href='javascript:;' id='btn_delete'>Delete</a></td></tr>";
											$("#tbllistimport").append(st);
											clear();
											}
										});
						$('.counter').counterUp({
							delay : 100,
							time : 1200
						});
						/* $("#btn_save").click(function() {
											var requestDetail = [];
											if ($('#tbllistimport tr').length == 0) {
												alert("There is no data was added");
												return;
											}
							$('#tbllistimport tr').each(function() {
								json = { 
									"proId" : ($(this).find("td").eq(0).html()),
									"proQty" : ($(this).find("td").eq(4).html()),
									"remainQty" : ($(this).find("td").eq(5).html()) 
								};
								console.log(json);
								requestDetail.push(json);
							}); 
							$.ajax({
											url : "${pageContext.request.contextPath}/seller/request_product",
											type : 'POST',
											datatype : 'JSON',
											data : JSON.stringify(requestDetail),
											beforeSend : function(xhr) {
												xhr.setRequestHeader("Accept", "application/json");
												xhr.setRequestHeader("Content-Type", "application/json");
											},
											success : function(data) {
												alert("Successfully requested");
												$('#form_request_stock').modal('hide');
												clear();
												$("#tbllistimport tr").remove();
												//location.href = "${pageContext.request.contextPath}/admin/importlist";
											},
											error : function(data, status, er) {
												console.log("error: " + data + "status: " + status + "er: ");
											}
										});
									}); */
						function clear() {
							$("#product_name").val("");
							$("#product_name").removeClass("borderRed");
							$('#product_id').val("");
							$("#product_qty").val("");
							$("#product_qty").removeClass("borderRed");
							$("#remain_qty").val("");
							$("#remain_qty").removeClass("borderRed"); 
						} 
						/* function searchProduct() {
							$.ajax({	url : "${pageContext.request.contextPath}/seller/searchproduct",
										type : 'POST',
										dataType : 'JSON',
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept", "application/json");
											xhr.setRequestHeader("Content-Type", "application/json");
										},
										success : function(data) {
											console.log(data);  
											var availableTags = [];
											for (i = 0; i < data.length; i++) {
												availableTags[i] = {
													"label" : data[i].productName,
													"dataid" : data[i].productId
												};
											}
										$("#product_name").autocomplete({select : function(event, ui) {
										$("#product_id").val(ui.item.dataid);},
											//maxShowItems : 8,
											source : availableTags
										});  $(".ui-autocomplete").css("position", "absolute");
										$(".ui-autocomplete").css("z-index", "2147483647");
										}, 
										error : function(data, status, er) {
											console.log("error: " + data + " status: " + status + " er:" + er);
										}
									}); 
						} */
						
						//Edit list
						$(document).on("click", "#btn_edit", function() { 
									_thisRow = $(this).parents("tr"); 
									$("#product_name").val($(this).parents("tr").children().eq(3).html());
									$("#product_qty").val($(this).parents("tr").children().eq(4).html());	
									$("#remain_qty").val($(this).parents("tr").children().eq(5).html());	
									$("#btn_add").html("Update");
									$("#btn_add").attr("id", "btn_update");
								});
						$(document).on("click", "#btn_update", function() {
									_thisRow.children().eq(0).html(
											$("#product_id").val());
									
									_thisRow.children().eq(3).html(
											$("#product_name").val());
									_thisRow.children().eq(4).html(
											$("#product_qty").val());	
									_thisRow.children().eq(5).html(
											$("#remain_qty").val());	
									$("#btn_update").html("Add");
									$("#btn_update").attr("id", "btn_add");
									
									clear();
								});
						
						//Click delete from list
						$(document).on("click", "#btn_delete", function() {
							$(this).parents("tr").remove();
						});
					});
	
	
	function checkOnlyNumber(e){
		if ((e.keyCode == 8)
				|| (e.keyCode == 46)
				|| ((e.keyCode >= 37) && (e.keyCode <= 40)))
			return;
		var data = String
				.fromCharCode(e.which);
		var reg = new RegExp('^[0-9]+$');
		if (!reg.test(data)) {
			e.preventDefault();
		}
	}
	
</script> 
<script type="text/javascript">
	var _orderid = 0;
	var _productid = 0;
	var _qty = 0;
	var _thisRow;
	$(document).ready(function() {
						getsizeSession();
						getordered();
						var exchangerate = $.ajax({
							 url: "${pageContext.request.contextPath}/admin/getchangerate", 
							 type: 'GET',
							 datatype: 'JSON',
							 async: false,
							beforeSend: function(xhr) {
					            xhr.setRequestHeader("Accept", "application/json");
					            xhr.setRequestHeader("Content-Type", "application/json");
					        },
							success: function(res){
								 return (res);
							},
							error:function(data, status,er){
								console.log("error: " + data + "status: " + status + "er: ");
							}
						});
						
						exchangerate = JSON.parse(exchangerate.responseText).data.exchangerate;
						
						console.log(exchangerate);
						$(document).on('keypress', '#qtytxt', function(e) {
											if ((e.keyCode == 8)|| (e.keyCode == 46)|| ((e.keyCode >= 37) && (e.keyCode <= 40)))
												return;
											var data = String
													.fromCharCode(e.which);
											var reg = new RegExp('^[0-9]+$');
											if (!reg.test(data)) {
												e.preventDefault();
											}
										});
						$("#btnlistorder").click(function() {
							getordered();
						});
						$('#btncancelorder, #btnconfirmorder').click(
										function() {
											if ($(this).attr('id') == 'btncancelorder')
												var updatestatus = 'cancelOrder/';
											else
												var updatestatus = 'confirmOrder/';
											$.ajax({
														url : "${pageContext.request.contextPath}/seller/"
																+ updatestatus
																+ _orderid,
														type : 'GET',
														dataType : 'JSON',
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"Accept",
																			"application/json");
															xhr
																	.setRequestHeader(
																			"Content-Type",
																			"application/json");
														},
														success : function(data) {
														},
														error : function(data,
																status, er) {
															console
																	.log("error: "
																			+ data
																			+ " status: "
																			+ status
																			+ " er:"
																			+ er);
														}
													});
											$("#totalorder")
													.html(
															$("#totalorder")
																	.html() - 1);
										});
						$('#btncancel').click(function() {
							if(confirm("តើអ្នកពិតជា ចង់លុបចោលការបព្ចារទិញនេះពិតមែនទេ?"))
							{   
								clearallsession();
								$('input[name="orderqty"]').val('0');
							}
						});
						$(document).on('click','#cusordered',function() {
											_this = $(this);
											_orderid = (_this.find("#orderedId").html());
											$("#btnconfirmorder").removeClass("hidebtn");
											$("#btncancelorder").removeClass("hidebtn");
											$("#btncancel").addClass("hidebtn");
											$("#btnconfirm").addClass("hidebtn");
											$.ajax({
														url : "${pageContext.request.contextPath}/seller/getOrderedDetail/"
																+ _this.find("#orderedId").html(),
														type : 'GET',
														dataType : 'JSON',
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"Accept",
																			"application/json");
															xhr
																	.setRequestHeader(
																			"Content-Type",
																			"application/json");
														},
														success : function(data) {
															var st = ""; // var amount = 0;
															console.log(data);
															for (i = 0; i < data.length; i++) {
																st += "<tr><td style='display: none;'>"	+ data[i][2].productId + "</td>"
																st += "<td>" + data[i][2].productName + "</td>";
																st += "<td>" + data[i][0].proUnitPrice + "</td>";
																st += "<td>" + data[i][0].proQty + "</td>";
																st += "<td>" + (data[i][0].proUnitPrice * data[i][0].proQty) + "</td>";
																st += "<td>" + data[i][0].proComment + "</td>";
																st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
																//amount += data[i][1].orderAmount;
															}
															$("#totalamount").val(data[0][1].orderAmount.toFixed(2));
															$("#orderdetail").html(st);
															$("#orderID").html(data[0][1].orderId);
															$("#addtocart").bPopup({follow: [false, false], position: ["10%","50%"]});
														},
														error : function(data,
																status, er) {
															console
																	.log("error: "
																			+ data
																			+ " status: "
																			+ status
																			+ " er:"
																			+ er);
														}
													});
										});
						function listproductorder() {
							var st = "";
							var amount = 0;
							$.ajax({
								url : "${pageContext.request.contextPath}/seller/listtocart",
								type : 'POST',
								dataType : 'JSON',
								beforeSend : function(xhr) {
									xhr.setRequestHeader("Accept",
											"application/json");
									xhr.setRequestHeader(
											"Content-Type",
											"application/json");
								},
								success : function(data) {
									console.log(data);
									for (i = 0; i < data.length; i++) {
										st += "<tr><td id='pro_id' style='display: none;'>"
												+ data[i].productId
												+ "</td>"
										st += "<td>"
												+ data[i].productName
												+ "</td>";
										st += "<td>" + data[i].price.toFixed(2)
												+ "</td>";
										st += "<td>" + data[i].quantity + ' ' + data[i].saleType +"</td>";
										st += "<td>"
												+ data[i].totalAmount
												+ "</td>";												
										st += "<td>"+ ((data[i].other != null) ? data[i].other : "") + "</td>";
										st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
										amount += data[i].totalAmount;
									}
									$("#totalamount").val(amount.toFixed(2));
									$("#exchangerate").val(exchangerate);
									$("#totalreil").val(numeral(amount*exchangerate).format('0,0'));
									$("#orderdetail").html(st);
								},
								error : function(data, stutus, er) {
									console.log("error:  " + data
											+ " status: " + status
											+ " er:" + er)
								}
							});
						}
						$("#bt_add, #btnCart").click(function() {
							$("#btncancel").removeClass("hidebtn");
							$("#btncancelorder").addClass("hidebtn");
							$("#btnconfirmorder").addClass("hidebtn");
							$("#btnconfirm").removeClass("hidebtn");
							listproductorder();
							
							$("#tocusname").val("");
							$("#cusaddr").val("");
							$("#cusphone").val("");
							$("#txtpay").val("0");
							$("#txtpayreil").val("0");
							$("#txtchange").val("0");
							$("#txtchangedollar").val("0");							
							$("#cusdate").val(moment().format('DD-MM-YYYY'));
							
							$("#addtocart").bPopup({follow: [false, false], position: ["10%","5%"]});
						});
						$(document).on('click',"#btndelete, #btnminus, #btnedit,#cancelbtn",function() {
											_thisRow = $(this).parents("tr");
											var st = "";
											var _url = "";
											var amount = 0;
											_this = $(this);
											if (_this.html() == "Delete") {
												var proId = $(this).parent().parent().children().eq(0).html(); 
												var txt;
												var msg = confirm("Do you want to remove " + $(this).parent().parent().children().eq(1).html() + " from your cart?");
												if (msg == true) {
													$.ajax({
																url : "${pageContext.request.contextPath}/seller/removefromcart/"+proId, /* deletedOrderProduct/" + _orderid + "/" + proId, */
																type : 'POST',
																dataType : 'JSON',
																beforeSend : function(xhr) {
																	xhr.setRequestHeader("Accept", "application/json");
																	xhr.setRequestHeader("Content-Type", "application/json");
																},
																success : function(data) {
																	console.log(data);
																	$("#totalamount").val(($("#totalamount").val() - (_this.parent().parent().children().eq(4).html())).toFixed(2));
																	_this.parents("tr").remove();
																},
																error : function(data, status, er) {
																	console.log("error: " + data + " status: " + status + " er:" + er);
																}
															});
													txt = "Successful";
													
												} else {
													// 												        txt = "You pressed Cancel!";
												}
												//document.getElementById("demo").innerHTML = txt;
											} else if (_this.html() == "Edit") {
												_productid = $(this).parent().parent().children().eq(0).html();
												var proId = $(this).parent().parent().children().eq(0).html();
												$("#productNm").html($(this).parent().parent().children().eq(1).html());
												$("#productprice").html($(this).parent().parent().children().eq(2).html());
												$("#qtytxt").val(parseInt($(this).parent().parent().children().eq(3).html()));
												$("#procomment").val($(this).parent().parent().children().eq(5).html());
												$(".panel-body").each(function(i,e){
													var x = $(e).data("id");
													if(x == _productid){
														$("#editSaleType").html($(e).find("#saleType").html());
														$("#editSaleType option[value='"+ $(e).find("#saleType").find(":selected").val() +"']").prop('selected', true);
													}
												});
												$("#myModal").bPopup();
											} else if (_this.html() == "Cancel") {
											} else{
												_this = $(this);
												var proNm = $(this).parents(".panel-body").find("#pro_nm").val();
												var proId = $(this).parents(".panel-body").find("#pro_id").val();
												var price = $(this).parents(".panel-body").find("#PRICE").html();
												var saletype = $(this).parents(".panel-body").find("#saleType").find(":selected").text();
												
												var proqty = 1;
												var _this = $(this);
												var totalAmount = proqty * price;
													console.log(totalAmount);
													json = {
														"productId" : proId,
														"productName" : proNm,
														"price" : price,
														"quantity" : proqty,
														"totalAmount" : totalAmount,
														"saleType" : saletype
													};
												 $.ajax({
														url : "${pageContext.request.contextPath}/seller/removetocart/", /* deletedOrderProduct/" + _orderid + "/" + proId, */
														type : 'POST',
														dataType : 'JSON',
														data : JSON.stringify(json),
														beforeSend : function(xhr) {
															xhr.setRequestHeader("Accept", "application/json");
															xhr.setRequestHeader("Content-Type", "application/json");
														},
														success : function(data) {
															console.log(data); 
															if(_this.parent().siblings("#txtqty").val() != 0){
																if(_this.parent().siblings("#txtqty").val(_this.parent().siblings("#txtqty").val()-1) == 0);
																{
																	getsizeSession();
																}
															}
 													},
														error : function(data, status, er) {
															console.log("error: " + data + " status: " + status + " er:" + er);
														}
													}); 
													
											}
										});
						 $("#editSaleType").change(function(){
							var _this = this;
							$("#productprice").text($(this).find(":selected").val());
						}); 
						 $("#productprice").dblclick(function(){
							 $(this).hide();
							 $("#txtproductprice").val($(this).text());
							 $("#txtproductprice").show();
						 });
						 $("#txtproductprice").blur(function(){
							 $(this).hide();
							 $("#productprice").text($("#txtproductprice").val());
							 $("#productprice").show();
						 });
						 
						$("#btnUpdate").click(function() {
										var	_qty = $("#qtytxt").val();
										var	uQty = $(this).parents("#myModal").find("#editSaleType").find(":selected").data("unitqty");
										var	editsaletype = $(this).parents("#myModal").find("#editSaleType").find(":selected").text();
										var other = $("#procomment").val();
										var	saleprice = $("#productprice").text(); //$(this).parents("#myModal").find("#editSaleType").find(":selected").val();
										 	json = {
												    "productId": _productid,
												    "price": saleprice,
												    "quantity" : _qty,
												    "saleType": editsaletype,
												    "unitqty" : uQty,
												    "other" : other
												};
											$.ajax({
														url : "${pageContext.request.contextPath}/seller/updateSellerProduct/",
														type : 'POST',
														dataType : 'JSON',
														data : JSON.stringify(json),
														beforeSend : function(xhr) {
															xhr.setRequestHeader("Accept", "application/json");
															xhr.setRequestHeader("Content-Type", "application/json");
														},
														success : function(data) {
															console.log(data);
															var subtotal = $("#qtytxt").val() * saleprice;
															var totalamount = $("#totalamount").val() - _thisRow.children().eq(4).html();
															_thisRow.children().eq(2).html(saleprice);
															_thisRow.children().eq(3).html($("#qtytxt").val() + " " + editsaletype);
															_thisRow.children().eq(4).html(subtotal.toFixed(2));
															_thisRow.children().eq(5).html(other);
															$("#totalamount").val((subtotal + totalamount).toFixed(2));
															$("#totalreil").val(numeral($("#totalamount").val() * $("#exchangerate").val()).format('0,0'));
															$(".panel-body").each(function(i,e){
																var x = $(e).data("id");
																if(x == _productid){
																	$(e).find("#saleType option[value='"+ saleprice +"']").prop('selected', true);
																	$(e).find("#PRICE").text(saleprice);
																	$(e).find("#txtqty").val(_qty);
																}
															});
														},
														error : function(data, status, er) {
															console.log("error: " + data + " status: " + status + " er:" + er);
														}
													});
										});
						$(document).on('click','#btnplus',function() { 
											var proNm = $(this).parents(".panel-body").find("#pro_nm").val();
											var proId = $(this).parents(".panel-body").find("#pro_id").val();
											var price = $(this).parents(".panel-body").find("#PRICE").html();
											var saletype = $(this).parents(".panel-body").find("#saleType").find(":selected").text();
											var uQty = $(this).parents(".panel-body").find("#saleType").data("uqty");
											var proqty = 1;
											var _this = $(this);
											var totalAmount = proqty * price;
											console.log(totalAmount);
											json = {
												"productId" : proId,
												"productName" : proNm,
												"price" : price,
												"quantity" : proqty,
												"totalAmount" : totalAmount,
												"saleType" : saletype,
												"unitqty" : uQty
											};
											$.ajax({
														url : "${pageContext.request.contextPath}/seller/addtocart",
														type : 'POST',
														datatype : 'JSON',
														data : JSON.stringify(json),
														beforeSend : function(xhr) {
															xhr.setRequestHeader("Accept", "application/json");
															xhr.setRequestHeader("Content-Type", "application/json");
														},
														success : function(data) { 
															getsizeSession();
															for (i = 0; i < data.length; i++) {
																if (data[i].productId == proId) {
																	_this.parents(".panel-body").find("#txtqty").val(data[i].quantity);
																	break;
																}
															}
														},
														error : function(data,status, er) {
															console.log("error: "+ data + "status: " + status + "er: ");
														}
													});
										});
$("#savebtn").click(function(){
	$("#addOwedForm").submit();
});				
$("#addOwedForm").submit(function(e){
	e.preventDefault(); 
 	json = {
		"cus_id" : {
			"customerId" :$("#cusID").val(),
			"customerName" : $("#customerName").val(),
			"phoneNumber" : $("#phoneNumber").val()
		},
		"totalAmount"  : $("#txtAmount").val()		 
	};  
	$.ajax({ 
	    url: "${pageContext.request.contextPath}/admin/saveCusOwed", 
	    type: 'POST', 
	    dataType: 'JSON', 
	    data: JSON.stringify(json), 
	    beforeSend: function(xhr) {
                  xhr.setRequestHeader("Accept", "application/json");
                  xhr.setRequestHeader("Content-Type", "application/json");
              },
	    success: function(data) {
	        if(data){
	        	alert('YOU HAVE BEEN INSERTED SUCCESSFULLY.');
	        	isAdded=true;
	       // 	clearUser();
	      //  	location.href="${pageContext.request.contextPath}/admin/seller/";
	        }else{
	        	alert('YOU HAVE ERRORS WHEN INSERT NEW USER.');
	        }
	    },
	    error:function(data,status,er) { 
	        console.log("error: "+data+" status: "+status+" er:"+er);
	    }
	});  
});

/* $(document).on("click","#btnbuymore , #closepopup", function(){
	
	location.href="${pageContext.request.contextPath}/seller/";
}); */

/* $("#closepopup").click(function(){
	location.href="${pageContext.request.contextPath}/seller/";
});
$("#btnbuymore").click(function(){
	location.href="${pageContext.request.contextPath}/seller/";
}); */

$("#btnconfirm").click(function() {
	var restPayment = (parseInt($("#txtpay").val() * $("#exchangerate").val()) + parseInt($("#txtpayreil").val().replace(',', '')));			
	if(restPayment < parseInt($("#totalreil").val().replace(',', ''))){		 
		if(!(confirm("ការបង់ ប្រាក់មិនគ្រប់គ្រាន់។ ចុច Ok ដើម្បីបន្ត រឺ Cancel ដើម្បីគិតឡើងវីញ។")))
		{   
			return;
		}
	}
	$.ajax({
			url : "${pageContext.request.contextPath}/seller/insertcartsell",
			type : 'POST',
			datatype : 'JSON',
		//	data : JSON.stringify(json),
			beforeSend : function(
					xhr) {
				xhr
						.setRequestHeader(
								"Accept",
								"application/json");
				xhr
						.setRequestHeader(
								"Content-Type",
								"application/json");
				},
		success : function(data) {
								console.log(data);
								if(data == false)
								{
									alert("លោកអ្នកមិន មានទំនិញគ្រប់គ្រាន់ក្នុងដំណើរការ នៃលក់នេះ។ ");
									return;
								}
								clearallsession();
								$('input[name="orderqty"]').val('0');															
								var st = "";								
								$('#orderdetail tr').each(function(i,e){
									var child = $(e).children();
									st += '<tr><td>' + (i+1) + '</td>';
									st += '<td>' + child.eq(1).html() + '</td>';
									st += '<td>' + child.eq(3).html() + '</td>';
									st += '<td>' + child.eq(2).html() + '</td>';
									st += '<td>' + child.eq(4).html() + '</td>';
									st += '<td>' + child.eq(5).html() + '</td></tr>';
								});
								$("#tblprint").html(st);
								$("#printtotal").html($("#totalamount").val());
								$("#printtotalreil").html($("#totalreil").val());
								$("#printpaid").html($("#txtpay").val());
								$("#printpaidr").html($("#txtpayreil").val());
								$("#printchange").html($("#txtchange").val());
								$("#printdollar").html($("#txtchangedollar").val());
								$("#printrate").html($("#exchangerate").val());
								$("#printcusdate").html($("#cusdate").val());
								
								if($("#tocusname").val() != "")
									$("#printtocusname").html($("#tocusname").val());
								if($("#cusaddr").val() != "")
									$("#printcusaddr").html($("#cusaddr").val());
								if($("#cusphone").val() != "")
									$("#printcusphone").html($("#cusphone").val());								
								
								alert("ការបព្ចារទិញ បានជោគជ័យ។");
								//var restPayment = (parseInt($("#txtpay").val() * $("#exchangerate").val()) + parseInt($("#txtpayreil").val().replace(',', '')));
								window.print();
						    		location.href="${pageContext.request.contextPath}/seller/";
								
								/* if(restPayment < parseInt($("#totalreil").val().replace(',', ''))){
									$("#addtocart").hide();
									if(confirm("Do you want to save the rest of payment?"))
									{
										searchCustomer();
										$("#txtAmount").val(parseInt($("#totalreil").val().replace(',', ''))-restPayment);
										 $('#form_add_import').modal({
											"backdrop":"static"
										}) ;
									}else{
										window.print();}
								}else{
									window.print(); 
								} */
								//alert("ដំណើរការ នៃលក់ ទទួលបានជោគជ័យ។ ");
							},
			error : function(data, status, er) {
				console.log("error: " + data + "status: " + status + "er: ");
				}
			});
});
function searchCustomer(){	 
	$.ajax({ 
	    url: "${pageContext.request.contextPath}/admin/getallcustomer", 
	    type: 'GET', 
	    dataType: 'JSON', 
	    beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },
	    success: function(data) { 
	       console.log(data); 
	       var availableTags=[];
	       for(i=0; i<data.customer.length; i++)
					{						
	    	   availableTags[i]= 
					         {
					         	"label": data.customer[i].customerName,
								"dataid": data.customer[i].customerId,
								"dataphone": data.customer[i].phoneNumber
					         };
					}
	       $("#customerName" ).autocomplete({
	    	   
	    	   select: function(event, ui){
	    		   $("#cusID").val(ui.item.dataid);
	    		   $("#phoneNumber").val(ui.item.dataphone);
	    	   },
	    	  // maxShowItems: 8,
	           source: availableTags
	       });
	       $(".ui-autocomplete").css("position", "absolute");
		   $(".ui-autocomplete").css("z-index", "2147483647");
	    },
	    error:function(data,status,er) { 
	        console.log("error: "+data+" status: "+status+" er:"+er);
	    }
	});
	return ;
} 
				function getsizeSession() {
					$.ajax({
								url : "${pageContext.request.contextPath}/order/listcart",
								type : 'POST',
								dataType : 'JSON',
								/* data: JSON.stringify(json), */
								beforeSend : function(xhr) {
									xhr.setRequestHeader("Accept",
											"application/json");
									xhr.setRequestHeader(
											"Content-Type",
											"application/json");
								},
								success : function(data) {
									$("#totalproduce").html(data.length);
								},
								error : function(data, status, er) {
									console.log("error: " + data
											+ " status: " + status
											+ " er:" + er);
								}
							});
						}
						function clearallsession() {
							$.ajax({
										url : "${pageContext.request.contextPath}/order/removeAllFromCart/",
										type : 'POST',
										dataType : 'JSON',
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept",
													"application/json");
											xhr.setRequestHeader(
													"Content-Type",
													"application/json");
										},
										success : function(data) {
											console.log(data);
											getsizeSession();
										},
										error : function(data, status, er) {
											console.log("error: " + data
													+ " status: " + status
													+ " er:" + er);
										}
									});
							return;
						}
						function getordered() {
							$.ajax({
										url : "${pageContext.request.contextPath}/seller/getordered",
										type : 'POST',
										dataType : 'JSON',
										beforeSend : function(xhr) {
											xhr.setRequestHeader("Accept",
													"application/json");
											xhr.setRequestHeader(
													"Content-Type",
													"application/json");
										},
										success : function(data) {
											st = "";
											console.log(data);
											$("#totalorder").html(data.length);
											for (i = 0; i < data.length; i++) {
												st += "<a href='javascript:void(0);' id='cusordered' class='list-group-item'><div class='media'><div class='media-body clearfix'>- <span id='cusName'>"
														+ data[i].customer.username
														+ "</span> (<span id='cusorderqty'>"
														+ data[i].orderQuantity
														+ "</span>)</div></div>";
												st += "<div style='display: none;' id='orderedId'>"
														+ data[i].orderId
														+ "</div></a>";
											}
											$("#listorder").html(st);
										},
										error : function(data, status, er) {
											console.log("error: " + data
													+ " status: " + status
													+ " er:" + er);
										}
									});
							return;
						}
						var wsURI = "ws://"+ document.location.host	+ "${pageContext.request.contextPath}/notification";
						if (!("WebSocket" in window)) {
							console
									.log("WebSocket is not support on your browser...")
						} else {
							console
									.log("WebSocket is support on your browser...");
						}
						var connection = new WebSocket(wsURI);
						var sendedMessage = "";
						connection.binaryType = 'arraybuffer';
						connection.onopen = function(event) {
							onOpen(event);
						}
						connection.onerror = function(event) {
							onError(event);
						}
						connection.onmessage = function(event) {
							console.log("MESSAGE...")
							onMessage(event);
						}
						function onOpen(event) {
							console.log("CONNECTED...")
						}
						function onError(event) {
							console.log(event);
						}
						function onMessage(event) {
							console.log(event.data);
							if (sendedMessage == event.data) {
								return;
							}
							console.log(event.data);
							if (event.data == "SENT") {
								getsizeSession();
								getordered();
							}
						}
					});
</script>




<script
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.ui.autocomplete.scroll.min.js"></script>
<%@ include file="print_invoice.jsp"%>
</body>
</html>