<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>地点信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/site/tdSite/">地点信息列表</a></li>
		<shiro:hasPermission name="site:tdSite:edit"><li><a href="${ctx}/site/tdSite/form">地点信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tdSite" action="${ctx}/site/tdSite/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>地点名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>地点名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="site:tdSite:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tdSite">
			<tr>
				<td><a href="${ctx}/site/tdSite/form?id=${tdSite.id}">
					${tdSite.name}
				</a></td>
				<td>
					<fmt:formatDate value="${tdSite.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tdSite.remarks}
				</td>
				<shiro:hasPermission name="site:tdSite:edit"><td>
    				<a href="${ctx}/site/tdSite/form?id=${tdSite.id}">修改</a>
					<a href="${ctx}/site/tdSite/delete?id=${tdSite.id}" onclick="return confirmx('确认要删除该地点信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>