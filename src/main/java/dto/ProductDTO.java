package dto;

public class ProductDTO {
	private int num;
	private String name;
	private String details; //상품 상세설명
	private int price;
	private int cnt;
	private String seller; //판매자 이름
	private String condition;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	@Override
	public String toString() {
		return "MemberDTO [num=" + num + ", name=" + name + ", details=" + details + ", price=" + price + ", cnt=" + cnt
				+ ", seller=" + seller + "]";
	}
}
