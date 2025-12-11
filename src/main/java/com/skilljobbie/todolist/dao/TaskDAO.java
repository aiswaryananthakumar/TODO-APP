package com.skilljobbie.todolist.dao;

import java.util.List;

import com.skilljobbie.todolist.entity.Task;

public interface TaskDAO {
	
	int addTask(Task task);

	Task editTask(Integer id);

	List<Task> getAllTask();

	void delete(Integer id);

}
