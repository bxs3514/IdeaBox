package dashboard;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.finder.ClassFinder.Annotatable;

import data.Questionnaire;
import data.QuestionnaireDAO;

/**
 * close one questionnaire
 * 
 * Close is one of four main actions of investigator 
 * @version 1.0
 * @author Tim Wong
 *
 */
public class ReopenQuestionnaire extends ActionSupport implements RequestAware, SessionAware
{	
	long qid;
	public void setQid(long qid) {
		this.qid = qid;
	}

	private Map session;
	private Map request;
	
	private QuestionnaireDAO reopenQuestionnaireDAO;
	
	public void setReopenQuestionnaireDAO(QuestionnaireDAO reopenQuestionnaireDAO) {
		this.reopenQuestionnaireDAO = reopenQuestionnaireDAO;
	}

	public QuestionnaireDAO getClose_questionnaireDAO() {
		return reopenQuestionnaireDAO;
	}

	public void setCloseQuestionnaireDAO(QuestionnaireDAO reopenQuestionnaireDAO) {
		this.reopenQuestionnaireDAO = reopenQuestionnaireDAO;
	}
	
	public Map getSession() {
		return session;
	}

	public Map getRequest() {
		return request;
	}

	public QuestionnaireDAO getQuestionnaireDAO() {
		return reopenQuestionnaireDAO;
	}



	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.reopenQuestionnaireDAO = questionnaireDAO;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
	
		this.session  = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
	
		this.request = arg0;
	}
	
	/**
	 * addFieleError and addActionError should be in the function validate()
	 * addFieldMessage and addActionMessage should be in the function execute()
	 */
	@Override
	public String execute() throws Exception {
		
		Questionnaire q =  reopenQuestionnaireDAO.findById(qid);

		q.setIsclosed(0);
		
		reopenQuestionnaireDAO.merge(q);		
		//use merge() to update and use save() to create new records in database  
		
	//	this.addActionMessage("���óɹ���");	//addActionMessage should be in function execute
		return SUCCESS;
	}
	


	/**
	 * addFieleError and addActionError should be in the function validate
	 * addFieldMessage and addActionMessage should be in the function Execute
	 */


}
