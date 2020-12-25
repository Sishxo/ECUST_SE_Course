package bean;

public class Teacher {
	public int UserId;
	public String KnowledgeGoodAt;
	public int WantedFee;
	public String AvailableTime;
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		this.UserId = userId;
	}
	public String getKnowledgeGoodAt() {
		return KnowledgeGoodAt;
	}
	public void setKnowledgeGoodAt(String knowledgeGoodAt) {
		this.KnowledgeGoodAt = knowledgeGoodAt;
	}
	public int getWantedFee() {
		return WantedFee;
	}
	public void setWantedFee(int wantedFee) {
		this.WantedFee = wantedFee;
	}
	public String getAvailableTime() {
		return AvailableTime;
	}
	public void setAvailableTime(String availableTime) {
		this.AvailableTime = availableTime;
	}
}
