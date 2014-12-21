package closeQuestionnaire;

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
public class CloseQuestionnaire extends ActionSupport implements RequestAware, SessionAware
{	
	long qid;
	public void setQid(long qid) {
		this.qid = qid;
	}

	private int isavailabel;
	private Map session;
	private Map request;
	
	private QuestionnaireDAO closeQuestionnaireDAO;
	
	public QuestionnaireDAO getClose_questionnaireDAO() {
		return closeQuestionnaireDAO;
	}

	public void setCloseQuestionnaireDAO(QuestionnaireDAO closeQuestionnaireDAO) {
		this.closeQuestionnaireDAO = closeQuestionnaireDAO;
	}
	
	public Map getSession() {
		return session;
	}

	public Map getRequest() {
		return request;
	}

	public QuestionnaireDAO getQuestionnaireDAO() {
		return closeQuestionnaireDAO;
	}



	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.closeQuestionnaireDAO = questionnaireDAO;
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
		isavailabel=0;
		Questionnaire q =  closeQuestionnaireDAO.findById(qid);

		q.setIsavailable(isavailabel);
		
		
		closeQuestionnaireDAO.merge(q);		
		//use merge() to update and use save() to create new records in database  
		
	//	this.addActionMessage("���óɹ���");	//addActionMessage should be in function execute
		return SUCCESS;
	}
	


	/**
	 * addFieleError and addActionError should be in the function validate
	 * addFieldMessage and addActionMessage should be in the function Execute
	 */
	@Override
	public void validate() {
		
		if (isavailabel<0)
		{
			
			this.addFieldError("isavailabel", "isavailabelӦ��Ϊ0��1");
		}
		return;
	}
}
