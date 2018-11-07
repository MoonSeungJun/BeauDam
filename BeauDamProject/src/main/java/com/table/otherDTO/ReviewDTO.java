package com.table.otherDTO;

public class ReviewDTO {
	
	private String id;
	
	private String code;

	private String sale_Code;

	private int score;

	private String review;

	private String created;

	public String getSaleCode() {
		return sale_Code;
	}

	public void setSaleCode(String sale_Code) {
		this.sale_Code = sale_Code;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
