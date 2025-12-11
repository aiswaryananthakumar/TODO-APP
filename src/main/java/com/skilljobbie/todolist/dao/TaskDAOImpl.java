package com.skilljobbie.todolist.dao;

import java.util.List;

import com.skilljobbie.todolist.entity.Task;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TaskDAOImpl implements TaskDAO {

	@Autowired
	private SessionFactory sf;

	@Override
	public int addTask(Task task) {
		Session ss=sf.getCurrentSession();
		if(task.getId()!=0) {
			ss.merge(task);
		}else {
			ss.save(task);
		}
		return task.getId();
	}

	@Override
	public Task editTask(Integer id) {
		// TODO Auto-generated method stub
		return sf.getCurrentSession().get(Task.class, id);
	}

	@Override
	public List<Task> getAllTask() {
		// TODO Auto-generated method stub
		return sf.getCurrentSession().createQuery("from Task",Task.class).list();
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=sf.getCurrentSession();
		Task task=session.get(Task.class, id);
		if(task!=null) {
			session.delete(task);
		}
	}
}
