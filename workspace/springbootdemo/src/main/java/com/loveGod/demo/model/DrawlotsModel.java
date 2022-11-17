package com.loveGod.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="drawlots")
public class DrawlotsModel {
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="drawId")
		private Integer drawId;
		
		@Column(name="drawName")
		private String drawName;
		
		@Column(name="drawMean")
		private String drawMean;

		public Integer getDrawId() {
			return drawId;
		}

		public void setDrawId(Integer drawId) {
			this.drawId = drawId;
		}

		public String getDrawName() {
			return drawName;
		}

		public void setDrawName(String drawName) {
			this.drawName = drawName;
		}

		public String getDrawMean() {
			return drawMean;
		}

		public void setDrawMean(String drawMean) {
			this.drawMean = drawMean;
		}
	
	
		
	

}
