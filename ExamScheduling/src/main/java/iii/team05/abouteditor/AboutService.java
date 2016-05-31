package iii.team05.abouteditor;

import java.util.List;

public class AboutService {
	AbouteditorDAO abDAO;

	public AboutService() {
		abDAO = new AbouteditorDAO();
	}

	public List<AbouteditorVO> query() {

		return abDAO.getAll();

	}

	public AbouteditorVO updateAbout(String aboutcontent) {

		AbouteditorVO AbouteditorVO = new AbouteditorVO();
		AbouteditorVO.setAboutcontent(aboutcontent);
		abDAO.updateabout(AbouteditorVO);
		return AbouteditorVO;
	}

}
