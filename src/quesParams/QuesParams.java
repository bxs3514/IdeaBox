package quesParams;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.finder.ClassFinder.Annotatable;

import data.Questionnaire;
import data.QuestionnaireDAO;

/**
 * set the params of a questionnaire
 * 
 * @version 1.0
 * @author Pan Foo , Tim Wong
 *
 */
public class QuesParams extends ActionSupport implements RequestAware, SessionAware
{
	//initialize the params to the illegal in order to make sure every param is not empty
	//cuz we do not have a in-page params check , we could only check it in the java code. 
	private int usernum = -1;
	private int ipnum = -1;
	private int anonymous;
	//private long qid=2;
	
	//FIXME there is supposed to be a param 'qid' represent for the QUESTIONNAIRE ID 
	// but there is no instance running now. QID param need to be added later.
	//--fp @2014/7/3
	
	private Map session;
	private Map request;
	
	private QuestionnaireDAO questionnaireDAO;
	
	
	public int getUsernum() {
		return usernum;
	}

	public int getIpnum() {
		return ipnum;
	}

	public int getAnonymous() {
		return anonymous;
	}

//	public long getQid() {
//		return qid;
//	}
//FIXME QID getter
	public Map getSession() {
		return session;
	}

	public Map getRequest() {
		return request;
	}

	public QuestionnaireDAO getQuestionnaireDAO() {
		return questionnaireDAO;
	}

	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}

	public void setIpnum(int ipnum) {
		this.ipnum = ipnum;
	}

	public void setAnonymous(int anonymous) {
		this.anonymous = anonymous;
	}

//	public void setQid(long qid) {
//		this.qid = qid;
//	}
//
//FIXME QID Setter

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
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
		Questionnaire q =  questionnaireDAO.findById(2l);
		q.setAnonymous(anonymous);
		q.setIpnum(ipnum);
		q.setUsernum(usernum);
		
		questionnaireDAO.merge(q);		
		//use merge() to update and use save() to create new records in database  
		
		this.addActionMessage("设置成功！");	//addActionMessage should be in function execute
		return SUCCESS;
	}
	
	/**
	 * addFieleError and addActionError should be in the function validate
	 * addFieldMessage and addActionMessage should be in the function Execute
	 */
	@Override
	public void validate() {
		//boolean allParamsRight = true;
		if (anonymous!= 0 && anonymous != 1)
		{
			System.out.println(anonymous+"");
			
			this.addFieldError("anonymous", "请正确填写参数！");
			//addActionMessage should be in function validate
		}
		if (ipnum <0)
		{
			
			this.addFieldError("ipnum", "每个IP允许填写问卷数量应当大于0！");
		}
		if (usernum <0)
		{
			
			this.addFieldError("usernum", "每个用户允许填写问卷数量应大于0！");
		}
		return;
	}
}
