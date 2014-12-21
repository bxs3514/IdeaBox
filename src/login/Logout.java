package login;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class Logout extends ActionSupport implements RequestAware, SessionAware {
	private Map<String, Object> session;
	private Map request;

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub

	}
	
	public String execute() throws Exception {
		session.remove("user");
		session.remove("rememberme");
		return SUCCESS;
	}
}
