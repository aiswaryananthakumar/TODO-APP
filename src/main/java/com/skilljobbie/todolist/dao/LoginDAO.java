package com.skilljobbie.todolist.dao;

import com.skilljobbie.todolist.entity.Login;

public interface LoginDAO {
	
	Login login(String input, String pass);

	int register(Login login);

}
