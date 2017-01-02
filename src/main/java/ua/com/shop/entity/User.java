package ua.com.shop.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import ua.com.shop.dao.UserDao;

@Entity
public class User implements UserDetails{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private String surname;
	private String password;
	private String email;
	private String phoneNumber;
	
	private String UUID;
	private boolean enabeled;
	
	private String pathImage;
	
	
	@ManyToMany
	@JoinTable(name ="user_commodity" , joinColumns = @JoinColumn(name ="id_user") ,
	inverseJoinColumns =@JoinColumn(name ="id_commodity"))
	private List<Commodity> commodities;
	
	@Enumerated
	private Role role;
	
	
	public User(String name, String surname, String password, String email, String phoneNumber,
			List<Commodity> commodities) {
		super();
		this.name = name;
		this.surname = surname;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.commodities = commodities;
	}

	


	public User(String name, String surname, String password, String email) {
		super();
		this.name = name;
		this.surname = surname;
		this.password = password;
		this.email = email;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public User() {
		// TODO Auto-generated constructor stub
	}



	public List<Commodity> getCommodities() {
		return commodities;
	}




	public void setCommodities(List<Commodity> commodities) {
		this.commodities = commodities;
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

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}




	public String getPhoneNumber() {
		return phoneNumber;
	}




	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}




	public Role getRole() {
		return role;
	}




	public void setRole(Role role) {
		this.role = role;
	}


// for security

	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(role.name()));
		return authorities;
	}




	public String getUsername() {
		return String.valueOf(id);
	}




	public boolean isAccountNonExpired() {
		return true;
	}




	public boolean isAccountNonLocked() {
		return true;
	}



	public boolean isCredentialsNonExpired() {
		return true;
	}



	public boolean isEnabled() {
		return enabeled;
	}




	public String getPathImage() {
		return pathImage;
	}




	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}




	public String getUUID() {
		return UUID;
	}




	public void setUUID(String uUID) {
		UUID = uUID;
	}




	public boolean isEnabeled() {
		return enabeled;
	}




	public void setEnabeled(boolean enabeled) {
		this.enabeled = enabeled;
	}

	


	


	
}
