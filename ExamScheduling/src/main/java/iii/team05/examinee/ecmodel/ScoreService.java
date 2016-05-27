package iii.team05.examinee.ecmodel;

import java.util.List;



public class ScoreService {

	private ScoreDao_interface dao;

	public ScoreService() {
		dao = new ScoreHibernateDAO();
	}


	public ScoreVO updateSco(String ecno, Integer lab,Integer interview,Integer labtime,Integer onlineex) {
		ScoreVO scoVO = new ScoreVO();
		
		scoVO.setEcno(ecno);
		scoVO.setLab(lab);
		scoVO.setInterview(interview);
		scoVO.setLabtime(labtime);
		scoVO.setOnlineex(onlineex);
		
		dao.update(scoVO);

		return dao.findByPrimaryKey(ecno);
	}

	public void deleteEmp(String ecno) {
		dao.delete(ecno);
	}

	public ScoreVO getOneEmp(String ecno) {
		return dao.findByPrimaryKey(ecno);
	}

	public List<ScoreVO> getAll() {
		return dao.getAll();
	}
}
