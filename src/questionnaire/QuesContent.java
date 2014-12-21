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

import data.Question;
import data.QuestionDAO;
import data.Questionnaire;
import data.QuestionnaireDAO;
import data.User;
import java.sql.Timestamp;

public class QuesContent extends ActionSupport
implements RequestAware, SessionAware{
	
	private ArrayList<Integer> id = new ArrayList<Integer>();

	private String no;
	private String type;
	private String content="";
	private String choice;
	private String title="";
	private String subject="";
	private String instruction="";
	private String contents = "";
	private String usernum = "";
	private String ipnum = "";
	private String anonymous = "";

	private QuestionDAO questionDAO;
	private QuestionnaireDAO questionnaireDAO;
	private Map session = ActionContext.getContext().getSession();
	private Map request;
	HttpServletRequest req = ServletActionContext.getRequest();
	
	public void setNo(String no) {
		this.no = no;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public void setChoice(String choice) {
		this.choice = choice;
	}

	

	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}

	public void setIpnum(String ipnum) {
		this.ipnum = ipnum;
	}

	public void setAnonymous(String anonymous) {
		this.anonymous = anonymous;
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println(no);
		int n = Integer.valueOf(no).intValue();
		
		title = (String)session.get("title");
		subject = (String)session.get("subject");
		instruction = (String)session.get("instruction");
		
		String[] tempType = type.split("\\|");
		String[] tempContent = content.split("\\|");
		String[] tempChoice = choice.split("%%");
		//for(String s : tempChoice){
			//System.out.println(s);
		//}
		for(int i = 0; i < n; i++){
			//System.out.println(Integer.valueOf(tempType[i])+ tempContent[i]+ tempChoice[i]);
			Question question = new Question(Integer.valueOf(tempType[i]), tempContent[i], tempChoice[i]);
			this.questionDAO.save(question);
			id.add(question.getQuestionid());
		}
		
		for(int i = 0; i < id.size(); i++){
			if(i < id.size() - 1)
				contents += String.valueOf(id.get(i))+"|";
			else contents += String.valueOf(id.get(i));
		}
		session = ActionContext.getContext().getSession();
		Questionnaire questionnaire = 
				new Questionnaire(Long.valueOf((((User)session.get("user")).getUid())), title, subject, contents);
		questionnaire.setDescription(instruction);
		questionnaire.setUsernum(Integer.valueOf(usernum));
		questionnaire.setIpnum(Integer.valueOf(ipnum));
		questionnaire.setAnonymous(Integer.valueOf(anonymous));
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		questionnaire.setCreatedate(currentTime);
		questionnaire.setLasteditdate(currentTime);
		questionnaire.setIsavailable(1);
		questionnaire.setIsclosed(1);
		questionnaire.setIscreated(1);
		this.questionnaireDAO.save(questionnaire);
		
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

}
