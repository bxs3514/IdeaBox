/*******************
 * @author pan foo
 */
package questionnaire;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;

import data.Question;
import data.QuestionDAO;
import data.Questionnaire;
import data.QuestionnaireDAO;

public class FormQuestionnaire {
	private long qid;

	// /a questionnaire may contain a usernum or an ipnum
	private long uid;// user id
	private String ip;// ip

	private Map session;

	private Map request;

	ApplicationContext actx;
	private QuestionnaireDAO questionnaireDAO;
	private QuestionDAO questionDAO;

	// //////////////////////////////////////

	private int[] questionId;

	/****************
	 * find question list of a certain questionnaire
	 * 
	 * @param QID
	 * @return int[] question IDs that are included in the questionnaire with
	 *         QID
	 */
	private int[] getQuestionIds(long QID) {
		String strQuestionID = ""; // question ID from table questionnaire
		System.out.println(QID + "");
		Questionnaire qtemp = questionnaireDAO.findById(QID);
		strQuestionID = qtemp.getContent();
		System.out.println(strQuestionID);
		String[] strQids = strQuestionID.split("\\|");
		int[] qids = new int[strQids.length];
		for (String i : strQids) {
			System.out.println(i);
		}
		System.out.println("\tlength:  " + strQids.length);
		for (int i = 0; i < strQids.length; i++) {
			System.out.println(strQids[i]);
			qids[i] = Integer.parseInt(strQids[i]);
		}
		return qids;
	}

	/****************
	 * 
	 * @param QID
	 * @return QUESTIONNAIRE TITLE
	 */
	private String getQuestionnaireTitle(long QID) {
		String title = "";

		Questionnaire qtemp = questionnaireDAO.findById(QID);
		title = qtemp.getTitle();
		// TODO add codes
		return title;
	}

	/***********
	 * 
	 * @param QID
	 * @return questionnaire subject
	 */
	private String getQuestionnaireSubject(long QID) {
		// TODO add codes
		String subject = "";

		Questionnaire qtemp = questionnaireDAO.findById(QID);
		subject = qtemp.getSubject();
		return subject;
	}

	/********
	 * 
	 * @param QID
	 * @return questionnaire description
	 */
	private String getQuestionnaireDes(long QID) {
		// TODO add codes
		String description = "";

		Questionnaire qtemp = questionnaireDAO.findById(QID);
		description = qtemp.getDescription();
		return description;
	}

	/****************
	 * 
	 * @param questionids
	 * @return list of question included in the questionnaire
	 */
	private List<Question> getQuestions(int[] qids) {
		List<Question> questionList = new ArrayList<Question>();
		int length = qids.length;

		for (int i = 0; i < length; i++) {
			Question q = questionDAO.findById(qids[i]);
			questionList.add(q);
		}

		return questionList;
	}

	/**********
	 * 0 single 1 multiple 2 yes or no 3 fill in
	 * 
	 * @author p4n
	 */
	public enum QTYPE {
		SINGLE_CHOICE, MULTIPLE_CHOICE, YES_OR_NO, FILL_IN;
	};

	/**
	 * <!--title--> <div class="row"><h1 class="text-center">-title-</h1></div>
	 * 
	 * <!--subject--> <div class="row">
	 * <p * class="text-center">
	 * <strong>类别：-subject-</strong>
	 * </p>
	 * </div>
	 * 
	 * <!--description--> <div class="row">
	 * <p * class="col-md-6 col-md-offset-3">
	 * -description-
	 * </p>
	 * <hr />
	 * </div>
	 * 
	 * <!--questioncontent--> <div class="row">
	 * <p * class="col-md-6 col-md-offset-3" * >
	 * <strong>-questionnum-:-questioncontent-</strong>
	 * </p>
	 * </div>
	 * 
	 * <!--radio question option--> <div class="row"><div
	 * class="col-md-6 col-md-offset-3"><div class="radio"><label><input
	 * type="radio" name="question-questionnum-" id="optionsRadios1"
	 * value="-answer-" /> -optioncontent-</label></div></div></div>
	 * 
	 * <!--checkbox question option--> <div class="row"><div
	 * class="form-control col-md-6 col-md-offset-3"><div
	 * class="checkbox"><label><input type="checkbox"
	 * name="question-questionnum-" /> -optioncontent-</label></div></div></div>
	 * 
	 * <!--textarea--> <div class="row"><textarea name="question-questionnum-"
	 * class="col-md-6 col-md-offset-3"></textarea></div>
	 */

