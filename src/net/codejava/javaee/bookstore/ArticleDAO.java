package net.codejava.javaee.bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class ArticleDAO {
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;
	
	public ArticleDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = "jdbc:postgresql://localhost:5432/pharmacie?useSSL=false";
		this.jdbcUsername = "postgres";
		this.jdbcPassword = "root20";
	}
	
	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(
										jdbcURL, jdbcUsername, jdbcPassword);
		}
	}
	
	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
	public boolean insertArticle(Article article) throws SQLException {
		String sql = "INSERT INTO article (name, roles, price) VALUES (?, ?, ?)";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, article.getName());
		statement.setString(2, article.getRoles());
		statement.setFloat(3, article.getPrice());
		
		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowInserted;
	}
	
	public List<Article> listAllArticles() throws SQLException {
		List<Article> listArticle = new ArrayList<>();
		
		String sql = "SELECT * FROM article";
		
		connect();
		
		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		
		while (resultSet.next()) {
			int id = resultSet.getInt("article_id");
			String name = resultSet.getString("name");
			String roles = resultSet.getString("roles");
			float price = resultSet.getFloat("price");
			
			Article article = new Article(id, name, roles, price);
			listArticle.add(article);
		}
		
		resultSet.close();
		statement.close();
		
		disconnect();
		
		return listArticle;
	}
	
	public boolean deleteArticle(Article article) throws SQLException {
		String sql = "DELETE FROM article where article_id = ?";
		
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, article.getId());
		
		boolean rowDeleted = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowDeleted;		
	}
	
	public boolean updateArticle(Article article) throws SQLException {
		String sql = "UPDATE article SET name = ?, roles = ?, price = ?";
		sql += " WHERE article_id = ?";
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, article.getName());
		statement.setString(2, article.getRoles());
		statement.setFloat(3, article.getPrice());
		statement.setInt(4, article.getId());
		
		boolean rowUpdated = statement.executeUpdate() > 0;
		statement.close();
		disconnect();
		return rowUpdated;		
	}
	
	public Article getArticle(int id) throws SQLException {
		Article article = null;
		String sql = "SELECT * FROM article WHERE article_id = ?";
		
		connect();
		
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, id);
		
		ResultSet resultSet = statement.executeQuery();
		
		if (resultSet.next()) {
			String name = resultSet.getString("name");
			String roles = resultSet.getString("roles");
			float price = resultSet.getFloat("price");

			article = new Article(id, name, roles, price);
		}
		
		resultSet.close();
		statement.close();
		
		return article;
	}
}
