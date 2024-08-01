package kosa.model;

public class Search {
	private String[] area; //title, writer값이 들어감.
	private String searchKey;
	
	public Search() {}

	public Search(String[] area, String searchKey) {
		super();
		this.area = area;
		this.searchKey = searchKey;
	}

	public String[] getArea() {
		return area;
	}

	public void setArea(String[] area) {
		this.area = area;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	
}
