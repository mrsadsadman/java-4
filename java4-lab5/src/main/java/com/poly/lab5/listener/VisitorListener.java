package com.poly.lab5.listener;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class VisitorListener implements ServletContextListener, HttpSessionListener {

	private static final String VISITOR_FILE = "D:/D/java3/workspade/java4-lab5/src/main/webapp/visitors.txt";

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		Integer visitors = 0;
		try {
			byte[] data = Files.readAllBytes(Paths.get(VISITOR_FILE));
			visitors = Integer.valueOf(new String(data));
		} catch (Exception e) {
			visitors = 100; // nếu chưa có file
		}

		sce.getServletContext().setAttribute("visitors", visitors);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		saveVisitorsToFile(sce.getServletContext());
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		ServletContext app = se.getSession().getServletContext();
		Integer visitors = (Integer) app.getAttribute("visitors");
		if (visitors == null)
			visitors = 0;

		visitors++;
		app.setAttribute("visitors", visitors);
		saveVisitorsToFile(app);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		saveVisitorsToFile(se.getSession().getServletContext());
	}

	private void saveVisitorsToFile(ServletContext app) {
		try {
			Integer visitors = (Integer) app.getAttribute("visitors");
			if (visitors == null)
				return;

			Files.write(Paths.get(VISITOR_FILE), String.valueOf(visitors).getBytes(), StandardOpenOption.CREATE,
					StandardOpenOption.TRUNCATE_EXISTING);

			System.out.println(">>> Saved visitors to project file: " + VISITOR_FILE);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
