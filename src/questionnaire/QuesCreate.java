package questionnaire;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import data.QuestionnaireDAO;
import data.User;
import data.UserDAO;
import data.Questionnaire;


public class QuesCreate extends ActionSupport
	implements RequestAware, SessionAware{
	private String title;
	private String subject;
	private String instruction;
	private QuestionnaireDAO questionnaireDAO;
	private Map session;
	private Map request;
	
	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}
	
	@Override
	public void validate(){
		//System.out.println(title+" "+type+" "+instruction);
		if (this.title == null||this.title.equals("")) {
			//System.out.println(1);
			this.addFieldError("title", "题目不能为空");
		}  

		if (this.subject == null||this.subject.equals("")||this.subject.equals("请选择")) {
			//System.out.println(subject);
			this.addFieldError("subject", "请选择主题");
		}

		if (this.instruction==null||this.instruction.equals("")) {
			//System.out.println(3);
			this.addFieldError("instruction", "说明不能为空");
		}
		this.request.put("msg", "新建问卷失败");
	}
	
	@Override
	public String execute() throws Exception {
		
		//Questionnaire qusetionnaire = new Questionnaire();
		//this.questionnaireDAO.save(qusetionnaire);
		this.request.put("msg", "新建问卷成功");
		this.session.put("title", title);
		this.session.put("subject", subject);
		this.session.put("instruction", instruction);
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}
}
