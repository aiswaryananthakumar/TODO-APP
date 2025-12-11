package com.skilljobbie.todolist.service;

import com.skilljobbie.todolist.entity.Login;

public interface LoginService {
	
	Login login(String input, String pass);

	int register(Login login);


}
