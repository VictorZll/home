package com.newroad.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.newroad.entity.Student;

public interface StudentMapper {
	/**
	 * 测试
	 * @return
	 */
	List<Student> getAll();
	/**
	 * 删
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);

    int insert(Student record);
    /**
     * 增
     * @param record
     * @return
     */
    int insertSelective(Student record);
    /**
     * 查
     * @param id
     * @return
     */
    Student selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Student record);
    /**
     * 改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Student record);
    
    /**
     * 分页
     * @param offset
     * @param rows
     * @return
     */
    List<Student> listByPae(@Param("offset")Integer offset,@Param("rows")Integer rows);
    /**
     * 总记录数
     * @return
     */
    Integer getCount();
    
}