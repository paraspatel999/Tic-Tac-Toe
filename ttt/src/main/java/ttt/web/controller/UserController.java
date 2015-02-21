package ttt.web.controller;

import java.security.Principal;
import java.sql.Time;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.naming.NoPermissionException;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.async.DeferredResult;

import ttt.model.Game;
import ttt.model.Games;
import ttt.model.Users;
import ttt.model.dao.UserDao;
import ttt.service.GameServices;
import ttt.service.UserService;


@Controller
public class UserController {

	@Autowired
	private UserDao userDao;
	
	 @Autowired
	    UserService us;
	 
	 @Autowired
	    GameServices gs;
	
	
	


	@RequestMapping("/users.html")
	public String users(ModelMap models) {
		models.put("users", userDao.getUsers());
		return "users";
	}

	@RequestMapping(value = "/register.html", method = RequestMethod.GET)
	public String register(ModelMap models) {
		models.put("user", new Users());
		return "Register";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String insert(@ModelAttribute("user") Users user) {
		userDao.insertUser(user);
		return "redirect:login.html";
	}

	/*@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session, ModelMap models) {
		
		
        
		//models.put("user", new Users());
		return "login";
	}*/
	
	@RequestMapping(value="/truelogin", method = RequestMethod.GET)
	public String printWelcome(ModelMap model,HttpSession session,Principal principal) {
 
		//ahiya nathi avtu
		
		String name = principal.getName();
	
		
		session.setAttribute("Username", name);
		return "redirect:/welcome.html";
 
	}

	
	/*@RequestMapping(value = "/failed.html", method = RequestMethod.GET)
	public String loginFailed(HttpSession session, ModelMap models) {
		
		models.put("error", "Invalid Username Or Password");
        
		
		return "login";
	}*/
	
	// ronak did here
	/*@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "login";
 
	}*/
	
	
	
	 @RequestMapping(value = "/player2.html", method = RequestMethod.GET)
	 public String player2(HttpSession session, ModelMap models)
	 {
		 if (session.getAttribute("Username") == null) {
				return "redirect:login.html";
			}
		   
		 models.put("user", (String)session.getAttribute("Username"));
		   return "player2";
	 }
	 
	 
	 @RequestMapping(value="/canclegame.html",method=RequestMethod.GET)
	 public String canclehost(HttpSession session,ModelMap models,@RequestParam Integer i )
	 {
		if(us.getHostusers().contains((String)session.getAttribute("Username")))
		{
		    us.removehost((String)session.getAttribute("Username"));
		    
		}
		if(us.getJoinusers().contains((String)session.getAttribute("Username")))
		{
		
			us.removejoin((String)session.getAttribute("Username"));
			
		}
				
		for(Game s: us.getCuurentgames())
		{
			
			
			if(s.getHost().equals((String)session.getAttribute("Username")))
			{
				us.removeCurrentgame(s);
				 models.put("wait", "Wait for other player to join the game..");
				 break;
				
				
					
			}
			else if(s.getJoin().equals((String)session.getAttribute("Username")))
			{
				us.removeCurrentgame(s);
				models.put("wait", "Wait for other player to host the game..");
			break;
			}
			}
		models.put("user",(String) session.getAttribute("Username"));
		 return "player2";
		}
		
		
	 
	 
	
	 
	 @RequestMapping("/game.deferred.json")
	 @ResponseBody
	 public DeferredResult<List<Game>> gameDeffered()
	 {
		 DeferredResult<List<Game>> result=new DeferredResult<List<Game>>();
		 us.addGameResult(result);
		 return result;
		 
	 }
	 @RequestMapping("/game.json")
	    public String gameJson( ModelMap models )
	    {
	        
	        models.put( "g",us.getCuurentgames() );
	      
	        return "jsonView";
	    }
	
	 @RequestMapping(value = "/player2gamehost.html", method = RequestMethod.GET)
	 public String player2gamehost(HttpSession session, ModelMap models)
	 {
		 if (session.getAttribute("Username") == null) {
				return "redirect:login.html";
			}
		 String username=(String) session.getAttribute("Username");
		
		 
		 if(us.getJoinusers().size()==0)
		 {
			 if(!us.getHostusers().contains(username))
			 {  
				 
				 us.addHost(username);
			 }
			 
			
			
			
			
			
		 }
		 else
		 {
			
			 Game temp=new Game();
			 temp.setHost(username);
			 temp.setJoin(us.getJoinusers().get(0));
			
			 us.addCurrentGame(temp);
			
		
			
			 us.removejoin(us.getJoinusers().get(0));
			
			
			 
		 }
		 models.put("wait", "Waiting for other player to join the game...");
			
		 models.put("user", username);
		   return "temp";
	 }
	 
	 @RequestMapping(value = "/player2gamejoin.html", method = RequestMethod.GET)
	 public String player2gamejoin(HttpSession session, ModelMap models)
	 {
		 
		 if (session.getAttribute("Username") == null) {
				return "redirect:login.html";
			}
		 String username=(String) session.getAttribute("Username");
		
		 if(us.getHostusers().size()==0)
		 {
			 if(!us.getJoinusers().contains(username))
			 {  
				
				 us.addjoin(username);
				
			 }
			
		   
		 }
		 else
		 {
			 
			 
			 Game temp=new Game();
			 temp.setHost(us.getHostusers().get(0));
			 temp.setJoin(username);
			
			 us.addCurrentGame(temp);
			
			
			
			
			 us.removehost(us.getHostusers().get(0));
			
			
			 
		 }
		 models.put("wait", "Wait for other player to host the game..");
		 models.put("user", username);
		   return "temp";
	 }
	

	@RequestMapping(value = "/logout.html", method = RequestMethod.GET)
	public String logout(HttpSession session, ModelMap models) {
		if (session.getAttribute("Username") == null) {
			return "redirect:login.html";
		}
		Users u = userDao.getUser((String) session.getAttribute("Username"));
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Games g = (Games) session.getAttribute("game");

		List<Games> sg = userDao.getSavedGames(u);
		List<Games> temp_list = new ArrayList<Games>();

		for (Games s : sg) {
			if (s.getId() != g.getId()) {
				temp_list.add(s);
			}

		}

		Date dt = new Date();
		try {
			g.setEnd_time(df.parse(df.format(dt)));

		} catch (ParseException e) {

			e.printStackTrace();
		}
		g.setLooser(g.getPlayer1());
		g.setWinner(null);
		g.setPlayer2(null);

		if (session.getAttribute("rtime") != null) {
			long k = ((Date) session.getAttribute("rtime")).getTime();
			g.setDuration((g.getDuration() + (int) (g.getEnd_time().getTime() - k)));
		} else {
			g.setDuration((int) (g.getEnd_time().getTime() - g.getStart_time()
					.getTime()));
		}

		if (g.getSaved_at() != null) {
			g.getPlayer2_pos().clear();
			g.getPos().clear();
		}

		g.setSaved_at(null);

		userDao.saveGame(g);
		u.setSaved_games(temp_list);
		u.getPlayed_games().add(userDao.getGame(g.getStart_time()));
		userDao.insertUser(u);
       
		return "redirect:ttt/j_spring_security_logout";
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String validation(HttpSession session, ModelMap models,
			@ModelAttribute("user") Users user) {

		if (userDao.validUser(user) == true) {
			session.setAttribute("Username", user.getUsername());
           // us.add(user.getUser_name());
			
			return "redirect:welcome.html";
		}

		else {

			return "login";
		}
	}

	@RequestMapping(value = "/welcome.html", method = RequestMethod.GET)
	public String game(HttpSession session, ModelMap models) {

		if (session.getAttribute("Username") == null) {
			return "redirect:login.html";
		}
		
		 session.removeAttribute("result");
		models.put("user", session.getAttribute("Username"));
		return "welcome";
	}

	@RequestMapping(value = "/displaygame.html", method = RequestMethod.GET)
	public String diaplayGame(HttpSession session, ModelMap models) {
		if (session.getAttribute("Username") == null) {
			return "redirect:login.html";
		}
		session.removeAttribute("result");
		List<String> p1 = new ArrayList<String>();
		List<String> ai = new ArrayList<String>();
		session.setAttribute("p1", p1);
		session.setAttribute("ai", ai);
		Games g = new Games();
		session.setAttribute("game", g);

		models.put("p1", p1);
		models.put("ai", ai);
		models.put("cont", "Please make your move... ");
		models.put("user", session.getAttribute("Username"));
		return "displaygame";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gamelogic.html", method = RequestMethod.GET)
	public String gameLogic(HttpSession session, ModelMap models,
			@RequestParam Integer i, @RequestParam Integer j) {
		if (session.getAttribute("Username") == null) {
			return "redirect:login.html";
		}
		Users u = userDao.getUser((String) session.getAttribute("Username"));
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		List<String> p1 = (List<String>) session.getAttribute("p1");
		List<String> ai = (List<String>) session.getAttribute("ai");
		Games g = (Games) session.getAttribute("game");
		if (g.getStart_time() == null) {
			g.setPlayer1(u);

			Date dt = new Date();
			try {
				g.setStart_time(df.parse(df.format(dt)));

			} catch (ParseException e) {

				e.printStackTrace();
			}

		}
		p1.add("" + i + "" + j + "");
		if (userDao.isPlayerWin(p1) == true) {

			session.setAttribute("p1", p1);
			session.setAttribute("ai", ai);
			models.put("p1", p1);
			models.put("ai", ai);
			models.put("user", session.getAttribute("Username"));
			models.put("result", "You Won..");
			session.setAttribute("result", "result");
			g.setWinner(u);
			List<Games> sg = userDao.getSavedGames(u);
			List<Games> temp_list = new ArrayList<Games>();

			for (Games s : sg) {
				if (s.getId() != g.getId()) {
					temp_list.add(s);
				}

			}

			Date dt = new Date();
			try {
				g.setEnd_time(df.parse(df.format(dt)));

			} catch (ParseException e) {

				e.printStackTrace();
			}
			g.setPlayer2(null);
			g.setLooser(null);
			
			if (session.getAttribute("rtime") != null) {
				long k = ((Date) session.getAttribute("rtime")).getTime();
				g.setDuration((g.getDuration() + (int) (g.getEnd_time()
						.getTime() - k)));
			} else {
				g.setDuration((int) (g.getEnd_time().getTime() - g
						.getStart_time().getTime()));
			}
			if (g.getSaved_at() != null) {
				g.setPlayer2_pos(null);
				g.setPos(null);
			}
			g.setSaved_at(null);
			userDao.saveGame(g);
			u.setSaved_games(temp_list);

			u.getPlayed_games().add(userDao.getGame(g.getStart_time()));

			userDao.insertUser(u);

			return "displaygame";
		}

		else if (ai.size() < userDao.aiMove(p1, ai).size()) {

			if (userDao.isPlayerWin(ai) == true) {

				if (session.getAttribute("Username") == null) {
					return "redirect:login.html";
				}

				session.setAttribute("p1", p1);
				session.setAttribute("ai", ai);
				models.put("user", session.getAttribute("Username"));
				models.put("p1", p1);
				models.put("ai", ai);
				models.put("result", "Computer Won...");
				session.setAttribute("result", "result");
				List<Games> sg = userDao.getSavedGames(u);
				List<Games> temp_list = new ArrayList<Games>();

				for (Games s : sg) {
					if (s.getId() != g.getId()) {
						temp_list.add(s);
					}

				}
				Date dt = new Date();
				try {
					g.setEnd_time(df.parse(df.format(dt)));

				} catch (ParseException e) {

					e.printStackTrace();
				}

				g.setWinner(null);
				g.setPlayer2(null);
				g.setLooser(g.getPlayer1());
			
				if (session.getAttribute("rtime") != null) {
					long k = ((Date) session.getAttribute("rtime")).getTime();
					g.setDuration((g.getDuration() + (int) (g.getEnd_time()
							.getTime() - k)));
				} else {
					g.setDuration((int) (g.getEnd_time().getTime() - g
							.getStart_time().getTime()));
				}
				if (g.getSaved_at() != null) {
					g.setPlayer2_pos(null);
					g.setPos(null);
				}
				g.setSaved_at(null);
				userDao.saveGame(g);

				u.getPlayed_games().add(userDao.getGame(g.getStart_time()));
				u.setSaved_games(temp_list);
				userDao.insertUser(u);

				return "displaygame";

			}
		} else if (ai.size() < userDao.p1Move(p1, ai).size()) {

			session.setAttribute("p1", p1);
			session.setAttribute("ai", ai);
			session.setAttribute("game", g);

			models.put("p1", p1);
			models.put("ai", ai);
			models.put("user", session.getAttribute("Username"));
			models.put("cont", "Please make your move..");
			
			return "displaygame";

		}

		else if (userDao.isTie(p1, ai) == true) {

			session.setAttribute("p1", p1);
			session.setAttribute("ai", ai);
			models.put("p1", p1);
			models.put("ai", ai);
			
			models.put("user", session.getAttribute("Username"));
			models.put("result", "Game tied..");
			session.setAttribute("result", "result");
			List<Games> sg = userDao.getSavedGames(u);
			List<Games> temp_list = new ArrayList<Games>();

			for (Games s : sg) {
				if (s.getId() != g.getId()) {
					temp_list.add(s);
				}

			}
			Date dt = new Date();
			try {
				g.setEnd_time(df.parse(df.format(dt)));

			} catch (ParseException e) {

				e.printStackTrace();
			}

			g.setPlayer2(null);
			g.setLooser(null);
		
			g.setWinner(null);
			g.setTie(true);
			if (session.getAttribute("rtime") != null) {
				long k = ((Date) session.getAttribute("rtime")).getTime();
				g.setDuration((g.getDuration() + (int) (g.getEnd_time()
						.getTime() - k)));
			} else {
				g.setDuration((int) (g.getEnd_time().getTime() - g
						.getStart_time().getTime()));
			}
			if (g.getSaved_at() != null) {
				g.setPlayer2_pos(null);
				g.setPos(null);
			}
			
			
			g.setSaved_at(null);
			userDao.saveGame(g);
             
			u.getPlayed_games().add(userDao.getGame(g.getStart_time()));
			u.setSaved_games(temp_list);
			userDao.insertUser(u);
             
			return "displaygame";

		} else {

			List<String> s = new ArrayList<String>();
			for (int w = 0; w < 3; w++) {
				for (int q = 0; q < 3; q++) {
					if (!p1.contains("" + w + "" + q + "")
							&& !ai.contains("" + w + "" + q + "")) {
						s.add("" + w + "" + q + "");
					}
				}
			}

			Random r = new Random();

			ai.add(s.get(r.nextInt(s.size())));
			models.put("cont", "Please make your move... ");
			session.setAttribute("p1", p1);
			session.setAttribute("ai", ai);
			models.put("user", session.getAttribute("Username"));
			models.put("p1", p1);
			models.put("ai", ai);
			session.setAttribute("game", g);
			
			return "displaygame";

		}

		return null;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newgame.html", method = RequestMethod.GET)
	public String newGame(HttpSession session) {

		if (session.getAttribute("Username") == null) {
			return "redirect:login.html";
		}
		List<String> p1 = (List<String>) session.getAttribute("p1");
		if (p1.size() == 0 || session.getAttribute("result") != null) {
			session.removeAttribute("result");
			return "redirect:displaygame.html";
		}
		Users u = userDao.getUser((String) session.getAttribute("Username"));

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Games g = (Games) session.getAttribute("game");
		List<Games> sg = userDao.getSavedGames(u);
		List<Games> temp_list = new ArrayList<Games>();
		
		for (Games s : sg) {
			if (s.getId() != g.getId()) {
				temp_list.add(s);
			}

		}
		Date dt = new Date();
		try {
			g.setEnd_time(df.parse(df.format(dt)));

		} catch (ParseException e) {

			e.printStackTrace();
		}
		g.setLooser(g.getPlayer1());
		g.setWinner(null);
		g.setPlayer2(null);
		g.setSaved_at(null);
		if (session.getAttribute("rtime") != null) {
			
			long i = ((Date) session.getAttribute("rtime")).getTime();
			g.setDuration((g.getDuration() + (int) (g.getEnd_time().getTime() - i)));
		} else {
			g.setDuration((int) (g.getEnd_time().getTime() - g.getStart_time()
					.getTime()));
		}
		if (g.getSaved_at() != null) {
			g.getPlayer2_pos().clear();
			g.getPos().clear();
		}
		userDao.saveGame(g);

		u.getPlayed_games().add(userDao.getGame(g.getStart_time()));
		u.setSaved_games(temp_list);
		userDao.insertUser(u);

		return "redirect:displaygame.html";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/save_game.html", method = RequestMethod.GET)
	public String saveGame(HttpSession s) {

		if (s.getAttribute("Username") == null) {
			return "redirect:login.html";
		}

		List<String> p1 = (List<String>) s.getAttribute("p1");
		List<String> ai = (List<String>) s.getAttribute("ai");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Games g = (Games) s.getAttribute("game");

		for (Games gs : userDao.getSavedGames(userDao.getUser((String) s
				.getAttribute("Username")))) {
			if (gs.getStart_time().equals(g.getStart_time())) {
				Date dt = new Date();
				try {
					gs.setSaved_at(df.parse(df.format(dt)));

				} catch (ParseException e) {

					e.printStackTrace();
				}

				gs.setPos(p1);
				gs.setPlayer2_pos(ai);
				long i = ((Date) s.getAttribute("rtime")).getTime();
				gs.setDuration((gs.getDuration() + (int) (gs.getSaved_at()
						.getTime() - i)));
				userDao.saveGame(gs);
				return "redirect:displaygame.html";

			}

		}

		Date dt = new Date();
		try {
			g.setSaved_at(df.parse(df.format(dt)));

		} catch (ParseException e) {

			e.printStackTrace();
		}
		g.setLooser(null);
		g.setWinner(null);
		g.setPlayer2(null);
		g.setEnd_time(null);
		g.setPos(p1);
		g.setPlayer2_pos(ai);

		g.setDuration((int) (g.getSaved_at().getTime() - g.getStart_time()
				.getTime()));

		userDao.saveGame(g);
		Users u = userDao.getUser((String) s.getAttribute("Username"));
		u.getSaved_games().add(userDao.getGame(g.getStart_time()));
		userDao.insertUser(u);

		return "redirect:displaygame.html";
	}

	@RequestMapping(value = "/display_resumegame.html", method = RequestMethod.GET)
	public String resumeResumeGame(HttpSession session, ModelMap models) {
		if (session.getAttribute("Username") == null) {
			return "redirect:login.html";
		}

		List<Games> saved_Games = userDao.getSavedGames(userDao
				.getUser((String) session.getAttribute("Username")));
		models.put("games", saved_Games);
		return "display_saved_games";
	}

	@RequestMapping(value = "/resumegame.html", method = RequestMethod.GET)
	public String resumeGame(HttpSession session, ModelMap models,
			@RequestParam Integer d) {
		if (session.getAttribute("Username") == null) {
			return "redirect:login.html";
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");

		Date dt = new Date();
		try {

			session.setAttribute("rtime", df.parse(df.format(dt)));

		} catch (ParseException e) {

			e.printStackTrace();
		}


		Games g = userDao.getResumeGame(d);

		List<String> p1 = g.getPos();
		List<String> ai = g.getPlayer2_pos();
		session.setAttribute("p1", p1);
		session.setAttribute("ai", ai);

		session.setAttribute("game", g);

		models.put("p1", p1);
		models.put("ai", ai);
		models.put("cont", "Please make your move... ");
		models.put("user", session.getAttribute("Username"));
		return "displaygame";
	}

	@RequestMapping(value = "/gameHistory.html", method = RequestMethod.GET)
	public String game_history(ModelMap m, HttpSession session) {
		
		if (session.getAttribute("Username") == null) {
			return "redirect:login.html";
		}
		Users u = userDao.getUser((String) session.getAttribute("Username"));
		
		List<Games> pg = u.getPlayed_games();
        
		int noOfPlayedGame=pg.size();
		int noOfGamesWithAi=0;
		int noOfGamesWithHuman=0;
		int winAi=0;
		int winhuman=0;
		
		double winRateWithAi=0.0;
		double winRateWithHuman=0.0;
		List<Games> thisMonth=new ArrayList<Games>();
		Date dd=new Date();
		for(Games g: pg)
		{
			if(g.getEnd_time().getMonth()==dd.getMonth())
			{
				
				thisMonth.add(g);
			}
			if(g.getPlayer2()==null)
			{
				noOfGamesWithAi++;
				if(g.getWinner()!=null)
				{
					if(g.getWinner().getId()==u.getId())
					   winAi++;
				}
			}
			
			else
			{
				noOfGamesWithHuman++;
				if(g.getWinner()!=null)
				{
					if(g.getWinner().getId()==u.getId())
					   winhuman++;
				}
			}
				
		}
		
		DecimalFormat d=new DecimalFormat("##.##");
		
		if(noOfGamesWithAi != 0)
		{
			
			
			
		   winRateWithAi=Double.parseDouble(d.format(((double)winAi*100)/(double)noOfGamesWithAi));;
		   m.put("wa", winRateWithAi);
		}
		else
		{
			m.put("wa", 0.0);
		}
		if(noOfGamesWithHuman!=0)
		{
		   winRateWithHuman=Double.parseDouble(d.format(((double)winhuman *100)/(double)noOfGamesWithHuman));
		   m.put("wh", winRateWithHuman);
		   
		}
		else
			m.put("wh", 0.0);
		 
		m.put("noa", noOfGamesWithAi);
		m.put("noh", noOfGamesWithHuman);
		m.put("nop", noOfPlayedGame);
		m.put("user", (String)session.getAttribute("Username"));
		m.put("thismonth", thisMonth);
		
		return "gamehistory";
	}
	
	@RequestMapping(value = "/guestgamedisplay.html", method = RequestMethod.GET)
	public String guestgameGame(HttpSession session, ModelMap models) {
		
		session.removeAttribute("result");
		List<String> p1 = new ArrayList<String>();
		List<String> ai = new ArrayList<String>();
		session.setAttribute("p1", p1);
		session.setAttribute("ai", ai);
		

		models.put("p1", p1);
		models.put("ai", ai);
		models.put("cont", "Please make your move... ");
		
		return "guestgame";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/guestgame.html", method = RequestMethod.GET)
	public String guestgame(HttpSession session, ModelMap models,
			@RequestParam Integer i, @RequestParam Integer j) {
		List<String> p1 = (List<String>) session.getAttribute("p1");
		List<String> ai = (List<String>) session.getAttribute("ai");
			p1.add("" + i + "" + j + "");
		if (userDao.isPlayerWin(p1) == true) {			
			models.put("p1", p1);
			models.put("ai", ai);			
			models.put("result", "You Won..");
			session.setAttribute("result", "result");
			return "guestgame";
		}

		else if (ai.size() < userDao.aiMove(p1, ai).size()) {

			if (userDao.isPlayerWin(ai) == true) {				
				models.put("p1", p1);
				models.put("ai", ai);
				models.put("result", "Computer Won...");
				session.setAttribute("result", "result");
				
				return "guestgame";

			}
		} else if (ai.size() < userDao.p1Move(p1, ai).size()) {

			session.setAttribute("p1", p1);
			session.setAttribute("ai", ai);
			

			models.put("p1", p1);
			models.put("ai", ai);
			models.put("user", session.getAttribute("Username"));
			models.put("cont", "Please make your move..");
			
			return "guestgame";

		}

		else if (userDao.isTie(p1, ai) == true) {

			session.setAttribute("p1", p1);
			session.setAttribute("ai", ai);
			models.put("p1", p1);
			models.put("ai", ai);
			
			models.put("user", session.getAttribute("Username"));
			models.put("result", "Game tied..");
			session.setAttribute("result", "result");
			
             
			return "guestgame";

		} else {

			List<String> s = new ArrayList<String>();
			for (int w = 0; w < 3; w++) {
				for (int q = 0; q < 3; q++) {
					if (!p1.contains("" + w + "" + q + "")
							&& !ai.contains("" + w + "" + q + "")) {
						s.add("" + w + "" + q + "");
					}
				}
			}

			Random r = new Random();

			ai.add(s.get(r.nextInt(s.size())));
			models.put("cont", "Please make your move... ");
			session.setAttribute("p1", p1);
			session.setAttribute("ai", ai);
			
			models.put("p1", p1);
			models.put("ai", ai);
			
			
			return "guestgame";

		}

		return null;

	}
	
	 @RequestMapping("/board.deferred.json")
	 @ResponseBody
	 public DeferredResult<String> boardDeffered()
	 {
		 DeferredResult<String> result=new DeferredResult<String>();
		 gs.addPosResult(result);
		 return result;
		 
	 }
	 @RequestMapping("/board.json")
	    public String boardJson( ModelMap models )
	    {
	        
	        models.put( "pos",gs.getGame_positions() );
	      
	        return "jsonView";
	    }
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/plaer2gamelogic.html", method = RequestMethod.GET)
	public String player2gamelogic(HttpSession session, ModelMap models,
			@RequestParam Integer i, @RequestParam Integer j) {
			String username=(String)session.getAttribute("Username");
		
			
			
		for(Game s:us.getCuurentgames())
		{
			if(s.getHost().equals(username))
			{
	             if(session.getAttribute("tempdate") == null)
	             {
	            	 session.setAttribute("tempdate", new Date());
	             }
				Game temp=new Game();
				temp=s;
				temp.setTurn(true);
				
				
					temp.getHost_Position().add(i+""+j);
					if(userDao.isPlayerWin(temp.getHost_Position())==true)
					{
						temp.setResult(temp.getHost()+"  won the Match..");
						
						Games g2=new Games();
						
						Date st = (Date)session.getAttribute("tempdate");
						session.removeAttribute("tempdate");
						g2.setStart_time(st);
						g2.setEnd_time(new Date());
						long endt = g2.getEnd_time().getTime();
						long startt = (long)st.getTime();
						int duration=(int)(endt-startt);
						g2.setDuration(duration);
						
						g2.setPlayer1(userDao.getUser(username));
						g2.setPlayer2(userDao.getUser(temp.getJoin()));
						g2.setWinner(g2.getPlayer1());
						g2.setLooser(g2.getPlayer2());
						
						userDao.saveGame(g2);
						Users host=userDao.getUser(username);
						Users join=userDao.getUser(temp.getJoin());
						host.getPlayed_games().add(userDao.getGame(g2.getStart_time()));
						join.getPlayed_games().add(userDao.getGame(g2.getStart_time()));
						userDao.insertUser(host);
						userDao.insertUser(join);				
						session.removeAttribute("st");
						
						
					}
					
					
						
					us.removetemp(s);
					us.addCurrentGame(temp);
				
		      break;
				
				
			}
			else if(s.getJoin().equals(username))
			{
				Game temp=new Game();
				temp=s;
				temp.getJoin_position().add(i+""+j);
				
				temp.setTurn(false);
				
				if(userDao.isPlayerWin(temp.getJoin_position())==true)
				{
					temp.setResult(temp.getJoin()+" won the Match..");
					
					Games g2=new Games();
					Date st = (Date)session.getAttribute("tempdate");
					session.removeAttribute("tempdate");
					g2.setStart_time(st);
					g2.setEnd_time(new Date());
					g2.setDuration((int)(g2.getEnd_time().getTime()-g2.getStart_time().getTime()));
					g2.setPlayer1(userDao.getUser(temp.getHost()));
					g2.setPlayer2(userDao.getUser(username));
					g2.setWinner(g2.getPlayer2());
					g2.setLooser(g2.getPlayer1());
					
					userDao.saveGame(g2);
					Users join=userDao.getUser(username);
					Users host=userDao.getUser(temp.getHost());
					join.getPlayed_games().add(userDao.getGame(g2.getStart_time()));
					host.getPlayed_games().add(userDao.getGame(g2.getStart_time()));
					userDao.insertUser(join);
					userDao.insertUser(host);
					
					
				}
				us.removetemp(s);
				us.addCurrentGame(temp);
				break;
			}
			
		}
		
		models.put("user", username);
		
		return "temp";

	}
	

}