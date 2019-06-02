package com.newroad.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.newroad.entity.Student;
import com.newroad.service.Imp.StudentServiceImp;

@Controller
public class StudentController {
	private Integer id;
	@Resource
	StudentServiceImp service;
	
	@ResponseBody
	@RequestMapping("/listByPage")
	public Map<String,Object> listByPage(Integer page,Integer rows){
		Map<String, Object> map=new HashMap<String, Object>();
		List<Student> list=service.listByPage(page, rows);
		int count=service.getCount();
		list.forEach(stu->System.out.println(stu));
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	@RequestMapping("/update")
	public String update(Integer id) {
		this.id=id;
		System.out.println("id="+id);
		return "redirect:add";
	}
	@ModelAttribute("stu")
	public Student getStu() {
		return service.getStuById(id);
	}
	@RequestMapping("/add")
	public ModelAndView add(@ModelAttribute("stu")Student stu,ModelAndView mv) {
		mv.addObject("stu", stu);
		mv.setViewName("stu/add");
		return mv;
	}
	/**
	 * 测试用
	 * @return
	 */
	@RequestMapping("/redirect")
	public String redirect() {
		return "redirect:add";
	}
	@ResponseBody
	@RequestMapping("/getStuById")
	public Student getStuById(Integer id) {
		return service.getStuById(this.id);
	}
	@RequestMapping("/updateById")
	public String update(Student student) {
		System.out.println(student);
		student.setId(id);
		Boolean flage=service.updateStu(student);
		if(flage) {
			return "stu/listByPage";
		}
		return "redirect:add";
		
	}
	@RequestMapping("/remove")
	@ResponseBody
	public Boolean remove(Integer id) {
		return	service.removeStuById(id);
		
	}
	@RequestMapping("/save")
	public String save(@RequestBody Student stu) {
		Boolean flage=service.addStu(stu);
		System.out.println(stu);
		if(flage) {
			return "jsp/listByPage";
		}
		return null;
		
	}

}
