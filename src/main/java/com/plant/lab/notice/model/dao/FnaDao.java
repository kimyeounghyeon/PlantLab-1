package com.plant.lab.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plant.lab.notice.model.vo.FnaVo;
import com.plant.lab.notice.model.vo.NoticeVo;
import com.plant.lab.notice.model.vo.PagingVo;
import com.plant.lab.product.model.vo.Product;

@Repository("fDao")
public class FnaDao {
	@Autowired
	private SqlSession sqlSession;

	public int FnaCount() {
		return sqlSession.selectOne("Fna.FnaCount");
	}

	public List<FnaVo> FnaList(PagingVo vo){
		return sqlSession.selectList("Fna.FnaList",vo);
	}

	
	public int FnaCnt() { 
	      return sqlSession.selectOne("Fna.FnaCount");
	   }


	
	
  public int FnaInsert(FnaVo vo) {
		  		return sqlSession.insert("Fna.FnaInsert", vo);
		
    }
	  public FnaVo FnaRead(int no) {
		  return sqlSession.selectOne("Fna.FnaRead",no);
  }
  
	
	  public int Fnaupdate(FnaVo n) { 
	      return sqlSession.update("Fna.FnaUpdate",n);
	   }
	


	  public int Fnadel(int vo) { 
	      return sqlSession.delete("Fna.FnaDel",vo);
	   }	   
}
