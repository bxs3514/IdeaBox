package signup;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import data.User;
import data.UserDAO;
import java.sql.Date;



public class Signup extends ActionSupport
	implements RequestAware, SessionAware {
	private String email;
	private String password;
	private String passwordConfirm;
	private String username;
	private Integer age;
	private String gender;
	private UserDAO userDAO;
	private Map session;
	private Map request;
	private Timestamp createdate;

	
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setAge(Integer age) {
		this.age =age;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void validate() {
		System.out.println("validate");
		if (this.email == null || this.email.equals("")) {
			this.addFieldError("email", "邮箱不能为空");
			return;
		} else if (this.userDAO.findByEmail(email).size() > 0) {
			this.addFieldError("email", "邮箱已被注册");
			return;
		}

		if (this.username == null || this.username.equals("")) {
			this.addFieldError("username", "用户名不能为空");
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
		Timestamp dt=new Timestamp(System.currentTimeMillis());
		System.out.println("execute");
		System.out.println("email = " + this.email);
		System.out.println("username = " + this.username);
		System.out.println("password = " + this.password);
		System.out.println("password = " + this.passwordConfirm);
		System.out.println("date = " + dt);

		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setUsername(username);
		user.setAge(0);
		user.setGender("male");
		user.setCreatedate(dt);
		
		this.userDAO.save(user);
		session.put("user", user);
		System.out.println("id= " + user.getUid());
		return SUCCESS;
	}
	
	public String view() throws Exception {
		System.out.println("view");
		return SUCCESS;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

}
