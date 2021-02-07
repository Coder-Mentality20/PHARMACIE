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
                                            <h1>Articles Management</h1>
                                            <h2>
                                                <a href="new" class="btn btn-primary">Add New Article</a>
                                                &nbsp;&nbsp;&nbsp;
                                                <a href="list" class="btn btn-primary">List All Articles</a>

                                            </h2>
                                        </center>
                                        <div>
                                            <table class="table table-dark table-bordered">
                                                <thead class="thead-light">
                                                <caption><h2>List of Article</h2></caption>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Roles</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Actions</th>
                                                </tr>
                                                <c:forEach var="article" items="${listArticle}">
                                                    <tr>
                                                        <td><c:out value="${article.id}" /></td>
                                                        <td><c:out value="${article.name}" /></td>
                                                        <td><c:out value="${article.roles}" /></td>
                                                        <td><c:out value="${article.price}" /></td>
                                                        <td>
                                                            <a class="btn btn-primary" href="edit?id=<c:out value='${article.id}' />">Edit</a>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <a class="btn btn-primary" href="delete?id=<c:out value='${article.id}' />">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </thead>
                                            </table>
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
