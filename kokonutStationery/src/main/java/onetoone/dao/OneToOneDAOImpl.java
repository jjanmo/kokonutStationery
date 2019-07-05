package onetoone.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OneToOneDAOImpl implements OneToOneDAO {
	@Autowired
	private SqlSession sqlSession;

}
