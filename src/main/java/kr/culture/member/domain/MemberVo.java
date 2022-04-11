package kr.culture.member.domain;

import org.apache.ibatis.type.Alias;

@Alias("memberVo")
public class MemberVo {
	private String userId; //아이디
	private String userPw; //비번
	private String userPwComfirm; //비번 확인
	private String userNm; //이름
	private String userPhoneNum; //전화번호
	private String userEmail; //이메일
	private String createDate; //생성날짜
	private String updateDate; //수정날짜
	
	
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserPwComfirm() {
		return userPwComfirm;
	}
	public void setUserPwComfirm(String userPwComfirm) {
		this.userPwComfirm = userPwComfirm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserPhoneNum() {
		return userPhoneNum;
	}
	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

}
