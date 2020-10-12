package cn.itcast.dao.impl;

import cn.itcast.dao.UserDao;
import cn.itcast.domain.User;
import cn.itcast.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDaoImp implements UserDao {
    private JdbcTemplate template = new JdbcTemplate((JDBCUtils.getDataSource()));
    @Override
    public List<User> findAll() {
        //使用JDBC操作数据库
        String sql = "select * from user2";

        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
        return users;
    }
}
