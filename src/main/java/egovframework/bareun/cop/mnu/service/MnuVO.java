package egovframework.bareun.cop.mnu.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name  : MnuVO.java
 * @Description : 게시물에 대한 데이터 처리 모델
 * @Modification Information
 * 
 *     수정일                       수정자                                수정내용
 *     -------       --------   ---------------------------
 *   2021.03.22        김윤홍                               최초 생성
 *
 * @author 바른테크 김윤홍
 * @since 2021. 03. 22
 * @version 1.0
 * @see 
 * 
 */
@SuppressWarnings("serial")
public class MnuVO implements Serializable {

	
	/** 순번 */
	private int seqNo= 0;
	
	/** 대 메뉴 */
	private String topMnu = "";
	
	/** 중 메뉴 */
	private String midMnu = "";
	
	/** 소 메뉴 */
	private String botMnu = "";
	
	/** 메뉴 명 */
	private String mnuNm = "";
	
	/** 생성일자 */
	private String crtYmd = "";
	
	/** 생성자 ID */
	private String crtId = "";
	
	/** 수정일자 */
	private String mdfcnYmd = "";
	
	/** 수정자 ID */
	private String mdfcnId = "";
	
	/** 사용여부 */
	private String useYn = "";
	
	/** 정렬 번호 */
	private int sortNo = 0;
	
	
	/** Setter & Getter */

	
	public int getSeqNo() {
		return seqNo;
	}



	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}



	public String getTopMnu() {
		return topMnu;
	}



	public void setTopMnu(String topMnu) {
		this.topMnu = topMnu;
	}



	public String getMidMnu() {
		return midMnu;
	}



	public void setMidMnu(String midMnu) {
		this.midMnu = midMnu;
	}



	public String getBotMnu() {
		return botMnu;
	}



	public void setBotMnu(String botMnu) {
		this.botMnu = botMnu;
	}



	public String getMnuNm() {
		return mnuNm;
	}



	public void setMnuNm(String mnuNm) {
		this.mnuNm = mnuNm;
	}



	public String getCrtYmd() {
		return crtYmd;
	}



	public void setCrtYmd(String crtYmd) {
		this.crtYmd = crtYmd;
	}



	public String getCrtId() {
		return crtId;
	}



	public void setCrtId(String crtId) {
		this.crtId = crtId;
	}



	public String getMdfcnYmd() {
		return mdfcnYmd;
	}



	public void setMdfcnYmd(String mdfcnYmd) {
		this.mdfcnYmd = mdfcnYmd;
	}



	public String getMdfcnId() {
		return mdfcnId;
	}



	public void setMdfcnId(String mdfcnId) {
		this.mdfcnId = mdfcnId;
	}



	public String getUseYn() {
		return useYn;
	}



	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}



	public int getSortNo() {
		return sortNo;
	}



	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}



	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
