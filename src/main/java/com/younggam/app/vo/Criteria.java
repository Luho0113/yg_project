package com.younggam.app.vo;

public class Criteria {
	private int page;
	private int perPageNum;

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		int cnt = this.perPageNum;
		
		if(perPageNum != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = perPageNum;
		}
	}
	@Override
	public String toString() {
		return "Criteria[page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
