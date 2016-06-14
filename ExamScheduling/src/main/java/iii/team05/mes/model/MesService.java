package iii.team05.mes.model;


import java.util.List;

import iii.team05.mes.model.MesVO;

public class MesService {

	private MesDAO_interface dao;

	public MesService() {
		dao = new MesDAO();
	}

	public MesVO leaveMessage(String msgname, String msgmail,
			String msgtime, String msgcontent) {

		MesVO mesVO = new MesVO();
		mesVO.setMsgname(msgname);
		mesVO.setMsgmail(msgmail);
		mesVO.setMsgtime(msgtime);
		mesVO.setMsgcontent(msgcontent);
		dao.leave(mesVO);
		return mesVO;
	}

	public MesVO replyMessage(Integer messageid,String msgname,	String msgmail, String msgtime, String msgcontent,
			String rpname, String rptime, String rpcontent) {

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
	
	public List<MesVO> getAll() {
		return dao.getAll();
	}
	public List<MesVO> findByPrimaryKey(String msgmail) {
		return dao.findByPrimaryKey(msgmail);
	}
	public List<MesVO> getNotReply() {
		return dao.getNotReply();
	}

	public MesVO getOneMes(Integer messageid) {
		// TODO Auto-generated method stub
		return null;
	}
}
