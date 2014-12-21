package data;

import java.sql.Timestamp;

/**
 * Questionnaire entity. @author MyEclipse Persistence Tools
 */

public class Questionnaire implements java.io.Serializable {

	// Fields

	private Long qid;
	private Long investId;
	private String title;//
	private String subject;//
	private String description;//
	private String content;
	private Integer usernum;
	private Integer ipnum;
	private Integer anonymous;
	private Integer isavailable;
	private Timestamp createdate;
	private Timestamp lasteditdate;
	private Timestamp deletedate;
	private Integer iscreated;
	private Integer iseditable;
	private Integer isreleased;
	private Integer isclosed;

	// Constructors

	/** default constructor */
	public Questionnaire() {
	}

	/** minimal constructor */
	public Questionnaire(Long investId, String title, String subject,
			String content) {
		this.investId = investId;
		this.title = title;
		this.subject = subject;
		this.content = content;
	}

	/** full constructor */
	public Questionnaire(Long investId, String title, String subject,
			String description, String content, Integer usernum, Integer ipnum,
			Integer anonymous, Integer isavailable, Timestamp createdate,
			Timestamp lasteditdate, Timestamp deletedate, Integer iscreated,
			Integer iseditable, Integer isreleased, Integer isclosed) {
		this.investId = investId;
		this.title = title;
		this.subject = subject;
		this.description = description;
		this.content = content;
		this.usernum = usernum;
		this.ipnum = ipnum;
		this.anonymous = anonymous;
		this.isavailable = isavailable;
		this.createdate = createdate;
		this.lasteditdate = lasteditdate;
		this.deletedate = deletedate;
		this.iscreated = iscreated;
		this.iseditable = iseditable;
		this.isreleased = isreleased;
		this.isclosed = isclosed;
	}

	// Property accessors

	public Long getQid() {
		return this.qid;
	}

	public void setQid(Long qid) {
		this.qid = qid;
	}

	public Long getInvestId() {
		return this.investId;
	}

	public void setInvestId(Long investId) {
		this.investId = investId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getUsernum() {
		return this.usernum;
	}

	public void setUsernum(Integer usernum) {
		this.usernum = usernum;
	}

	public Integer getIpnum() {
		return this.ipnum;
	}

	public void setIpnum(Integer ipnum) {
		this.ipnum = ipnum;
	}

	public Integer getAnonymous() {
		return this.anonymous;
	}

	public void setAnonymous(Integer anonymous) {
		this.anonymous = anonymous;
	}

	public Integer getIsavailable() {
		return this.isavailable;
	}

	public void setIsavailable(Integer isavailable) {
		this.isavailable = isavailable;
	}

	public Timestamp getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}

	public Timestamp getLasteditdate() {
		return this.lasteditdate;
	}

	public void setLasteditdate(Timestamp lasteditdate) {
		this.lasteditdate = lasteditdate;
	}

	public Timestamp getDeletedate() {
		return this.deletedate;
	}

	public void setDeletedate(Timestamp deletedate) {
		this.deletedate = deletedate;
	}

	public Integer getIscreated() {
		return this.iscreated;
	}

	public void setIscreated(Integer iscreated) {
		this.iscreated = iscreated;
	}

	public Integer getIseditable() {
		return this.iseditable;
	}

	public void setIseditable(Integer iseditable) {
		this.iseditable = iseditable;
	}

	public Integer getIsreleased() {
		return this.isreleased;
	}

	public void setIsreleased(Integer isreleased) {
		this.isreleased = isreleased;
	}

	public Integer getIsclosed() {
		return this.isclosed;
	}

	public void setIsclosed(Integer isclosed) {
		this.isclosed = isclosed;
	}

}