package questionnaire;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import data.Questionnaire;
import data.QuestionnaireDAO;
import data.User;

public class QuestionList extends ActionSupport implements RequestAware,
		SessionAware {

	private Map session;

	private int uid;
	private Map request;

	private List<Questionnaire> questionList = new ArrayList<Questionnaire>();
	private QuestionnaireDAO questionnaireDAO;

	@Override
	public String execute() throws Exception {
		session = ActionContext.getContext().getSession();
		if (session.containsKey("user"))
			uid = ((User) session.get("user")).getUid();
		questionList = questionnaireDAO.findAll();
		System.out.println(uid + "");
		this.request.put("qList", questionList);
		String sql = "select distinct(subject) from questionnaire";
		String sql2 = "select  * from result where uid=" + uid;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String URL = "jdbc:mysql://localhost:3306/ideabox";
		Connection conn = DriverManager.getConnection(URL, "root", "123456");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		List<String> subjectList = new ArrayList<String>();
		while (rs.next()) {
			int columnId = rs.findColumn("subject");
			String q = rs.getString(columnId);
			// System.out.println(q);
			subjectList.add(q);
		}
		ArrayList<String> QuesAnswered = new ArrayList<String>();
		if (uid != -10000000) {
			ResultSet rs2 = stmt.executeQuery(sql2);
			while (rs2.next()) {
				QuesAnswered.add(rs2.getInt(rs2.findColumn("qid")) + "");
				System.out.println(rs2.getInt(rs2.findColumn("qid")) + "-----"
						+ rs2.getInt(rs2.findColumn("rid")));
			}
		}

		this.request.put("AList", QuesAnswered);
		this.request.put("sList", subjectList);
		return SUCCESS;
	}

	public List<Questionnaire> getQuestionList() {
		return questionList;
	}

	public QuestionnaireDAO getQuestionnaireDAO() {
		return questionnaireDAO;
	}

	public void setQuestionList(List<Questionnaire> questionList) {
		this.questionList = questionList;
	}

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}

	public Map getSession() {
		return session;
	}

	public Map getRequest() {
		return request;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public void setRequest(Map request) {
		this.request = request;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

}
