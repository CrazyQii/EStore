package com.xmut.estore.servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xmut.estore.dao.TradeItemDAO;
import com.xmut.estore.domain.Account;
import com.xmut.estore.domain.TradeItem;
import com.xmut.estore.domain.User;
import com.xmut.estore.service.AccountService;
import com.xmut.estore.service.TradeService;
import com.xmut.estore.service.UserService;
/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserService userService = new UserService();
	private AccountService accountService = new AccountService();
	private TradeService tradeService = new TradeService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodName = request.getParameter("method");

		try {
			// 利用反射获取方法
			Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			// 执行相应的方法
			method.setAccessible(true);
			method.invoke(this, request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 获取用户信息余额
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void getUserInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		获取 username 请求参数的值
		String username = request.getParameter("username");
		int accountId = Integer.parseInt(request.getParameter("accountId"));
//		调用 UserService 的 getUser(username) 获取User 对象：要求 trades 是被装配好的，而且每一个 Trrade 对象的 items 也被装配好
		User user = userService.getUserWithTrades(username);
		Account account = accountService.getAccount(accountId);
//		把 User 对象放入到 request 中
		if(user == null){
			response.sendRedirect(request.getServletPath() + "/error-1.jsp");
			return;
		}

		request.setAttribute("user", user);
		request.setAttribute("account", account);

//		转发页面到 /WEB-INF/pages/trades.jsp
		request.getRequestDispatcher("/WEB-INF/pages/userInfo.jsp").forward(request, response);

	}

	/**
	 * 获取用户账单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void getUserTrade(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		int userId = userService.getUserByUserName(username).getUserId();

		Set<TradeItem> tradeItemSet = tradeService.getTradeItem(userId);

		if (tradeItemSet.isEmpty()) {
			request.getRequestDispatcher("/WEB-INF/pages/emptycart.jsp").forward(request,response);
		} else {
			request.setAttribute("tradeItem", tradeItemSet);
			request.getRequestDispatcher("/WEB-INF/pages/trades.jsp").forward(request,response);
		}

	}
}


