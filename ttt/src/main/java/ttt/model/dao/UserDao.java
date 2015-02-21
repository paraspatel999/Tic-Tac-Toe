package ttt.model.dao;

import java.util.Date;
import java.util.List;





import ttt.model.Games;
import ttt.model.Users;


public interface UserDao {

    Users getUser( String username );

    List<Users> getUsers();
 
     List<Games> getGamesAgainstAI(Users user);
     List<Games> getSavedGames(Users user);
  // List<Position> getGame_position(Games save_game);
   
   public Users insertUser(Users user);
   public boolean validUser(Users user);
   public boolean isPlayerWin(List<String> p1);
   public List<String> aiMove(List<String> p1,List<String> ai);
   public List<String> p1Move(List<String> p1,List<String> ai);
   public boolean isTie(List<String> p1,List<String> ai);
   public void saveGame(Games g);
   public Games getResumeGame(int id);
   public Games getGame(Date start_time);
}