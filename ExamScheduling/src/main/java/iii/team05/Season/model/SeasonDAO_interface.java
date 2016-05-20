package iii.team05.Season.model;

import java.util.*;

public interface SeasonDAO_interface {
          public void insert(SeasonVO seasonVO);
          public void update(SeasonVO seasonVO);
          public void delete(String seasonId);
          public SeasonVO findByPrimaryKey(String seasonId);
          public List<SeasonVO> getAll();
}
