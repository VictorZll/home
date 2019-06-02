package com.newroad.entity;

public class Student {
    private Integer id;

    private Integer stuNo;

    private String stuName;

    private String stuSex;

    private Integer stuAge;

    public Student() {
		super();
	}

	public Student( Integer stuNo, String stuName, String stuSex, Integer stuAge) {
		super();
		this.stuNo = stuNo;
		this.stuName = stuName;
		this.stuSex = stuSex;
		this.stuAge = stuAge;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", stuNo=" + stuNo + ", stuName=" + stuName + ", stuSex=" + stuSex + ", stuAge="
				+ stuAge + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStuNo() {
        return stuNo;
    }

    public void setStuNo(Integer stuNo) {
        this.stuNo = stuNo;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public Integer getStuAge() {
        return stuAge;
    }

    public void setStuAge(Integer stuAge) {
        this.stuAge = stuAge;
    }
}