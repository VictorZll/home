package com.newroad.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.newroad.entity.Student;
import com.newroad.service.StudentServiceIf;
import com.newroad.service.Imp.StudentServiceImp;

public class Test01 {
public static void main(String[] args) {
	ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
	StudentServiceIf s=context.getBean(StudentServiceImp.class);
	//s.getAll().forEach(stu->System.out.println(stu));
	//System.out.println(s.getStuById(2).toString());
	//System.out.println(s.removeStuById(3));
	//System.out.println(s.addStu(new Student(1001, "张三", "男", 23)));
//	Student stu=new Student(1001, "张三", "男", 27);
//	stu.setId(5);
//	System.out.println(s.updateStu(stu));
	//插入100条数据
	String[] names= {"李公明","李银河","李碧华","刘醒龙","路佳瑄","刘继兴","慈悲","李建荣","李轶男","再复","刘墉","康慨","渴非","旷新年","柯云路","洁尘","今何在","金文明","蒋方舟","江晓原","江心岛","旧海棠","贺茂峰","海啸","胡志平","韩云波","黄育海","花信风","寒风","很北","狐眉儿","韩浩月","黄浩","画眉","花狸","韩雨山","胡元骏","韩寒","侯振宇","侯卫东","和面儿","胡建礼","胡续冬","和菜头","韩美林","哈哈靖","韩放","胡玥","韩松落","何员外","黄延复","何亚娟","海老","火狐","海男","何小米","郭震海","高星","古清生","恭小兵","关凌","高远","郭妮","姜汉忠","郭灿金","谷良","高建华","冯一萌","冯唐","傅光明"," 开火","范稳","方文山","傅佩荣","杜仲华","丁启阵","大仙 大江","巩高峰","地瓜猪","丁子江 丁三郎","戴鹏飞","丁天","杜欣 邓程","崔岱远","程万军","蔡林","沧月","陈帆","丑乙","陈浩","陈绍华","曹征路","程一身","常远","曹寇","崔卫平","扯哥","程蝉","蔡天新","陈远","陈丹青","淳子","陈众议","程鹤麟"};
	String[] sexs= {"男","女"};
	for(int i=0;i<names.length;i++) {
		Student stu=new Student();
		stu.setStuNo(1002+i);
		stu.setStuName(names[i]);
		stu.setStuAge((int)Math.floor(Math.random()*60+20));
		stu.setStuSex(sexs[(int)Math.floor(Math.random()*2)]);
		stu.setId(i+7);
		s.updateStu(stu);
	}
}
}
