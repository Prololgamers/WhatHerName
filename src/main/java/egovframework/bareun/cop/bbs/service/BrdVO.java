package egovframework.bareun.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name  : Board.java
 * @Description : 게시물에 대한 데이터 처리 모델
 * @Modification Information
 * 
 *     수정일                       수정자                                수정내용
 *     -------       --------   ---------------------------
 *   2021.02.05        김윤홍                               최초 생성
 *
 * @author 바른테크 김윤홍
 * @since 2021. 02. 05
 * @version 1.0
 * @see 
 * 
 */
@SuppressWarnings("serial")
public class BrdVO implements Serializable {

	
	/** 게시글 순번 */
	private int seqNo= 0;
	
	/** 게시판 구분 코드 */
	private String bodCod = "";
	
	/** 게시글 제목 */
	private String title = "";
	
	/** 게시글 내용 */
	private String contents = "";
	
	/** 첨부파일 */
	private String file = "";
	
	/** 첨부파일 명 */
	private String fileNm = "";
	
	/** 첨부파일 크기 */
	private String fileSize = "";
	
	/** 작성자 ID */
	private String wrtId = "";
	
	/** 작성일자 */
	private String wrtYmd = "";
	
	/** 수정일자 */
	private String mdfcnYmd = "";
	
	/** 공개여부 */
	private String rlsYn = "";
	
	/** 삭제여부 */ 
	private String delYn = "";
		
	
	/** Setter & Getter  */
	
	
	public int getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}

	public String getBodCod() {
		return bodCod;
	}

	public void setBodCod(String bodCod) {
		this.bodCod = bodCod;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getWrtId() {
		return wrtId;
	}

	public void setWrtId(String wrtId) {
		this.wrtId = wrtId;
	}

	public String getWrtYmd() {
		return wrtYmd;
	}

	public void setWrtYmd(String wrtYmd) {
		this.wrtYmd = wrtYmd;
	}

	public String getMdfcnYmd() {
		return mdfcnYmd;
	}

	public void setMdfcnYmd(String mdfcnYmd) {
		this.mdfcnYmd = mdfcnYmd;
	}

	public String getRlsYn() {
		return rlsYn;
	}

	public void setRlsYn(String rlsYn) {
		this.rlsYn = rlsYn;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