	public String getHtmlString(long QID) {
		String resultHtml = "";
		int[] questionIds = getQuestionIds(QID);
		String title = getQuestionnaireTitle(QID);
		String subject = getQuestionnaireSubject(QID);
		String description = getQuestionnaireDes(QID);
		List<Question> questionList = getQuestions(questionIds);
		System.out.println("question size: " + questionList.size());
		resultHtml += addTitle(title);
		resultHtml += addSubject(subject);
		resultHtml += addDescription(description);
		resultHtml += addQuesNum(questionList.size(),QID);
		for (int i = 0; i < questionList.size(); i++) {
			int optionNum = 0;
			String strOptionContent = "";
			Question q = questionList.get(i);
			int questionNum = i + 1;
			String questionContent = q.getContent();
			System.out.println(questionNum + questionContent);
			strOptionContent = q.getChoice();
			String[] optionContent = strOptionContent.split("\\|");
			optionNum = optionContent.length;
			int type = q.getType();
			// 0 single 1 multiple 2 yes or no 3 fill in
			switch (type) {
			case 0:
				// single
				resultHtml += addSingleChoice(questionNum, questionContent,
						optionNum, optionContent);
				break;
			case 1:
				// multiple
				resultHtml += addMultipleChoice(questionNum, questionContent,
						optionNum, optionContent);
				break;
			case 2:
				// yes or no
				resultHtml += addYesOrNoQuestion(questionNum, questionContent);
				break;
			case 3:
				// fill in
				resultHtml += addFillInQuestion(questionNum, questionContent);
				break;
			}
		}

		return resultHtml;
	}

	/**
	 * 
	 * @param qNum
	 * @return a hidden input param contain the amount of the questions
	 */
	private String addQuesNum(int qNum, long qid) {
		String result = "";

		// <input type="hidden" name="quest" value="qNum" >
		result += "<input type=\"hidden\" name=\"quesNum\" value=\"" + qNum
				+ " \" >";
		result += "<input type=\"hidden\" name=\"qid\" value=\"" + qid
				+ " \" >";
		return result;

	}

	private String addTitle(String title) {
		String result = "";
		// <div class="row"><h1 class="text-center">-title-</h1></div>
		result = "<div class=\"row\"><h1 class=\"text-center\">" + title
				+ "</h1></div>";
		return result;
	}

	private String addSubject(String subject) {
		String result = "<div class=\"row\"><p class=\"text-center\"><strong>类别：-subject-</strong></p></div>";
		result = result.replace("-subject-", subject);
		System.out.println(subject + "\n" + result);
		return result;
	}

	private String addDescription(String description) {
		String result = "<div class=\"row\"><p class=\"col-md-6 col-md-offset-3\">-description-</p></div><div class=\"col-md-6 col-md-offset-3\"><hr /></div>";
		result = result.replace("-description-", description);
		return result;
	}

