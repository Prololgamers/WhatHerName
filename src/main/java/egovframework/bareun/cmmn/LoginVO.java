package egovframework.bareun.cmmn;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.03    박지욱          최초 생성
 *
 *  @author 공통서비스 개발팀 박지욱
 *  @since 2009.03.03
 *  @version 1.0
 *  @see
 *  
 */
public class LoginVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	
	
	/** 순번 */
	private int seqNo = 0;	
	/** 아이디 */
	private String usrId = "";
	/** 사용자 명 */
	private String usrNm = "";
	/** 사용자 권한 코드 */
	private String authCod = "";
	/** 비밀번호 */
	private String usrPwd = "";
	/** 전화번호 */
	private String mblTelno = "";
	/** 이메일 */
	private String eml = "";
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
	
	/** 권한 관련 */
	private String authNm="";
	
	
	
	/** Setter & Getter  */
	
	public int getSeqNo() {
		return seqNo;
	}
	public String getAuthNm() {
		return authNm;
	}
	public void setAuthNm(String authNm) {
		this.authNm = authNm;
	}
	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}
	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public String getUsrNm() {
		return usrNm;
	}
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	public String getAuthCod() {
		return authCod;
	}
	public void setAuthCod(String authCod) {
		this.authCod = authCod;
	}
	public String getUsrPwd() {
		return usrPwd;
	}
	public void setUsrPwd(String usrPwd) {
		this.usrPwd = usrPwd;
	}
	public String getMblTelno() {
		return mblTelno;
	}
	public void setMblTelno(String mblTelno) {
		this.mblTelno = mblTelno;
	}
	public String getEml() {
		return eml;
	}
	public void setEml(String eml) {
		this.eml = eml;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
}
