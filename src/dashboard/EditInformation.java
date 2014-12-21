package dashboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import data.User;
import data.UserDAO;
import java.sql.Timestamp;

public class EditInformation extends ActionSupport
	implements RequestAware, SessionAware {
	//private String email;
	private String password;
	private String passwordConfirm;
	private String username;
	//private Integer age;
	private Timestamp birthdate;
	private Integer uid;
	private String gender;
	private UserDAO userDAO;
	private Map session;
	private Map request;
	private Boolean isView;
	//private Boolean succ;
	

	public void setIsView(Boolean isView) {
		this.isView = isView;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setBirthdate(Timestamp birthdate) {
		this.birthdate = birthdate;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	//public void setEmail(String email) {
		//this.email = email;
	//}

	/**
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void validate() {
		System.out.println("validate");
		if (this.isView != null && this.isView) {
			System.out.println("true");
			return;
		}
		if (this.username == null || this.username.equals("")) {
			this.addFieldError("username", "用户名不能为空");
			return;
		}

		if (this.birthdate == null) {
			this.addFieldError("birthdate", "出生日期不能为空");
			return;
		}

		if (this.gender == null || this.gender.equals("")) {
			this.addFieldError("gender", "密码不能为空");
			return;
		}

		if (this.password == null || this.password.equals("")) {
			this.addFieldError("password", "密码不能为空");
			return;
		}

		if (!this.password.equals(this.passwordConfirm)) {
			this.addActionMessage("请再次输入同样密码");
			System.out.println("compare = " + (this.password.equals(this.passwordConfirm)));
			this.addFieldError("passwordConfirm", "请再次输入同样密码");
			return;
		}
		
	}

	public String execute() throws Exception {
		System.out.println("execute");
		//System.out.println("email = " + this.email);
		System.out.println("username = " + this.username);
		System.out.println("password = " + this.password);
		System.out.println("password = " + this.passwordConfirm);
		User user = (User) session.get("user");
		
		if (user == null) {
			
			return ERROR;
		} 
		
		else
		{
			//user.setEmail(email);
			user.setPassword(password);
			user.setUsername(username);
			user.setBirthdate(birthdate);
			user.setGender(gender);
			this.userDAO.merge(user);
			this.request.put("succ", "true");
			System.out.println("id= " + user.getUid());
			view();
			return SUCCESS;
		}
		
		
	}
	
	public String view() throws Exception {
		User user = (User) session.get("user");
		if (user == null) {
			
			return ERROR;
		} 
		else
		{
		this.request.put("username", user.getUsername());
		Timestamp birthdate = user.getBirthdate();
		if (birthdate == null) {
			birthdate = new Timestamp(System.currentTimeMillis());
		}
		this.request.put("birthdate", birthdate.toString().substring(0, 10));
		this.request.put("gender", user.getGender());

		System.out.println("id= " + user.getUid());
		
		return "view";
		}
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

}
