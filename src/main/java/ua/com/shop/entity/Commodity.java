package ua.com.shop.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Commodity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String model;
	private double price;
	private String pathImage;
	
	@ManyToMany
	@JoinTable(name ="category_commodity" , joinColumns =@JoinColumn(name ="id_commodity") ,
	inverseJoinColumns = @JoinColumn(name ="id_category"))
	private List<Category> categories = new ArrayList<Category>();
	
	@ManyToMany
	@JoinTable(name ="user_commodity" , joinColumns = @JoinColumn(name ="id_commodity") ,
	inverseJoinColumns =@JoinColumn(name ="id_user"))
	private List<User> users;
	
	
	@ManyToMany
	@JoinTable(name ="subcategory_commodity" , joinColumns =@JoinColumn(name = "id_commodity") , 
	inverseJoinColumns = @JoinColumn(name = "id_subcategory"))
	private List<SubCategory> subcategories;
	
	@ManyToOne(fetch =FetchType.LAZY)
	private Maker maker;
	
	public Commodity(){
	}

	public Commodity(String name, String model, double price, String pathImage, List<Category> categories,
			List<User> users, List<SubCategory> subcategories, Maker maker) {
		super();
		this.name = name;
		this.model = model;
		this.price = price;
		this.pathImage = pathImage;
		this.categories = categories;
		this.users = users;
		this.subcategories = subcategories;
		this.maker = maker;
	}

	public Commodity(String name, String model, double price, String pathImage) {
		super();
		this.name = name;
		this.model = model;
		this.price = price;
		this.pathImage = pathImage;
	}

	public Commodity(String name, String model, double price) {
		super();
		this.name = name;
		this.model = model;
		this.price = price;
	}

	public Commodity(String name, String model, double price, String pathImage, List<Category> categories,
			Maker maker) {
		super();
		this.name = name;
		this.model = model;
		this.price = price;
		this.pathImage = pathImage;
		this.categories = categories;
		this.maker = maker;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPathImage() {
		return pathImage;
	}

	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<SubCategory> getSubcategories() {
		return subcategories;
	}

	public void setSubcategories(List<SubCategory> subcategories) {
		this.subcategories = subcategories;
	}

	public Maker getMaker() {
		return maker;
	}

	public void setMaker(Maker maker) {
		this.maker = maker;
	}

	@Override
	public String toString() {
		return "Commodity [id=" + id + ", name=" + name + ", model=" + model + ", price=" + price + ", pathImage="
				+ pathImage + "]";
	}

}
