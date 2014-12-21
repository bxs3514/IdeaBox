package dashboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import data.Questionnaire;
import data.QuestionnaireDAO;
import data.Result;
import data.ResultDAO;
import data.User;

public class DashboardAction extends ActionSupport implements RequestAware,
		SessionAware {
	private QuestionnaireDAO questionnaireDAO;
	private int isavailabel;
	private ResultDAO resultDAO;
	private Map session;
	private Map request;

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}

	public void setResultDAO(ResultDAO resultDAO) {
		this.resultDAO = resultDAO;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		request = arg0;
	}

	@Override
	public String execute() throws Exception {

		return super.execute();
	}

	public String listPublished() throws Exception {
		// HttpServletRequest req = ServletActionContext.getRequest();
		// session = ActionContext.getContext().getSession();
		// if(session.get("user")==null)
		// { addFieldError("error","not log in");
		// return ERROR;
		// }
		User user = (User) session.get("user");
		long uid = user.getUid();
		List<Questionnaire> questionnaires = questionnaireDAO
				.findByInvestId(uid);

		request.put("publishedques", questionnaires);
		return "listPublished";
	}

	public String listAnswered() throws Exception {
		// HttpServletRequest req = ServletActionContext.getRequest();
		// session = ActionContext.getContext().getSession();
		// if(session.get("user")==null)
		// { addFieldError("error","not log in");
		// return ERROR;
		// }
		User user = (User) session.get("user");
		Integer uid = user.getUid();
		ArrayList<Questionnaire> quesAnswered = new ArrayList<Questionnaire>();
		List<Result> answeredques = resultDAO.findByUid(uid);
		List<Result> answeredToBeDel = new ArrayList<Result>();
		for (Result i : answeredques) {
			int qid = i.getQid();
			Questionnaire q = questionnaireDAO.findById((long) qid);
			if (q == null) {
				answeredToBeDel.add(i);

			} else
				quesAnswered.add(q);
		}
		for(Result i : answeredToBeDel)
		{
			answeredques.remove(i);
		}
		ArrayList<Result> quesResult = new ArrayList<Result>();
		for (Result i : answeredques) {
			int qid = i.getQid();
			quesResult.add(i);
		}

		this.session.put("result", quesResult);

		request.put("answeredtitles", quesAnswered);
		return "listAnswered";
	}

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		HttpServletRequest req = ServletActionContext.getRequest();
		session = ActionContext.getContext().getSession();
		if (!session.containsKey("user"))
			addFieldError("error", "not log in");

	}

	//
	// public String closeQuestionnaire() throws Exception {
	// isavailabel=0;
	// Questionnaire q = questionnaireDAO.findById(1l);
	// q.setIsavailable(isavailabel);
	// questionnaireDAO.merge(q);
	// return "closeQuestionnaire";
	// }

}
