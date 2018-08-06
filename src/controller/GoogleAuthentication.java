package controller;


import java.io.IOException;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GoogleAuthentication
 */
@WebServlet("/GoogleAuthentication")
public class GoogleAuthentication extends Authenticator {
	private static final long serialVersionUID = 1L;
    PasswordAuthentication passAuth;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoogleAuthentication() {
        passAuth = new PasswordAuthentication("ediol654@gmail.com","bdnxahglaxbimyls");
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
    	return passAuth;
    }
}
