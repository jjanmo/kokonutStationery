package mybatis.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Controller
@EnableTransactionManagement
public class MybatisConfig {
	
	@Bean(name="dataSource")
	public BasicDataSource getBasicDataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		basicDataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		basicDataSource.setUsername("java");
		basicDataSource.setPassword("itbank");
		basicDataSource.setMaxTotal(20);
		basicDataSource.setMaxIdle(3);
		return basicDataSource;
	}
	@Bean
	public SqlSessionFactory getSqlSessionFactoryBean() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		
		PathMatchingResourcePatternResolver pmrpr = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setDataSource(getBasicDataSource());
		sqlSessionFactoryBean.setConfigLocation(pmrpr.getResource("/spring/mybatis-config.xml"));
		sqlSessionFactoryBean.setMapperLocations(pmrpr.getResources("*/dao/*Mapper.xml"));
		
		return sqlSessionFactoryBean.getObject();
	}
		
	@Bean(name="sqlSession")
	public SqlSessionTemplate getSqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate(getSqlSessionFactoryBean());
	}
	
	@Bean(name="transactionManager")
	public DataSourceTransactionManager getDataSourceTransactionManager() {
		DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
		dataSourceTransactionManager.setDataSource(getBasicDataSource());
		return dataSourceTransactionManager;
	}
}
