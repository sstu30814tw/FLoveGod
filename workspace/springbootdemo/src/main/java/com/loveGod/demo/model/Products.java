package com.loveGod.demo.model;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="products")
public class Products {
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="prod_id")
		private Integer prodId;
		
		@Column(name="prod_name")
		private String prodName;
		
		@Column(name="prod_price")
		private Integer prodPrice;
		
		@Lob //Large Object 檔案
		@Column(name=" prod_photo")
		private byte[] prodPhoto;
	
		@Column(name="prod_stock")
		private Integer prodStock;
	
		public Integer getProdStock() {
			return prodStock;
		}

		public void setProdStock(Integer prodStock) {
			this.prodStock = prodStock;
		}
		public Products() {
			
		}
	
		public Integer getProdId() {
			return prodId;
		}
	
		public void setProdId(Integer prodId) {
			this.	prodId = prodId;
		}
	
		public String getProdName() {
			return prodName;
		}
	
		public void setProdName(String prodName) {
			this.prodName = prodName;
		}
	
		public Integer getProdPrice() {
			return prodPrice;
		}
	
		public void setProdPrice(Integer prodPrice) {
			this.prodPrice = prodPrice;
		}

		public byte[] getProdPhoto() {
			return prodPhoto;
		}

		public void setProdPhoto(byte[] prodPhoto) {
			this.prodPhoto = prodPhoto;
		}
		
		public Products(Integer prodId, String prodName, Integer prodPrice, byte[] prodPhoto, Integer prodStock) {
	 		this.prodId = prodId;
	 		this.prodName = prodName;
	 		this.prodPrice = prodPrice;
	 		this.prodPhoto = prodPhoto;
	 		this.prodStock = prodStock;
	 	}

	 	@Override
	 	public String toString() {
	 		return "Products{" +
	 				"prodId=" + prodId +
	 				", prodName='" + prodName + '\'' +
	 				", prodPrice=" + prodPrice +
	 				", prodPhoto=" + Arrays.toString(prodPhoto) +
	 				", prodStock=" + prodStock +
	 				'}';
	 	}

		
	

}
