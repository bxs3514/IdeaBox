package questionnaire;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import data.Question;
import data.QuestionDAO;
import data.QuestionnaireDAO;

public class Questions extends ActionSupport
implements RequestAware, SessionAware{
	private Integer id;
	private String no;
	private String type="";
	private String content="";
	private String choice="";
	
	private String wholeChoice = "";
	private QuestionDAO questionDAO;
	private Map session;
	private Map request;
	
	public void setNo(String no) {
		this.no = no;
	}
	
	public void setChoice(String choice) {
		this.choice = choice;
		
		String temp[] = choice.split(", ");
		
		for(String s : temp){
			//wholeChoice += choice;
		}
	}

	
	public void setType(String type) {
		this.type = type;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}
	
	@Override
	public String execute() throws Exception {
		//JSONArray json = new JSONArray();
		
		System.out.println("type:"+type+"choice: "+choice+";content: "+ content);
		//String[] temp = content.split();
		Question question= new Question(Integer.valueOf(type), content, choice);
		//Map<String, Object> m = new HashMap<String, Object>();
		
		//m.put("type", type);
		//m.put("content", content);
		
		this.questionDAO.save(question);
		id = question.getQuestionid();
		//System.out.println(content+" "+id);
		//System.out.println("1l"+no+"|"+id);
		//json.add(question);
		request.put(no, question);
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
