package com.skilljobbie.todolist.service;

import com.skilljobbie.todolist.dao.LoginDAO;
import com.skilljobbie.todolist.entity.Login;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO dao;
	@Override
	@Transactional
	public Login login(String input, String pass) {
		
		return dao.login(input,pass);
	}
	@Override
	@Transactional
	public int register(Login login) {
		// TODO Auto-generated method stub
		return dao.register(login);
	}

}
