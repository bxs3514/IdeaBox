package data;

/**
 * AbstractResult entity provides the base persistence definition of the Result
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractResult implements java.io.Serializable {

	// Fields

	private Integer rid;
	private Integer qid;
	private String result;
	private Integer uid;
	private String ip;

	// Constructors

	/** default constructor */
	public AbstractResult() {
	}

	/** minimal constructor */
	public AbstractResult(Integer qid, String result) {
		this.qid = qid;
		this.result = result;
	}

	/** full constructor */
	public AbstractResult(Integer qid, String result, Integer uid, String ip) {
		this.qid = qid;
		this.result = result;
		this.uid = uid;
		this.ip = ip;
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

}