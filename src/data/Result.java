package data;

import java.sql.Timestamp;

/**
 * Result entity. @author MyEclipse Persistence Tools
 */

public class Result implements java.io.Serializable {

	// Fields

	private Integer rid;
	private Integer qid;
	private String result;
	private Integer uid;
	private String ip;
	private Timestamp createdate;

	// Constructors

	/** default constructor */
	public Result() {
	}

	/** minimal constructor */
	public Result(Integer qid, String result) {
		this.qid = qid;
		this.result = result;
	}

	/** full constructor */
	public Result(Integer qid, String result, Integer uid, String ip,
			Timestamp createdate) {
		this.qid = qid;
		this.result = result;
		this.uid = uid;
		this.ip = ip;
		this.createdate = createdate;
	}

	// Property accessors

	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public Integer getQid() {
		return this.qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getResult() {
		return this.result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Timestamp getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}

}