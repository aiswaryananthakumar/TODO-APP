package com.skilljobbie.todolist.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilljobbie.todolist.dao.TaskDAO;
import com.skilljobbie.todolist.entity.Task;


@Service
public class TaskServiceImpl implements TaskService{
	
	@Autowired
	private TaskDAO dao;
	
	@Autowired
	private SessionFactory sf;

	@Override
	@Transactional
	public int addTask(Task task) {
		
		return dao.addTask(task);
	}

	@Override
	@Transactional
	public Task editTask(Integer id) {
		// TODO Auto-generated method stub
		return dao.editTask(id);
	}

	@Override
	@Transactional
	public List<Task> getAllTask() {
		// TODO Auto-generated method stub
		return dao.getAllTask();
	}

	@Override
	@Transactional
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		dao.delete(id);
		
	}
}