	private String addSingleChoice(int questionNum, String questionContent,
			int optionNum, String[] optionContent) {
		String result = "";

		result += "<div class=\"row\"><p class=\"col-md-6 col-md-offset-3\"><strong>-questionnum-:-questioncontent-</strong></p></div>";
		result = result.replace("-questionnum-", questionNum + "");
		result = result.replace("-questioncontent-", questionContent);
		for (int i = 0; i < optionNum; i++) {
			result += "<div class=\"row\"><div class=\"col-md-6 col-md-offset-3\"><div class=\"radio\"><label><input type=\"radio\" name=\"question-questionnum-\" id=\"optionsRadios1\" value=\"-answer-\" /> -optioncontent-</label></div></div></div>";
			result = result.replace("-questionnum-", questionNum + "");
			result = result.replace("-optioncontent-", optionContent[i]);
			char answer = (char) ('A' + i);
			result = result.replace("-answer-", answer + "");
		}

		result += "<br />";

		return result;
	}

	private String addMultipleChoice(int questionNum, String questionContent,
			int optionNum, String[] optionContent) {
		String result = "";
		result += "<div class=\"row\"><p class=\"col-md-6 col-md-offset-3\"><strong>-questionnum-:-questioncontent-</strong></p></div>";
		result = result.replace("-questionnum-", questionNum + "");
		result = result.replace("-questioncontent-", questionContent);
		for (int i = 0; i < optionNum; i++) {
			result += "<div class=\"row\"><div class=\"col-md-6 col-md-offset-3\"><div class=\"checkbox\"><label><input type=\"checkbox\" name=\"question-questionnum-\" value=\"-answer-\" /> -optioncontent-</label></div></div></div>";
			result = result.replace("-questionnum-", questionNum + "");
			result = result.replace("-optioncontent-", optionContent[i]);
			char answer = (char) ('A' + i);
			result = result.replace("-answer-", answer + "");
		}
		result += "<br />";

		return result;
	}

	private String addYesOrNoQuestion(int questionNum, String questionContent) {
		String result = "";
		result += "<div class=\"row\"><p class=\"col-md-6 col-md-offset-3\"><strong>-questionnum-:-questioncontent-</strong></p></div>";
		result = result.replace("-questionnum-", questionNum + "");
		result += "<div class=\"row\"><div class=\"col-md-6 col-md-offset-3\"><div class=\"radio\"><label><input type=\"radio\" name=\"question-questionnum-\" id=\"optionsRadios1\" value=\"1\" />是</label></div></div></div>";
		result += "<div class=\"row\"><div class=\"col-md-6 col-md-offset-3\"><div class=\"radio\"><label><input type=\"radio\" name=\"question-questionnum-\" id=\"optionsRadios1\" value=\"0\" />否</label></div></div></div>";
		result = result.replace("-questionnum-", questionNum + "");
		result = result.replace("-questioncontent-", questionContent);
		result += "<br />";
		return result;
	}

	private String addFillInQuestion(int questionNum, String questionContent) {
		String result = "";
		result += "<div class=\"row\"><p class=\"col-md-6 col-md-offset-3\"><strong>-questionnum-:-questioncontent-</strong></p></div>";
		result = result.replace("-questionnum-", questionNum + "");
		result += "<div class=\"row\"><textarea name=\"question-questionnum-\" class=\"col-md-6 col-md-offset-3\"  onkeypress=\"return imposeMaxLength(this,150);\"></textarea></div>";
		result = result.replace("-questionnum-", questionNum + "");
		result += "<br />";
		result = result.replace("-questioncontent-", questionContent);
		return result;
	}

	// /////////////////////////////////////////////////

	/*********************************
	 * setters and getters
	 **********************************/
	public long getQid() {
		return qid;
	}

	public long getUid() {
		return uid;
	}

	public String getIp() {
		return ip;
	}

	public Map getSession() {
		return session;
	}

	public Map getRequest() {
		return request;
	}

	public void setQid(long qid) {
		this.qid = qid;
	}

	public void setUid(long uid) {
		this.uid = uid;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public void setRequest(Map request) {
		this.request = request;
	}

	public FormQuestionnaire() {

	}

	public QuestionnaireDAO getQuestionnaireDAO() {
		return questionnaireDAO;
	}

	public QuestionDAO getQuestionDAO() {
		return questionDAO;
	}

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

}
