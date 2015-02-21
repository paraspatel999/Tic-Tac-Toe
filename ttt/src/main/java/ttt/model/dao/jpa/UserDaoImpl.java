package ttt.model.dao.jpa;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;










import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;



import ttt.model.Games;
import ttt.model.Users;
import ttt.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;
    
  

    @Override
    public Users getUser( String username )
    {
    	
    	
    	return (Users)entityManager.createQuery( "from Users where username='"+username+"'", Users.class).getSingleResult();
              
    	
    	
    	
         
    }

    @Override
    @ManyToOne
   
    public List<Users> getUsers()
    {
        return entityManager.createQuery( "from Users", Users.class )
            .getResultList();
    
    }
    
    @Override
    
    public List<Games> getGamesAgainstAI(Users user)
    {
    	
    	
        return entityManager.createQuery("from Games where player1_id="+user.getId()+" and player2_id=null",Games.class).getResultList();
    }
    
    @Override
    @PreAuthorize("principal.username == #user.username")
    public List<Games> getSavedGames(Users user)
    {
    	
    	
    	return user.getSaved_games();
    
    }
    
  

    @Override
    @Transactional
    public Users insertUser(Users user)
    {
    	
    	return entityManager.merge(user);
    	
    }
    
    
    @Override
    @Transactional
    public void saveGame(Games g)
    {
    	
    	 entityManager.merge(g);
    }
    @Override
    public Games getGame(Date start_time)
    {
    	return entityManager.createQuery("from Games where  start_time=:st", Games.class).setParameter("st", start_time).getSingleResult();
    }
    @Override
    public Games getResumeGame(int id)
    {
    	return entityManager.find(Games.class, id);
    }
    
    
 @Override
 public boolean validUser(Users user)
 {
	 
	 boolean isValid= false;
	  for(Users u: getUsers())
	  {
		  if(u.getUsername().equals(user.getUsername())&& u.getPassword().equals(user.getPassword()))
		  {
			  isValid=true;
		  }
	  }
	 
	 return isValid;
 }
 @Override
 public boolean isPlayerWin(List<String> p1)
 {
	boolean isWin=false;
	
	
	
	for(int t=0;t<3;t++)
	{
		if(p1.contains(t+"0") && p1.contains(t+"1") && p1.contains(t+"2"))
		{
		   isWin=true;
			break;
		}
		else if(p1.contains("0"+t) && p1.contains("1"+t) && p1.contains("2"+t))
		{
			isWin=true;
			break;
		}
		else if(p1.contains("00") && p1.contains("11") && p1.contains("22"))
		{
			isWin=true;
			break;
		}
		else if(p1.contains("02") && p1.contains("11") && p1.contains("20"))
		{
			isWin=true;
			break;
		}
	}
	return isWin;
 }
 @Override
 public List<String> aiMove(List<String> p1,List<String> ai)
 {
	 for (int t=0;t<3;t++)
		{
			if(ai.contains(t+"0") && ai.contains(t+"1") && !p1.contains(t+"2"))
			{
				ai.add(t+"2");
				
				break;
			}
			else if(ai.contains(t+"1") && ai.contains(t+"2") && !p1.contains(t+"0"))
			{
				ai.add(t+"0");
			
				break;
				}
			else if(ai.contains(t+"0") && ai.contains(t+"2") && !p1.contains(t+"1"))
			{
				ai.add(t+"1");
				
				break;
				}
			else if(ai.contains("0"+t) && ai.contains("1"+t) && !p1.contains("2"+t))
			{
				ai.add("2"+t);
				
				break;
				}
			else if(ai.contains("1"+t) && ai.contains("2"+t) && !p1.contains("0"+t))
			{
				ai.add("0"+t);
				
				break;
				}
			else if(ai.contains("0"+t) && ai.contains("2"+t) && !p1.contains("1"+t))
			{
				ai.add("1"+t);
				
				break;
				}
			else if(ai.contains("00") && ai.contains("11") && !p1.contains("22"))
			{
				ai.add("22");
								break;
			}	
			else if(ai.contains("00") && ai.contains("22") && !p1.contains("11"))
			{
				ai.add("11");
				
				break;
			}
			else if(ai.contains("11") && ai.contains("22") && !p1.contains("00"))
			{
				ai.add("00");
				
				break;
			}
			else if(ai.contains("02") && ai.contains("11") && !p1.contains("20"))
			{
				ai.add("20");
				
				break;
			}
			else if(ai.contains("02") && ai.contains("20") && !p1.contains("11"))
			{
				ai.add("11");
				
				break;
			}
			else if(ai.contains("20") && ai.contains("11") && !p1.contains("02"))
			{
				ai.add("02");
				
				break;
			}
		}
	 
	 
	 return ai;
	 
	 
 }
 public List<String> p1Move(List<String> p1,List<String> ai)
 {
	 for(int t=0;t<3;t++)
		{
		 if(p1.contains(t+"0") && p1.contains(t+"1") && !ai.contains(t+"2"))
			{
				ai.add(t+"2");
				
				break;
			}
			else if(p1.contains(t+"1") && p1.contains(t+"2") && !ai.contains(t+"0"))
			{
				ai.add(t+"0");
				
				break;
				}
			else if(p1.contains(t+"0") && p1.contains(t+"2") && !ai.contains(t+"1"))
			{
				ai.add(t+"1");
				
				break;
				}
			else if(p1.contains("0"+t) && p1.contains("1"+t) && !ai.contains("2"+t))
			{
				ai.add("2"+t);
				
				break;
				}
			else if(p1.contains("1"+t) && p1.contains("2"+t) && !ai.contains("0"+t))
			{
				ai.add("0"+t);
				
				break;
				}
			else if(p1.contains("0"+t) && p1.contains("2"+t) && !ai.contains("1"+t))
			{
				ai.add("1"+t);
				
				break;
				}
			else if(p1.contains("00") && p1.contains("11") && !ai.contains("22"))
			{
				ai.add("22");
				
				break;
			}	
			else if(p1.contains("00") && p1.contains("22") && !ai.contains("11"))
			{
				ai.add("11");
				
				break;
			}
			else if(p1.contains("11") && p1.contains("22") && !ai.contains("00"))
			{
				ai.add("00");
				
				break;
			}
			else if(p1.contains("02") && p1.contains("11") && !ai.contains("20"))
			{
				ai.add("20");
				
				break;
			}
			else if(p1.contains("02") && p1.contains("20") && !ai.contains("11"))
			{
				ai.add("11");
				
				break;
			}
			else if(p1.contains("20") && p1.contains("11") && !ai.contains("02"))
			{
				ai.add("02");
				
				break;
			}
			
		}
	 return ai;
 }
 public boolean isTie(List<String> p1,List<String> ai)
 {
	 boolean isTie=false;
	 if((p1.contains("00")||ai.contains("00"))
				&&(p1.contains("01")||ai.contains("01"))
				&&(p1.contains("02")||ai.contains("02"))
				&&(p1.contains("10")||ai.contains("10"))
				&&(p1.contains("11")||ai.contains("11"))
				&&(p1.contains("12")||ai.contains("12"))
				&&(p1.contains("20")||ai.contains("20"))
				&&(p1.contains("21")||ai.contains("21"))
				&&(p1.contains("22")||ai.contains("22")))
				{
					isTie=true;
				}
	 
	 return isTie;
 }
}