<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Pharmacie Store Application</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</head>
<body>
<header class="masthead" style="  height: 100vh;
  min-height: 500px;
  background-image: url('https://source.unsplash.com/BtbjCFUvBXs/1920x1080');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12 text-center">
				<div class="container-fluid">
					<div class="row my-4">
						<div class="col-md-12 mx-auto">
							<div class="card">
								<div class="card-body bg-light">
									<div class="card-header">
	<center>
		<h1>Article Management</h1>
        <h2>
        	<a class="btn btn-primary" href="new">Add New Article</a>
        	&nbsp;&nbsp;&nbsp;
        	<a class="btn btn-primary" href="list">List All Articles</a>
        	
        </h2>
	</center>
    <div align="center">
		<c:if test="${article != null}">
			<form action="update" method="post">
        </c:if>
        <c:if test="${article == null}">
			<form action="insert" method="post">
        </c:if>
        <table  cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${article != null}">
            			Edit Article
            		</c:if>
            		<c:if test="${article == null}">
            			Add New Article
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${article != null}">
        			<input type="hidden" name="id" value="<c:out value='${article.id}' />" />
        		</c:if>            
            <tr>
                <th>Name: </th>
                <td>
                	<input type="text" name="name" size="45" class="form-control" placeholder="NAME"
                			value="<c:out value='${article.name}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Roles: </th>
                <td>
                	<input type="text" name="roles" size="45" class="form-control" placeholder="ROLE"
                			value="<c:out value='${article.roles}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>
                	<input type="text" name="price" size="45" class="form-control" placeholder="PRICE"
                			value="<c:out value='${article.price}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Ajouter" class="btn btn-primary"/>
            	</td>
            </tr>
        </table>
        </form>
    </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>
</header>
<section class="py-5">
	<div class="container">
		<h2 class="font-weight-light">Page Content</h2>
		<p>All Rights Reserved By Soufiane EL Kadiri &copy; 2020</p>
	</div>
</section>
</body>
</html>
