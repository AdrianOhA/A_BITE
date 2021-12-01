package com.abite.common.service;

public class Pager {
	
	public static int ROW_COUNT = 10;		// 페이지별 기본 row 수
	public static int ITEM_COUNT = 5;		// 페이지별 기본 페이지 항목 수

	private int pageno = 1;					// 현재 페이지 번호	
	private int rowCount = ROW_COUNT;		// fetch할 row 수 (페이지당 row 수)
	private int pageItemCount = ROW_COUNT;	// 페이지별 페이지 항목  수

	private int totalCount;					// 모든 레코드 수
	private int totalPageCount;				// 모든 페이지 수
	private int beginRownum;				// 시작 rownum
	private int endRownum;					// 끝 rownum
	
	// << < 1 2 3 4 5 > >>
	private int beginPageno;				// page index 시작 페이지   [<<]
	private int endPageno;					// page index 끝 페이지     [>>]
	private int prevPageno;					// page index "이전" 페이지 [<]
	private int nextPageno;					// page index "다음" 페이지 [>]
	
	private int startSeqno;					// 페이지에서 보여줄 시작 번호
	private int[] pageList;					// 페이지 목록

	public Pager() {
	}
	
	public Pager(int pageno, int totalCount) {
		compute(pageno, ROW_COUNT, ITEM_COUNT, totalCount);
	}
	
	public Pager(int pageno, int rowCount, int totalCount) {
		compute(pageno, rowCount, ITEM_COUNT, totalCount);
	}
	
	public Pager(int pageno, int rowCount, int pageItemCount, int totalCount) {
		compute(pageno, rowCount, pageItemCount, totalCount);
	}
	
	public void compute(int pageno, int totalCount) {
		compute(pageno, ROW_COUNT, ITEM_COUNT, totalCount);
	}

	public void compute(int pageno, int rowCount, int totalCount) {
		compute(pageno, rowCount, ITEM_COUNT, totalCount);
	}

	public void compute(int pageno, int rowCount, int pageItemCount, int totalCount) {
		
		if (totalCount < 1) {
			return;
		}
		
		this.pageno = pageno;
		this.totalCount = totalCount;
		this.rowCount = rowCount;
		this.pageItemCount = pageItemCount;
		
		if (rowCount == -1) {
			totalPageCount = 1;
		}
		else {
			totalPageCount = (int)(totalCount + (rowCount - 1)) / rowCount;
		}
		
		beginPageno =  pageno - ((pageno-1) % pageItemCount);
		if (beginPageno == 0) {
			beginPageno = 1;
		}
		endPageno = Math.min(beginPageno + pageItemCount - 1, totalPageCount);
		
		if (rowCount == -1) {
			beginRownum = 0;
			endRownum = totalCount;
		}
		else {
			beginRownum = (pageno - 1) * rowCount;
			endRownum = Math.min(beginRownum + rowCount - 1, totalCount);
		}

		prevPageno = Math.max(1, beginPageno - 1);
		nextPageno = Math.min(endPageno + 1, totalPageCount);
		
		startSeqno = totalCount - beginRownum;

		int index = 0;
		pageList = new int[endPageno-beginPageno+1];
		for (int pno = beginPageno; pno <= endPageno; pno++) {
			pageList[index++] = pno;
		}
	}

	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageItemCount() {
		return pageItemCount;
	}

	public void setPageItemCount(int pageItemCount) {
		this.pageItemCount = pageItemCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getBeginRownum() {
		return beginRownum;
	}

	public void setBeginRownum(int beginRownum) {
		this.beginRownum = beginRownum;
	}

	public int getEndRownum() {
		return endRownum;
	}

	public void setEndRownum(int endRownum) {
		this.endRownum = endRownum;
	}

	public int getBeginPageno() {
		return beginPageno;
	}

	public void setBeginPageno(int beginPageno) {
		this.beginPageno = beginPageno;
	}

	public int getEndPageno() {
		return endPageno;
	}

	public void setEndPageno(int endPageno) {
		this.endPageno = endPageno;
	}

	public int getPrevPageno() {
		return prevPageno;
	}

	public void setPrevPageno(int prevPageno) {
		this.prevPageno = prevPageno;
	}

	public int getNextPageno() {
		return nextPageno;
	}

	public void setNextPageno(int nextPageno) {
		this.nextPageno = nextPageno;
	}

	public int getStartSeqno() {
		return startSeqno;
	}

	public void setStartSeqno(int startSeqno) {
		this.startSeqno = startSeqno;
	}

	public int[] getPageList() {
		return pageList;
	}

	public void setPageList(int[] pageList) {
		this.pageList = pageList;
	}
}
