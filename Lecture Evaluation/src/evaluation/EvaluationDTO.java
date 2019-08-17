package evaluation;
public class EvaluationDTO {

	int evaluationID;
	String userID;
	String lectureName;
	String professorName;
	int lectureYear;
	String semesterDivide;
	String lectureDivide;
	String evaluationTitle;
	String evaluationContent;
	String totalScore;
	String creditScore;
	String comfortableScore;
	String lectureScore;
	int likeCount;
	/**
	 * @return evaluationID
	 */
	public int getEvaluationID() {
		return evaluationID;
	}
	/**
	 * @param evaluationID セットする evaluationID
	 */
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	/**
	 * @return userID
	 */
	public String getUserID() {
		return userID;
	}
	/**
	 * @param userID セットする userID
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	/**
	 * @return lectureName
	 */
	public String getLectureName() {
		return lectureName;
	}
	/**
	 * @param lectureName セットする lectureName
	 */
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	/**
	 * @return professorName
	 */
	public String getProfessorName() {
		return professorName;
	}
	/**
	 * @param professorName セットする professorName
	 */
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	/**
	 * @return lectureYear
	 */
	public int getLectureYear() {
		return lectureYear;
	}
	/**
	 * @param lectureYear セットする lectureYear
	 */
	public void setLectureYear(int lectureYear) {
		this.lectureYear = lectureYear;
	}
	/**
	 * @return semesterDivide
	 */
	public String getSemesterDivide() {
		return semesterDivide;
	}
	/**
	 * @param semesterDivide セットする semesterDivide
	 */
	public void setSemesterDivide(String semesterDivide) {
		this.semesterDivide = semesterDivide;
	}
	/**
	 * @return lectureDivide
	 */
	public String getLectureDivide() {
		return lectureDivide;
	}
	/**
	 * @param lectureDivide セットする lectureDivide
	 */
	public void setLectureDivide(String lectureDivide) {
		this.lectureDivide = lectureDivide;
	}
	/**
	 * @return evaluationTitle
	 */
	public String getEvaluationTitle() {
		return evaluationTitle;
	}
	/**
	 * @param evaluationTitle セットする evaluationTitle
	 */
	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}
	/**
	 * @return evaluationContent
	 */
	public String getEvaluationContent() {
		return evaluationContent;
	}
	/**
	 * @param evaluationContent セットする evaluationContent
	 */
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	/**
	 * @return totalScore
	 */
	public String getTotalScore() {
		return totalScore;
	}
	/**
	 * @param totalScore セットする totalScore
	 */
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	/**
	 * @return creditScore
	 */
	public String getCreditScore() {
		return creditScore;
	}
	/**
	 * @param creditScore セットする creditScore
	 */
	public void setCreditScore(String creditScore) {
		this.creditScore = creditScore;
	}
	/**
	 * @return comfortableScore
	 */
	public String getComfortableScore() {
		return comfortableScore;
	}
	/**
	 * @param comfortableScore セットする comfortableScore
	 */
	public void setComfortableScore(String comfortableScore) {
		this.comfortableScore = comfortableScore;
	}
	/**
	 * @return lectureScore
	 */
	public String getLectureScore() {
		return lectureScore;
	}
	/**
	 * @param lectureScore セットする lectureScore
	 */
	public void setLectureScore(String lectureScore) {
		this.lectureScore = lectureScore;
	}
	/**
	 * @return likeCount
	 */
	public int getLikeCount() {
		return likeCount;
	}
	/**
	 * @param likeCount セットする likeCount
	 */
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public EvaluationDTO(int evaluationID, String userID, String lectureName, String professorName, int lectureYear,
			String semesterDivide, String lectureDivide, String evaluationTitle, String evaluationContent,
			String totalScore, String creditScore, String comfortableScore, String lectureScore, int likeCount) {
		super();
		this.evaluationID = evaluationID;
		this.userID = userID;
		this.lectureName = lectureName;
		this.professorName = professorName;
		this.lectureYear = lectureYear;
		this.semesterDivide = semesterDivide;
		this.lectureDivide = lectureDivide;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.totalScore = totalScore;
		this.creditScore = creditScore;
		this.comfortableScore = comfortableScore;
		this.lectureScore = lectureScore;
		this.likeCount = likeCount;
	}

}