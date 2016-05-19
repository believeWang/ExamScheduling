package iii.team05.mes.model;

import java.util.*;

public interface MesDAO_interface {
          public void leave(MesVO mesVO);
          public void reply(MesVO mesVO);
          public void delete(Integer messageid);
          public MesVO findByPrimaryKey(Integer messageid);
          public List<MesVO> getAll();
          public List<MesVO> getNotReply();
}
