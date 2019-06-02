package com.newroad.service;

import java.util.List;

import com.newroad.entity.Student;

public interface StudentServiceIf {
	
	/**
	 * 查询所有。用来测试
	 * @return
	 */
	List<Student> getAll();
	
	/**
	 * 1分页
	 * @param page
	 * @param rows
	 * @return
	 */
	List<Student> listByPage(Integer page,Integer rows);
	/**
	 * 2增
	 * @param stu
	 * @return
	 */
	Boolean addStu(Student stu);
	/**
	 * 3删
	 * @param stu
	 * @return
	 */
	Boolean removeStuById(Integer id);
	/**
	 * 4改
	 * @param stu
	 * @return
	 */
	Boolean updateStu(Student stu);
	/**
	 * 5查
	 * @param id
	 * @return
	 */
	Student getStuById(Integer id);
	/**
	 * 总数
	 * @return
	 */
	Integer getCount();
	
	
	
	

}
