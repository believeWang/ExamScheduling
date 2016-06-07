package iii.team05.mes.model;

import java.sql.Timestamp;
import java.util.List;

import iii.team05.mes.model.MesVO;

public class MesService {

	private MesDAO_interface dao;

	public MesService() {
		dao = new MesDAO();
	}

	public MesVO leaveMessage(String msgname, String msgmail,
			java.sql.Timestamp msgtime, String msgcontent) {

		MesVO mesVO = new MesVO();
		mesVO.setMsgname(msgname);
		mesVO.setMsgmail(msgmail);
		mesVO.setMsgtime(msgtime);
		mesVO.setMsgcontent(msgcontent);
		dao.leave(mesVO);
		return mesVO;
	}

	public MesVO replyMessage(Integer messageid,String msgname,	String msgmail, Timestamp msgtime, String msgcontent,
			String rpname, java.sql.Timestamp rptime, String rpcontent) {

		MesVO mesVO = new MesVO();
		mesVO.setMessageid(messageid);
		mesVO.setMsgname(msgname);
		mesVO.setMsgmail(msgmail);
		mesVO.setMsgtime(msgtime);
		mesVO.setMsgcontent(msgcontent);
		mesVO.setRpname(rpname);
		mesVO.setRptime(rptime);
		mesVO.setRpcontent(rpcontent);
		dao.reply(mesVO);
		return mesVO;
	}

	// public void leaMes(MesVO mesVO) {
	// dao.insert(mesVO);
	// }
	// public void repMes(MesVO mesVO) {
	// dao.update(mesVO);
	// }
	//
	 public void deleteMes(Integer mesno) {
	 dao.delete(mesno);
	 }
	
	public MesVO getOneMes(Integer messageid) {
		return dao.findByPrimaryKey(messageid);
	}

	public List<MesVO> getAll() {
		return dao.getAll();
	}

	public List<MesVO> getNotReply() {
		return dao.getNotReply();
	}
}
