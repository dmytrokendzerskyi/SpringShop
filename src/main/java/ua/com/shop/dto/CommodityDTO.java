package ua.com.shop.dto;

import java.util.Arrays;

public class CommodityDTO {

	private int id;
	private String name;
	private String model;
	private double price;
	private String	maker;
	private String [] categories;
	private String pathImage;

	public CommodityDTO() {
	}

	public CommodityDTO(int id, String name, String model, double price, String maker, String[] categories) {
		super();
		this.id = id;
		this.name = name;
		this.model = model;
		this.price = price;
		this.maker = maker;
		this.categories = categories;
	}

	public CommodityDTO(String name, String model, double price, String maker, String[] categories) {
		super();
		this.name = name;
		this.model = model;
		this.price = price;
		this.maker = maker;
		this.categories = categories;
	}

	public CommodityDTO(String name, String model, double price) {
		super();
		this.name = name;
		this.model = model;
		this.price = price;
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

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String[] getCategories() {
		return categories;
	}

	public void setCategories(String[] categories) {
		this.categories = categories;
	}

	public String getPathImage() {
		return pathImage;
	}

	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}
	
}
