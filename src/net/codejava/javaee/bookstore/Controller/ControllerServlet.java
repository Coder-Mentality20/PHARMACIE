package net.codejava.javaee.bookstore;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArticleDAO articleDAO;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		articleDAO = new ArticleDAO(jdbcURL, jdbcUsername, jdbcPassword);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
				case "/new":
					showNewForm(request, response);
					break;
				case "/insert":
					insertArticle(request, response);
					break;
				case "/delete":
					deleteArticle(request, response);
					break;
				case "/edit":
					showEditForm(request, response);
					break;
				case "/update":
					updateArticle(request, response);
					break;
				default:
					listArticle(request, response);
					break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listArticle(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Article> listArticle = articleDAO.listAllArticles();
		request.setAttribute("listArticle", listArticle);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ArticleList.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ArticleForm.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Article existingArticle = articleDAO.getArticle(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ArticleForm.jsp");
		request.setAttribute("article", existingArticle);
		dispatcher.forward(request, response);

	}

	private void insertArticle(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String name = request.getParameter("name");
		String roles = request.getParameter("roles");
		Float price = Float.parseFloat(request.getParameter("price"));

		Article newArticle = new Article(name, roles, price);
		articleDAO.insertArticle(newArticle);
		response.sendRedirect("list");
	}

	private void updateArticle(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String roles = request.getParameter("roles");
		Float price = Float.parseFloat(request.getParameter("price"));

		Article article = new Article(id, name, roles, price);
		articleDAO.updateArticle(article);
		response.sendRedirect("list");
	}

	private void deleteArticle(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		Article article = new Article(id);
		articleDAO.deleteArticle(article);
		response.sendRedirect("list");

	}

}
