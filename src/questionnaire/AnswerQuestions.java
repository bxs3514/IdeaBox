package questionnaire;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import data.Questionnaire;
import data.QuestionnaireDAO;
import data.User;

public class AnswerQuestions extends ActionSupport implements RequestAware, SessionAware {
	private long qid = 5;
	

	private int uid;
	
	private Map session;
	private Map request;
	
	
	private QuestionnaireDAO questionnaireDAO;
	
	String outterHtml;
	
	public String getOutterHtml() {
		return outterHtml;
	}

	public void setOutterHtml(String outterHtml) {
		this.outterHtml = outterHtml;
	}

	public long getQid() {
		return qid;
	}

	public int getUid() {
		return uid;
	}

	public Map getSession() {
		return session;
	}

	public Map getRequest() {
		return request;
	}

	public QuestionnaireDAO getQuestionnaireDAO() {
		return questionnaireDAO;
	}

	public void setQid(long qid) {
		this.qid = qid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public void setRequest(Map request) {
		this.request = request;
	}

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}
	
	private FormQuestionnaire fq;
	
	public FormQuestionnaire getFq() {
		return fq;
	}

	public void setFq(FormQuestionnaire fq) {
		this.fq = fq;
	}

	@Override
	public String execute() throws Exception {
		Questionnaire q = questionnaireDAO.findById(qid);
		//FormQuestionnaire fq = new FormQuestionnaire();
		fq.setQid(qid);
		setOutterHtml(fq.getHtmlString(qid));
		this.request.put("outterHtml", outterHtml);
		System.out.println("asdasdfasdfasdf");
		this.request.put("canAnswer", true);
		return SUCCESS;
	}
	public String view() throws Exception {
		Questionnaire q = questionnaireDAO.findById(qid);
		//FormQuestionnaire fq = new FormQuestionnaire();
		fq.setQid(qid);
		setOutterHtml(fq.getHtmlString(qid));
		this.request.put("outterHtml", outterHtml);
		this.request.put("canAnswer", true);
		return SUCCESS;
	}
	@Override
	public void validate() {
		Questionnaire q = questionnaireDAO.findById(qid);
		Integer usernum = q.getUsernum();
		Integer ipnum = q.getIpnum();
		Integer anonymous = q.getAnonymous();
		Integer isavailable = q.getIsavailable();
		Integer isclosed = q.getIsclosed();
		
		if(isavailable == null || 0 == isavailable || (isclosed !=null && 1 == isclosed))
		{
			addFieldError("question1", "问卷当前不可用！");
		}

		User user = (User) this.session.get("user");
		if (anonymous != null && anonymous == 0 && user == null) {
			addActionError("该问卷不允许游客填写，请先登录");
			return;
		}
		return;
	}
	

}
