﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>super后台-EBooking房价审核</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${basePath }/themes/base/jquery.ui.all.css" >
<link rel="stylesheet" type="text/css" href="${basePath }/themes/ebk/admin.css" >
<link rel="stylesheet" type="text/css" href="${basePath}/themes/ebk/ui-components.css" />
<link type="text/css" rel="stylesheet" href="${basePath}/themes/base/jquery.jsonSuggest.css">

<!-- js -->
<script src="http://pic.lvmama.com/js/jquery142.js"></script>
<script src="http://pic.lvmama.com/js/ebooking/ebooking.js"></script>
<script type="text/javascript"
	src="${basePath}/js/base/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${basePath}/js/base/jquery-ui-1.8.5.js"></script>
<script type="text/javascript"
	src="${basePath}/js/base/jquery.datepick-zh-CN.js"></script>
<script type="text/javascript"
	src="http://pic.lvmama.com/js/ui/lvmamaUI/lvmamaUI.js" charset="utf-8"></script>
	<script type="text/javascript"
	src="${basePath}/js/base/jquery.jsonSuggest-2.min.js"></script>
<script type="text/javascript" src="${basePath}/js/base/jquery.validate.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#createTimeBegin').datepicker({dateFormat : 'yy-mm-dd'});
	$('#createTimeEnd').datepicker({dateFormat : 'yy-mm-dd'});
	
	$('#confirmTimeBegin').datepicker({dateFormat : 'yy-mm-dd'});
	$('#confirmTimeEnd').datepicker({dateFormat : 'yy-mm-dd'});
	$('input[name=ebkHousePrice.housePriceId]').val("${ebkHousePrice.housePriceId}");
	$('input[name=ebkHousePrice.submitUser]').val("${ebkHousePrice.submitUser}");
	$('input[name=ebkHousePrice.subject]').val("${ebkHousePrice.subject}");
	$('input[name=ebkHousePrice.confirmUser]').val("${ebkHousePrice.confirmUser}");
	
	$("#ebkHousePriceApplyForm").validate({
		rules: {    
			"ebkHousePrice.housePriceId":{
				required:false,
				number:true
			}
		}, 
		messages: {    
			"ebkHousePrice.housePriceId":{
 				number:"请输入数字 "
			}
		}, 
	});
});
	function beforeSubmit() {
		if (
				$('input[name=ebkHousePrice.housePriceId]').val() == ''
						&& $("#ebkHousePriceStatusId").find("option:selected")
								.val() == ''
						&& $('input[name=ebkHousePrice.supplierId]').val() == ''
						&& $('input[name=ebkHousePrice.submitUser]').val() == ''
						&& $('input[name=ebkHousePrice.subject]').val() == ''
						&& $('input[name=ebkHousePrice.confirmUser]').val() == ''
						&& $('#createTimeBegin').val() == ''
						&& $('#createTimeEnd').val() == ''
						&& $('#confirmTimeBegin').val() == ''
						&& $('#confirmTimeEnd').val() == '') {
			alert("请输入至少一个查询条件!");
			return false;
		}
		return true;
	}
	function suggestDetail(housePriceId) {
		$("#suggestDetailDiv")
				.load(
						"${basePath}/ebooking/roomprice/ebkHousePriceApplyDetail.do?ebkHousePrice.housePriceId="
								+ housePriceId, function() {
							$(this).dialog({
								modal : true,
								title : "房价变更已处理详情",
								width : 450,
								height : 550,
								buttons : {
									"取消" : function() {
										$(this).dialog("close");
									}
								}
							});
						});
	}

	$(function() {
		//查找供应商
		$("#searchSupplierName").jsonSuggest({
			url : "${basePath}/supplier/searchSupplier.do",
			maxResults : 10,
			minCharacters : 1,
			onSelect : function(item) {
				$("#comSupplierId").val(item.id);
			}
		});
	});
</script>
</head>
<body>
	<!--订单处理开始-->
	<ul class="gl_top">
	<form id="ebkHousePriceApplyForm" action="${basePath}/ebooking/roomprice/ebkHousePriceList.do" method="post" onsubmit="return beforeSubmit();">
	<table class="newfont06" border="0"  cellpadding="0"  >
		<tr height="30">
			<td>申请单号：</td>
			<td>
				 <input type="text" name="ebkHousePrice.housePriceId" maxlength="10"/>
			</td>
			<td>审核状态：</td>
			<td>
				<s:select list="suggestAuditStatusList" id="ebkHousePriceStatusId"
						name="ebkHousePrice.status" listKey="code" listValue="name" ></s:select>
			</td>
			<tr height="30">
			<td>酒店名称：</td>
			<td>
				<input type="text" id="searchSupplierName"
				name="supplierName"   /> 
				<input type="hidden" name="ebkHousePrice.supplierId" id="comSupplierId"
				 />
			</td>
			
			<td>申请人：</td>
			<td>
				 <input type="text" name="ebkHousePrice.submitUser" maxlength="25"/>
			</td>
			 
			<td>审核人：</td>
			<td>
				 <input type="text" name="ebkHousePrice.confirmUser" maxlength="25"/>
			</td>
			</tr>
			<tr height="30">
			<td>申请主题：</td>
			<td>
				 <input type="text" name="ebkHousePrice.subject" maxlength="25" maxlength="100"/>
			</td>
			<td>审核时间：</td>
			<td>
				 <input type="text" id="confirmTimeBegin" name="confirmTimeBegin" value="${confirmTimeBegin}"/>~<input type="text" id="confirmTimeEnd" name="confirmTimeEnd" value="${confirmTimeEnd}"/>
			</td>
			<td>提交时间：</td>
			<td>
				 <input type="text" id="createTimeBegin" name="createTimeBegin" value="${createTimeBegin}"/>~<input type="text" id="createTimeEnd" name="createTimeEnd" value="${createTimeEnd}"/>
			</td>
		</tr>
		<tr height="30">
			<td>
				<input type="submit" class="button btn btn-small" value="查询"/>
 			</td>
		</tr>
	</table>
	 </form>
	 </ul>
	 <div class="tab_top"></div>
	<table border="0"   cellpadding="0" class="gl_table">
		<tr>
			<th width="100">申请单号</th>
			<th>申请主题</th>
			<th width="80">申请人</th>
			<th width="120">提交时间</th>
			<th width="150">酒店名称</th>
			<th width="80">审核人</th>
			<th width="120">审核时间</th>
			<th width="60">状态</th>
			<th width="30">操作</th>
		</tr>
		<s:iterator value="ebkHousePricePage.items">
			<tr>
				<td><s:property value="housePriceId" /></td>
				<td><s:property value="subject" /></td>
				<td><s:property value="submitUser" /></td>
				<td><s:date name="createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${supplierName}（ID：${supplierId}）</td>			
                <td><s:property value="confirmUser" /></td>
				<td><s:date name="confirmTime" format="yyyy-MM-dd HH:mm:ss"/></td>
				<td><s:property value="auditStatus.cnName" /></td>
				<td><a href="javascript:suggestDetail('<s:property value="housePriceId" />');">查看</a></td>
			</tr>
		</s:iterator>
		<tr>
			<td>总条数：<s:property value="ebkHousePricePage.totalResultSize" />
			</td>
			<td colspan="8" align="right">${ebkHousePricePage.pagination }</td>
		</tr>
	</table>
	<div id="suggestDetailDiv" style="display: none"></div>
</body>
</html>
