package com.skilljobbie.todolist.service;

import java.util.List;

import com.skilljobbie.todolist.entity.Task;

public interface TaskService {

	int addTask(Task task);

	Task editTask(Integer id);

	List<Task> getAllTask();

	void delete(Integer id);

}
