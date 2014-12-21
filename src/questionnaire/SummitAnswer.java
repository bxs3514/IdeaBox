package questionnaire;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import data.Result;
import data.ResultDAO;
import data.User;

public class SummitAnswer extends ActionSupport implements RequestAware,
		SessionAware {
	private Map session; // ActionContext.getContext().getSession();
	private Map request;

	private int quesNum;

	private int uid;
	private int qid = 5;

	private ResultDAO resultDAO;

	private void getAnswers() {

		HttpServletRequest req = ServletActionContext.getRequest();
		session = ActionContext.getContext().getSession();
		String ip = req.getRemoteAddr();
		String answerContent = "";
		// System.out.println(req.getParameter("a"));
		for (int i = 0; i < quesNum; i++) {
			String attrName = "question" + (i + 1);
			String[] value = req.getParameterValues(attrName) == null ? new String[] { req
					.getParameter(attrName) } : req
					.getParameterValues(attrName);

			// boolean a = req.getParameter(attrName).equals(null);
			// System.out.println(value==null);
			if (i == 0) {
				for (String v : value) {
					answerContent += (v + ",");
				}
				answerContent = answerContent.substring(0,
						answerContent.length() - 1);
			} else {
				answerContent += "|";
				for (String v : value) {
					answerContent += (v + ",");
				}
				answerContent = answerContent.substring(0,
						answerContent.length() - 1);

			}

		}
		User user = (User) session.get("user");
		// System.out.println("name: " + user.getUsername() + "\tpass: " +
		// user.getPassword());
		if (user == null)
			uid = -1;
		else
			uid = user.getUid();
		Result result = new Result();
		result.setQid(qid);
		result.setUid(uid);
		result.setResult(answerContent);
		result.setIp(ip);
		resultDAO.save(result);
		this.request.put("qid", this.qid);
		
	}

	@Override
	public String execute() throws Exception {
		System.out.println("execute in!");
		// System.out.println(this.request.toString());
		// Iterator iter = this.request.entrySet().iterator();
		// Map.Entry entry = (Map.Entry) iter.next();
		// Object key = entry.getKey();

		// Object value = entry.getValue();
		// while (iter.hasNext())
		// {
		// System.out.println("key" + key.toString() + "\tvalue" +
		// value.toString());
		// }

		getAnswers();
		addActionMessage("提交成功！");
		return SUCCESS;
	}

	@Override
	public void validate() {
		HttpServletRequest req = ServletActionContext.getRequest();
		for (int i = 0; i < quesNum; i++) {
			if (req.getParameter("question" + (i + 1)) == null) {
				addFieldError("answer", "请填写" + (i + 1) + "题！");
			}
			;
		}
		
		super.validate();
	}

	/***********
	 * setters and getters
	 *************/
	public int getQuesNum() {
		return quesNum;
	}

	public int getUid() {
		return uid;
	}

	public ResultDAO getResultDAO() {
		return resultDAO;
	}

	public void setQuesNum(int quesNum) {
		this.quesNum = quesNum;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public void setResultDAO(ResultDAO resultDAO) {
		this.resultDAO = resultDAO;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

}
