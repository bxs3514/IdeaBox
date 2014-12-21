package report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import data.Question;
import data.QuestionDAO;
import data.Questionnaire;
import data.QuestionnaireDAO;
import data.Result;
import data.ResultDAO;

public class ReportAction extends ActionSupport implements RequestAware,
		SessionAware {
	private Map session;
	private Map request;
	private String result;
	private Integer qid;
	private QuestionnaireDAO questionnaireDAO;
	private QuestionDAO questionDAO;
	private ResultDAO resultDAO;

	public void setQuestionnaireDAO(QuestionnaireDAO questionnaireDAO) {
		this.questionnaireDAO = questionnaireDAO;
	}

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	public void setResultDAO(ResultDAO resultDAO) {
		this.resultDAO = resultDAO;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

	public String getAnswers() throws Exception {
		if (qid == null) {
			throw new Exception("尼玛，qid传错了!");
		}
		Questionnaire questionnaire = questionnaireDAO.findById((long) qid);
		String[] questionIds = questionnaire.getContent().split("\\|");
		Random random = new Random();
		JSONArray json = new JSONArray();
		List<Result> answers = resultDAO.findByQid(qid);
		List userAnswers = new ArrayList();
		for (Result r : answers) {
			userAnswers.add(r.getResult().split("\\|"));
		}
		for (int i = 0; i < questionIds.length; i++) {
			Question question = questionDAO.findById(Integer
					.parseInt(questionIds[i]));
			System.out.println("question type" + question.getType());
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("content", question.getContent());
			List items = new ArrayList<Map>();
			int total = 0;
			if (question.getType() == 1 || question.getType() == 0) {
				String[] choices = question.getChoice().split("\\|");
				for (int j = 0; j < choices.length; j++) {
					Map<String, Object> item = new HashMap<String, Object>();
					item.put("content", choices[j]);
					item.put("count", 0);
					items.add(item);
				}
			} else if (question.getType() == 2) {
				Map<String, Object> item = new HashMap<String, Object>();
				item.put("content", "yes");
				item.put("count", 0);
				items.add(item);
				item = new HashMap<String, Object>();
				item.put("content", "no");
				item.put("count", 0);
				items.add(item);
			} else if (question.getType() == 3) {
				for (int j = 0; j < userAnswers.size(); j++) {
					String[] choices = (String[]) userAnswers.get(j);
					if (i >= choices.length) {
						continue;
					}
					Map<String, Object> item = new HashMap<String, Object>();
					item.put("content", choices[i]);
					item.put("count", 1);
					items.add(item);
					total ++;
				}
			}
			System.out.println("question index" + i);
			System.out.println("question item len" + items.size());
			for (int j = 0; j < userAnswers.size(); j++) {
				String[] choices = (String[]) userAnswers.get(j);
				if (i >= choices.length) {
					continue;
				}
				System.out.println("answer index = " + j);
				System.out.println("answer result = " + answers.get(j).getResult());
				System.out.println("choices len" + choices.length);
				// 0 single 1 multiple 2 yes or no 3 fill in
				switch (question.getType()) {
				case 0:
				case 1:
					String[] choiceForItem = choices[i].split(",");
					System.out.println("choiceForItem len " + choiceForItem.length);
					boolean hasAnswered = false;
					for (int c = 0; c < choiceForItem.length; c++) {
						if (choiceForItem[c].equals("")) {
							continue;
						}
						hasAnswered = true;
						System.out.println("choiceForItem " + c + " = " + choiceForItem[c]);
						Map item = (Map) items.get((int) choiceForItem[c].charAt(0) - (int) 'A');
						item.put("count", (Integer) item.get("count") + 1);
					}
					if (hasAnswered) {
						total ++;
					}
					break;
				case 2:
					if (!choices[i].equals("")) {
						Map item = (Map) items.get((int) choices[i].charAt(0) - (int) '0');
						item.put("count", (Integer) item.get("count") + 1);
						total ++;
					}
					break;
				default:
					break;
				}

			}
			m.put("items", items);
			m.put("total", total);
			m.put("type", question.getType());
			json.add(m);
		}

		this.result = json.toString();
		System.out.println(this.result);
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

}
