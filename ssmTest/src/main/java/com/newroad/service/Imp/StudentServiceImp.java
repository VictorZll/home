package com.newroad.service.Imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newroad.dao.StudentMapper;
import com.newroad.entity.Student;
import com.newroad.service.StudentServiceIf;
@Service
@Transactional
public class StudentServiceImp implements StudentServiceIf {
	@Resource
	StudentMapper stuMapper;

	@Override
	public List<Student> getAll() {
		return stuMapper.getAll();
	}

	@Override
	public List<Student> listByPage(Integer page, Integer rows) {
		double count=getCount();
		int pageCount=(int) Math.ceil(count/rows);
		if(page>pageCount) {
			page=pageCount;
		}
		if(page<1) {
			page=1;
		}
		int offset=(page-1)*rows;
		return stuMapper.listByPae(offset, rows);
	}

	@Override
	public Boolean addStu(Student stu) {
		return stuMapper.insertSelective(stu)>0?true:false;
	}

	@Override
	public Boolean removeStuById(Integer id) {
		return stuMapper.deleteByPrimaryKey(id)>0?true:false;
	}

	@Override
	public Boolean updateStu(Student stu) {
		return stuMapper.updateByPrimaryKeySelective(stu)>0?true:false;
	}

	@Override
	public Student getStuById(Integer id) {
		return stuMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer getCount() {
		return stuMapper.getCount();
	}

}
