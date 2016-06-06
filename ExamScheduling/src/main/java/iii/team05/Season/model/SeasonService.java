package iii.team05.Season.model;

import java.util.List;



public class SeasonService {

	private SeasonDAO dao;

	public SeasonService() {
		dao = new SeasonDAO();
	}

	
	public SeasonVO insertSea(String seasonId,Float sum,Float average) {
		SeasonVO empVO = new SeasonVO();
		
		empVO.setSeasonId(seasonId);
		empVO.setSum(sum);
		empVO.setAverage(average);
		
		dao.insert(empVO);
		return empVO;
	}
	public SeasonVO updateEmp(String seasonId,Float sum,Float average) {
		SeasonVO empVO = new SeasonVO();
		
		empVO.setSeasonId(seasonId);
		empVO.setSum(sum);
		empVO.setAverage(average);
		
		dao.update(empVO);
		return empVO;
	}
	public void deleteSea(String seasonId) {
		 dao.delete(seasonId);
		 }
	public SeasonVO getOneMes(String seasonId) {
		return dao.findByPrimaryKey(seasonId);
	}
	public List<SeasonVO> getAll() {
		return dao.getAll();
	}
	
}
