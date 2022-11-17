package com.loveGod.demo.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="pairDetail")
public class pairDetail  implements Serializable {
	private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="pairId")
		private Long pairId;
		
		@JoinColumn(name = "Id" , foreignKey=@ForeignKey(name = "fkc_mmm_idb"))
		@Column(name="idBoy", columnDefinition = "VARBINARY(MAX)")
		private RegisterModel idBoy;
		
		
		@JoinColumn(name = "Id" , foreignKey=@ForeignKey(name = "fkc_mmm_idg"))
		@Column(name="idGirl", columnDefinition = "VARBINARY(MAX)")
		private RegisterModel idGirl;
		
		@DateTimeFormat(pattern = "yyyy/MM/dd")
		@Temporal(TemporalType.DATE)
		@Column(name="pairDate", columnDefinition="datetime")
		private Date pairDate;
		
		@Column(name="coupon")
		private String coupon;
		
		
		public String getCoupon() {
			return coupon;
		}


		public void setCoupon(String coupon) {
			this.coupon = coupon;
		}


		@PrePersist
		public void onCreate() {
			if(pairDate == null) {
				pairDate = new Date();
			}
		}
		
	
		public pairDetail() {
		}

		public Long getPairId() {
			return pairId;
		}

		public void setPairId(Long pairId) {
			this.pairId = pairId;
		}

		public RegisterModel getIdBoy() {
			return idBoy;
		}

		public void setIdBoy(RegisterModel idBoy) {
			this.idBoy = idBoy;
		}

		public RegisterModel getIdGirl() {
			return idGirl;
		}

		public void setIdGirl(RegisterModel idGirl) {
			this.idGirl = idGirl;
		}

		public Date getPairDate() {
			return pairDate;
		}

		public void setPairDate(Date pairDate) {
			this.pairDate = pairDate;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((idBoy == null) ? 0 : idBoy.hashCode());
			result = prime * result + ((idGirl == null) ? 0 : idGirl.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			pairDetail other = (pairDetail) obj;
			if (idBoy == null) {
				if (other.idBoy != null)
					return false;
			} else if (!idBoy.equals(other.idBoy))
				return false;
			if (idGirl == null) {
				if (other.idGirl != null)
					return false;
			} else if (!idGirl.equals(other.idGirl))
				return false;
			return true;
		}
	
		
}

