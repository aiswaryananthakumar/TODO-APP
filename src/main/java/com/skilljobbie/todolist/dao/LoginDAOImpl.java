package com.skilljobbie.todolist.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skilljobbie.todolist.entity.Login;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SessionFactory sf;
	
	@Override
	public Login login(String input, String pass) {
		
		Session session=sf.getCurrentSession();
		String hf="from Login where(email = :input or phoneNo = :input) and password = :password";
		Query<Login>query=session.createQuery(hf,Login.class);
		query.setParameter("input", input);
		query.setParameter("password", pass);
		
		return query.uniqueResultOptional().orElse(null);
	}

	@Override
	public int register(Login login) {
		Session session=sf.getCurrentSession();
		session.save(login);
		return login.getId();
	}

}