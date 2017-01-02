package ua.com.shop.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Category  {

	@Id
	@GeneratedValue(strategy =GenerationType.AUTO)
	private int id;
	private String name;
	
	@ManyToMany
	@JoinTable(name ="category_commodity" , joinColumns =@JoinColumn(name ="id_category") ,
	inverseJoinColumns = @JoinColumn(name ="id_commodity"))
	private List<Commodity> commodities;

	
	public Category(){
		
	}
	
	public Category(String name) {
		super();
		this.name = name;
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
	public List<Commodity> getCommodities() {
		return commodities;
	}

	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", commodities=" + commodities + "]";
	}
	
	
	
	
	
}
