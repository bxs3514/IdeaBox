package questionnaire;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import data.QuestionDAO;
import data.Questionnaire;
import data.QuestionnaireDAO;
import data.Result;
import data.ResultDAO;
import data.User;

public class AnsweredQues extends ActionSupport  implements RequestAware, SessionAware{

	private Map session;
	private Map request;
	
	private int rid;
	private QuestionnaireDAO questionnaireDAO;
	private ResultDAO resultDAO;
	//private QuestionDAO questionDAO;
	private int qid;
	
	private FormQuestionnaire fq;
	
	
	
	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public ResultDAO getResultDAO() {
		return resultDAO;
	}

	public void setResultDAO(ResultDAO resultDAO) {
		this.resultDAO = resultDAO;
	}

	public QuestionnaireDAO getQuestionnaireDAO() {
		return questionnaireDAO;
	}

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}

	public FormQuestionnaire getFq() {
		return fq;
	}

	public void setFq(FormQuestionnaire fq) {
		this.fq = fq;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public Map getSession() {
		return session;
	}

	public Map getRequest() {
		return request;
	}

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	@Override
	public void setRequest(Map arg0) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	@Override
	public String execute() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		session = ActionContext.getContext().getSession();
		
		User user = (User) session.get("user");
		Result r = resultDAO.findById(rid);
		fq.setQid(qid);
		this.session.put("outterhtml", fq.getHtmlString(qid));
		ArrayList <Result> quesResult = new ArrayList<Result>();
		List<Result> answeredques= resultDAO.findByUid(user.getUid());
		for (Result i : answeredques)
		{
			int qid = i.getQid();
			quesResult.add(i);
		}
		this.session.put("r", r);
		this.session.put("result", quesResult);
		this.session.put("r", r);
		return SUCCESS;
	}
	

}
