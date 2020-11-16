package com.starbucks.sw4.admin.util;

public class Pager {

	// 데이터 검색 -----------------------------------------
	private String search;
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	// 페이징 처리 -----------------------------------------
	// 현재 페이지
	private Long curPage;
	
	// DB 총 row 수 확인
	private long startRow;
	private long lastRow;
	
	// 각 출력할 페이지 수
	private long perPage;
	
	// 화면에 노출될 페이지
	private long startNum;
	private long lastNum;
	
	// 이전 패이지 혹운 다음 페이지 유무 체크
	// 이를 기반으로 이전/다음 버튼 노출여부 결정됨
	private boolean beforeChk;
	private boolean nextChk;
	
	// DB 전체 게시글 수
	private long totalCount;
	
	public Pager() {
		this.perPage = 10;
	}
	
	// DB에서 가져올 Row 계산
	public void makeRow() {
		Pager pager = new Pager();
		this.startRow = ((this.getCurPage() * this.getPerPage()) - 9);
		this.lastRow = (this.getCurPage() * this.getPerPage());
	}
	
	// 페이지 생성 -----------------------------------------------------
	public void makePage() {
		
		// 1. 전체 페이지 수
		long totalPage = this.getTotalCount()/10;
		if(this.getTotalCount()%10 != 0) {
			totalPage++;
		}
		
		// 2. 전체 블럭 수
		long totalBlock = totalPage/10;
		if(totalPage%10 != 0) {
			totalBlock++;
		}
		
		// 3. curPage 이용한 현재 블럭 번호 찾기
		long curBlock = this.getCurPage()/5;
		if(this.getCurPage()%5 != 0) {
			curBlock++;
		}
		
		// 4. 현재 블럭번호 시작과 끝 번호 계산
		this.startNum = (curBlock * 10) - 9;
		this.lastNum = curBlock * 10;
		
		// 5. 현재 블럭번호와 전체 블럭번호가 같은지 확인
		this.nextChk = true;
		if(curBlock == totalBlock) {
			this.nextChk = false;
			lastNum = totalPage;
		}
		
		// 6. 현재 블럭번호와 첫 블럭번호가 같은지 확인
		this.beforeChk = true;
		if(curBlock == 1) {
			this.beforeChk = false;
		}
		
	}
	
	// Variable setter & getter -------------------------------
	public Long getCurPage() {
		if(this.curPage == null) this.curPage = (long)1;
		return curPage;
	}

	public void setCurPage(Long curPage) {
		if(curPage == null) curPage = (long)1;
		this.curPage = curPage;
	}

	public long getStartRow() {
		return startRow;
	}

	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}

	public long getLastRow() {
		return lastRow;
	}

	public void setLastRow(long lastRow) {
		this.lastRow = lastRow;
	}

	public long getPerPage() {
		return perPage;
	}

	public void setPerPage(long perPage) {
		this.perPage = perPage;
	}

	public long getStartNum() {
		return startNum;
	}

	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}

	public long getLastNum() {
		return lastNum;
	}

	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}

	public boolean isBeforeChk() {
		return beforeChk;
	}

	public void setBeforeChk(boolean beforeChk) {
		this.beforeChk = beforeChk;
	}

	public boolean isNextChk() {
		return nextChk;
	}

	public void setNextChk(boolean nextChk) {
		this.nextChk = nextChk;
	}

	public long getTotalCount() {
		if(totalCount == 0) totalCount = 1;
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	
}
