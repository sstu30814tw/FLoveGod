package com.loveGod.demo.model;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orderDetail_test3")
public class OrderDetail {
	
	@Id
	@Column(name = "orderDetailId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderDetailId;	
	
	@Column(name = "orderID")
	private Integer orderId;				//訂單id

	@Column(name = "productID" )
	private String prodId;			//商品id(FK)(PK)
	private Integer total;			
	private String prod_name;	
	
	
	private byte[] prod_photo;			
	
	private Integer paystatus;

	public Integer getPaystatus() {
		return paystatus;
	}
	public void setPaystatus(Integer paystatus) {
		this.paystatus = paystatus;
	}


	/**
	 * 商品數量
	 */
	@Column(name="quanity")
	private Integer quanity;			

	@Column(name="prod_price")
	private Integer subtotal;			//商品小計
	
//	@ManyToOne
//	@JoinColumn(name = "orderid")
//	Order Order;


	public OrderDetail() {
	}
	public Integer getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public byte[] getProd_photo() {
		return prod_photo;
	}
	public void setProd_photo(byte[] prod_photo) {
		this.prod_photo = prod_photo;
	}
	public Integer getQuanity() {
		return quanity;
	}
	public void setQuanity(Integer quanity) {
		this.quanity = quanity;
	}
	public Integer getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Integer subtotal) {
		this.subtotal = subtotal;
	}


	public OrderDetail(Integer orderDetailId, Integer orderId, String prodId, Integer total, String prod_name,
			byte[] prod_photo, Integer quanity, Integer subtotal) {
		this.orderDetailId = orderDetailId;
		this.orderId = orderId;
		this.prodId = prodId;
		this.total = total;
		this.prod_name = prod_name;
		this.prod_photo = prod_photo;
		this.quanity = quanity;
		this.subtotal = subtotal;
	}


	@Override
	public String toString() {
		return "OrderDetail [orderDetailId=" + orderDetailId + ", orderId=" + orderId +  ", prodId=" + prodId
				+ ", total=" + total + ", prod_name=" + prod_name + ", prod_photo=" + Arrays.toString(prod_photo)
				+ ", quanity=" + quanity + ", subtotal=" + subtotal + "]";
	}
	
	

}


	