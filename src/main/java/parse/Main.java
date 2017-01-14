package parse;

import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewRequestBodyAdvice;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewResponseBodyAdvice;

import ua.com.shop.entity.Category;
import ua.com.shop.entity.Commodity;
import ua.com.shop.entity.Maker;
import ua.com.shop.service.CategoryService;
import ua.com.shop.service.CommodityService;
import ua.com.shop.service.MakerService;

public class Main {
	
	public static void main(String[] args) throws IOException {
		
		parse();
		
	}

	public static void parse() throws IOException{
		
		 EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Primary");
		 EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		
		Document document = Jsoup.connect("https://www.overstock.com/Electronics/Headphones/Sennheiser~Sony~INSTEN,/brand,/20274/cat.html").get();

		String [] text = new String[document.select(".product-title").size()];
		/*text = document.select(".product-title");*/
		Elements el =  document.select(".img-responsive.product-img");
		Elements elem = document.select(".product-title");
		Elements elemet = document.select(".product-price");
		for (Element element : el) {
			System.out.println(element.attr("src"));
		}
		for (Element element : elemet) {
			System.out.println(element.text());
		}
		for (Element element : elem) {
			System.out.println(element.text());
		}
		
		
		for (int i = 58; i < el.size(); i++) {
			entityManager.getTransaction().begin();
			String  [] str = elem.get(i).text().split(" ");
			String model = "";
			for (int j = 0; j < str.length; j++) {
				model += str[j]+" ";
			}
			Commodity commodity  = new Commodity(str[0], model, Double.parseDouble(elemet.get(i).text().substring(8,13)), el.get(i).attr("src"));
			
			Category category = (Category) entityManager.createQuery("select c from Category c where c.name like :name").setParameter("name", "Headphone").getSingleResult();
		
		
			
			if(str[0].equals("INSTEN")){
				Maker maker= (Maker) entityManager.createQuery("select m from Maker m where m.name like :name").setParameter("name", "INSTEN").getSingleResult();
				commodity.setMaker(maker);
			}else if(str[0].equals("Sony")){				
				Maker maker= (Maker) entityManager.createQuery("select m from Maker m where m.name like :name").setParameter("name", "Sony Corporation").getSingleResult();
				commodity.setMaker(maker);
			}else if(str[0].equals("Sennheiser")){
				Maker maker= (Maker) entityManager.createQuery("select m from Maker m where m.name like :name").setParameter("name", "Sennheiser electronic GmbH & Co. KG").getSingleResult();
				commodity.setMaker(maker);
			}
			
			category.getCommodities().add(commodity);
			
			entityManager.persist(commodity);
			entityManager.getTransaction().commit();
			
		}
		
		//		Document documen = Jsoup.connect("http://rozetka.com.ua/notebooks/asus/c80004/v004/").get();
		
//		String [] img = new String[document.select(".img-responsive.product-img").size()];
//		
//		String [] text = new String[document.select(".product-title").size()];
//		String [] price = new String[document.select(".product-price").size()];
//		
//		text = document.select(".product-title").text().split("Asus ");
//		price = document.select(".product-price").text().replace("$ ", "").split("Today: \\$");
//		Elements img = document.select(".img-responsive").attr("src");
//		
//		System.out.println(text.length);
//		System.out.println(price.length);
//		System.out.println(img);
////		System.out.println();
//		for (String string : text) {
//			System.out.println(string);
//		}
//		
//		for (String string : price) {
//			System.out.println(string);
//		}
	
		
		
//		for (int i = 128; i <=182; i++) {
//			entityManager.getTransaction().begin();
//			Commodity commodity = (Commodity) entityManager.createQuery("select c from Commodity c where c.id =:id").setParameter("id", i).getSingleResult();	
///*			String [] str = new String [20];
//			str = commodity.getModel().split(" ");
//			if(str[1].equalsIgnoreCase("J7")){
//			commodity.setPathImage("https://ak1.ostkcdn.com/images/products/12251716/P19093190.jpg");
//			}else if(str[1].equalsIgnoreCase("J1")){
//				commodity.setPathImage("https://ak1.ostkcdn.com/images/products/11643665/P18576093.jpg");
//			}else if(str[1].equalsIgnoreCase("J5")){
//				commodity.setPathImage("https://ak1.ostkcdn.com/images/products/10481987/P17570603.jpg");
//			}else if(str[1].equalsIgnoreCase("S4")){
//				commodity.setPathImage("https://ak1.ostkcdn.com/images/products/etilize/images/250/1033332452.jpg");
//			}else{
//				commodity.setPathImage("https://ak1.ostkcdn.com/images/products/13915352/P20549562.jpg");
//			}*/
//			System.out.println(commodity.getModel());
//			commodity.setPathImage(scanner());
//			entityManager.merge(commodity);
//			entityManager.getTransaction().commit();
//		}
		
	
		
		
//		String [] tet = new String [13];
//		String [] pr = new String [13];
//		
//		int j = 0;
//		for (String string : text) {
//			for (int i = 0; i < string.length()-7; i++) {
//				
//				if(string.substring(i,i+7).equals("In-plan") ){
//					tet[j] = string.substring(i+7,string.length());
//					string = string.substring(0,i+7);
//					j++;
//				}
//			}
//			tet[j] = string;
//			j++;
//		}
//		for (String string : tet) {
//			System.out.println(string);
//		}
//		j=0;
//		label:for (String string : price) {
//			for (int i = 0; i < string.length()-1; i++) {
//				if(string.substring(i, i+1).equals(",")){
//					if(j==pr.length-1) break;
//					pr[j] = string.substring(i-1,i)+string.substring(i+1,string.length());
//					j++;
//					continue label;
//				}
//			}
//					if(j==pr.length) break;
//				pr[j] = string;
//				j++;
//		}
////	
//	
//		for (String string : pr) {
//			System.out.println(string);
//			System.out.println(string.length());
//		}
//	
//		//////////////////////////////////
//	
//		
//		
////		
////		for (int i = 50; i < price.length; i++) {
////			entityManager.getTransaction().begin();
////			Category category = (Category) entityManager.createQuery("select c from Category c where c.name like :name").setParameter("name", "Smartphone").getSingleResult();
////			
////			Maker maker= (Maker) entityManager.createQuery("select m from Maker m where m.name like :name").setParameter("name", "Samsung").getSingleResult();
////			
////			Commodity commodity = new Commodity();
////			commodity.setName("Samsung");
////				
////				commodity.setModel(text[i]);
////				commodity.setPrice(Double.valueOf(price[i].substring(0, 7)));
////			System.out.println(category.toString());
////				category.getCommodities().add(commodity);
////				commodity.setMaker(maker);
////				
////			entityManager.persist(commodity);
////			entityManager.getTransaction().commit();
////		}
//		
//		
//	
//		
//		/*entityManager.getTransaction().begin();
//		entityManager.persist(maker);
//		entityManager.getTransaction().commit();
//		
//		entityManager.getTransaction().begin();
//		entityManager.persist(category);
//		entityManager.getTransaction().commit();*/
//		
//		
//		/*for (int i = 1; i < price.length; i++) {
//			
//
//		Commodity commodity = new Commodity();
//		commodity.setName("Asus");
//			
//			commodity.setModel(tet[i]);
//			commodity.setPrice(Double.parseDouble(pr[i]));
//
//			commodity.getCategories().add(categoryService.findOne(1));
//			commodity.setMaker(makerService.findOne(4));
//			
//			commodityService.save(commodity);
//		
//			
//		}
//		}*/
		entityManager.close();
		entityManagerFactory.close();
	}

	public static String scanner(){
		return new Scanner(System.in).next();
	}

}


