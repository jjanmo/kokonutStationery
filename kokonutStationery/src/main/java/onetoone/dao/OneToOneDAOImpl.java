package onetoone.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import onetoone.bean.OneToOneDTO;

@Repository
public class OneToOneDAOImpl implements OneToOneDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void register(OneToOneDTO onetooneDTO) {
		sqlSession.insert("onetooneSQL.register", onetooneDTO);	
	}

	@Override
	public List<OneToOneDTO> onetooneList(String userId) {
		return sqlSession.selectList("onetooneSQL.onetooneList", userId);
	}

}
