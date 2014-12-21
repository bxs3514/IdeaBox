package login;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import data.User;
import data.UserDAO;

public class Login extends ActionSupport implements RequestAware, SessionAware {
	private String email;
	private String password;
	private Boolean rememberMe = false;
	private UserDAO userDAO;
	User user = new User();
	Integer uid = 0;
	private Map<String, Object> session;
	private Map request;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRememberMe(boolean rememberme) {
		this.rememberMe = rememberme;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	@Override
	public void validate() {
		user = (User) session.get("user");
		if (user == null) {
			filllogin();
			session.put("user", user);
			session.put("rememberme", rememberMe);
		} else {
			rememberMe = (Boolean) session.get("rememberme");
			if (rememberMe == null || rememberMe == false) {
				session.remove("user");
				filllogin();
				session.put("user", user);
				session.put("rememberme", rememberMe);
			}
		}
		return;
	}

	public String execute() throws Exception {
		
		System.out.println(session.get(user));
		return SUCCESS;
	}

	private void filllogin() {
		if (userDAO.findByEmail(this.email).isEmpty()) {
			this.addFieldError("email", "用户名错误");
		} 
		else {
			List<User> list = userDAO.findByEmail(this.email);
			user = list.get(0);
			if (!user.getPassword().equals(this.password)) {
				this.addFieldError("password", "密码错误");
			}
		}
	}
}
// user.setEmail(email);
// user.setPassword(password);
// this.userDAO.save(user);
// this.userDAO.merge(user);
