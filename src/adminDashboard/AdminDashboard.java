package adminDashboard;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import data.Questionnaire;
import data.QuestionnaireDAO;
import data.Result;
import data.ResultDAO;
import data.User;
import data.UserDAO;

public class AdminDashboard extends ActionSupport implements RequestAware,
		SessionAware {
	/**
	 * 
	 */
	private int uid;
	private long qid;
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private QuestionnaireDAO questionnaireDAO;
	private ResultDAO resultDAO;
	public Map<String, Object> session;
	public Map<String, Object> request;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}

	public void setResultDAO(ResultDAO resultDAO) {
		this.resultDAO = resultDAO;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public void setQid(long qid) {
		this.qid = qid;
	}

	@Override
	public void setSession(java.util.Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void setRequest(java.util.Map<String, Object> arg0) {
		this.request = arg0;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	@SuppressWarnings("deprecation")
	public String listUser() {
		List<User> users = userDAO.findAll();
		int userNum = users.size();
		request.put("users", users);
		request.put("userNum", userNum);
		// 获取每日数据
		Date dt = new Date(System.currentTimeMillis());
		int user2DNum = 0;
		for (User u : users) {
			if (u.getCreatedate() != null) {
				if (dt.getYear() == u.getCreatedate().getYear()
						&& dt.getMonth() == u.getCreatedate().getMonth()
						&& dt.getDay() == u.getCreatedate().getDay()) {
					user2DNum++;
				}
			}
		}
		request.put("user2DNum", user2DNum);
		return "listUser";
	}

	@SuppressWarnings("deprecation")
	public String listQues() {
		// 获取数据库
		List<Questionnaire> questionnaires = questionnaireDAO.findAll();
		List<Result> results = resultDAO.findAll();
		request.put("questionnaires", questionnaires);
		request.put("results", results);
		// 获取总数
		int quesNum = questionnaires.size();
		int resultNum = results.size();
		request.put("quesNum", quesNum);
		request.put("resultNum", resultNum);
		// 获取每日数据
		Date dt = new Date(System.currentTimeMillis());
		int ques2DNum = 0;

		for (Questionnaire q : questionnaires) {
			if (q.getCreatedate() != null) {
				if (dt.getYear() == q.getCreatedate().getYear()
						&& dt.getMonth() == q.getCreatedate().getMonth()
						&& dt.getDay() == q.getCreatedate().getDay()) {
					ques2DNum++;
				}
			}
		}
		request.put("ques2DNum", ques2DNum);
		int result2DNum = 0;
		for (Result r : results) {
			if (r.getCreatedate() != null) {
				if (dt.getYear() == r.getCreatedate().getYear()
						&& dt.getMonth() == r.getCreatedate().getMonth()
						&& dt.getDay() == r.getCreatedate().getDay()) {
					result2DNum++;
				}
			}
		}
		request.put("result2DNum", result2DNum);
		return "listQues";
	}

	public String closeQues() {
		// isavailabel=0;
		Questionnaire q = questionnaireDAO.findById(qid);

		Integer isavailable = q.getIsavailable();
		if (isavailable == null || isavailable == 0) {
			q.setIsavailable(1);
		} else {
			q.setIsavailable(0);
		}
		questionnaireDAO.merge(q);
		// use merge() to update and use save() to create new records in
		// database

		// this.addActionMessage("���óɹ���"); //addActionMessage should be in
		// function execute
		List<Questionnaire> questionnaires = questionnaireDAO.findAll();
		int quesNum = questionnaires.size();
		List<Result> results = resultDAO.findAll();
		int resultNum = results.size();
		request.put("questionnaires", questionnaires);
		request.put("results", results);
		request.put("quesNum", quesNum);
		request.put("resultNum", resultNum);

		return "listQues";
	}

	public String deleteUser() {
		userDAO.delete(userDAO.findById(uid));
		return "deleteUser";
	}

	public String deleteQues() {
		questionnaireDAO.delete(questionnaireDAO.findById(qid));
		return "deleteQues";
	}

}