package bean;

public class Student {
	public int UserId;
	public String KnowledgeWanted;
	public int AcceptableFee;
	public String AvailableTime;
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		this.UserId = userId;
	}
	public String getKnowledgeWanted() {
		return KnowledgeWanted;
	}
	public void setKnowledgeWanted(String knowledgeWanted) {
		this.KnowledgeWanted = knowledgeWanted;
	}
	public int getAcceptableFee() {
		return AcceptableFee;
	}
	public void setAcceptableFee(int acceptableFee) {
		this.AcceptableFee = acceptableFee;
	}
	public String getAvailableTime() {
		return AvailableTime;
	}
	public void setAvailableTime(String availableTime) {
		this.AvailableTime = availableTime;
	}
	
}
