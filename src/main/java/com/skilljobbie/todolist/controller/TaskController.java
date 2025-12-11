package com.skilljobbie.todolist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilljobbie.todolist.entity.Task;
import com.skilljobbie.todolist.service.TaskService;


@Controller
public class TaskController {
	
	@Autowired
	private TaskService service;

	@GetMapping("/task")
	public String getAllTask(@RequestParam(value="id", required=false) Integer id,Model model) {
		Task task;
		if(id!=null) {
			task=service.editTask(id);
		}else {
			task = new Task();
		}
		model.addAttribute("task", task);
		model.addAttribute("taskList", service.getAllTask());
		return "task";
	}
	
	@PostMapping("/addTask")
	public String postTask(@ModelAttribute("task") Task task) {
		int id=service.addTask(task);
		if(id!=0) {
			return "redirect:/task?message=success";
		}else {
			return "redirect:/task?message=failed";
		}
		
	}
	
	@GetMapping("/deleteTask/{id}")
	public String delete(@PathVariable("id") Integer id) {
		service.delete(id);
		return "redirect:/task?message=deleted";
	}
}