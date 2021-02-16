package net.codejava.javaee.bookstore;

public class Article {
	protected int id;
	protected String name;
	protected String roles;
	protected float price;

	public Article(String name, String roles, float price) {
		this.roles = roles;
		this.price = price;
		this.name=name;
	}

	public Article(int id) {
		this.id = id;
	}

	public Article(int id, String name, String roles, float price) {
		this.name=name;
		this.id = id;
		this.roles = roles;
		this.price = price;
	}
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getRoles() {
		return roles;
	}

	public float getPrice() {
		return price;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public void setPrice(float price) {
		this.price = price;
	}
}
