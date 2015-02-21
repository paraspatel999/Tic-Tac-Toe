package ttt.service;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.async.DeferredResult;

import ttt.model.Game;
import ttt.model.Games;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@Service
public class UserService {

	

	 private static final ObjectMapper objectMapper = new ObjectMapper();

	    
	    Queue<DeferredResult<String>> hostresult;
	    Queue<DeferredResult<String>> joinresult;
	  
	    Queue<DeferredResult<List<Game>>> gameresult ;
	 List<String> usernames;
	 List<String> hostusers;
	 List<String> joinusers;
	 List<String> games;
	 List<Map<String, List<String>>> positions;
	 List<Game> playgame;
	 
	 
	 public UserService()
    {
		 positions=new ArrayList<Map<String,List<String>>>();
        usernames = new ArrayList<String>();
        hostusers = new ArrayList<String>();
        joinusers = new ArrayList<String>();
        games=new ArrayList<String>();
        playgame=new ArrayList<Game>();
       
        hostresult=new LinkedList<DeferredResult<String>>();
       joinresult= new LinkedList<DeferredResult<String>>();
       gameresult= new LinkedList<DeferredResult<List<Game>>>();
    }
	 public List<String> getGames() {
			return games;
		}
	 public List<Map<String, List<String>>> getPosition() {
			return positions;
		}
	 public List<Game> getCuurentgames() {
			return playgame;
		}
	 
	 
	 public List<String> getUsernames() {
			return usernames;
		}
	public List<String> getHostusers() {
		return hostusers;
	}
	public List<String> getJoinusers() {
		return joinusers;
	}

	 public void addCurrentGame( Game game )
	    {
	        playgame.add( game );
	     
	        processDeferredGameResults();
	    }
	public void removetemp(Game game)
	{
		playgame.remove(game);
	}
	
	 public void addPositions( Map<String, List<String>> temp )
	    {
	        positions.add( temp );
	     
	        //processDeferredGameResults();
	    }
	
	

	 public void addHost( String username )
	    {
	        hostusers.add( username );
	     
	        processDeferredHostResults();
	    }
	 
	 public void addjoin( String username )
	    {
	        joinusers.add( username );
	     
	        processDeferredJoinResults();
	    }
	 public void removePositions( Map<String, List<String>> temp )
	    {
	        positions.remove( temp );
	     
	       // processDeferredGameResults();
	    }
	 
	
	 public void removehost( String username )
	    {
	        hostusers.remove( username );
	        
	        processDeferredHostResults();
	    }
	 public void removejoin( String username )
	    {
	        joinusers.remove( username );
	        
	        processDeferredJoinResults();
	    }
	 public void removeCurrentgame( Game game )
	    {
	        playgame.remove( game );
	        
	       processDeferredGameResults();
	    }
	
	 
	 public void addGameResult( DeferredResult<List<Game>> result )
	    {
	        gameresult.add( result );
	    }
	 
	 public void addHostResult( DeferredResult<String> result )
	    {
	        hostresult.add( result );
	    }
	 public void addJoinResult( DeferredResult<String> result )
	    {
	        joinresult.add( result );
	    }
	
	 
	 
	 
	 private void processDeferredGameResults()
	    {
	        
	       List<Game> json=new ArrayList<Game>();
	        
	        try
	        {
	        	
	        	json=playgame;
	        	}
	        catch( Exception e )
	        {
	            
	        }

	        // process queued results
	        for(DeferredResult<List<Game>> result:gameresult)
	        {
	        	result.setResult(json);
	        }
	       gameresult.clear();
}
	
	 private void processDeferredHostResults()
	    {
	        // convert username list to json
	        String json = "";
	        try
	        {
	            StringWriter sw = new StringWriter();
	            objectMapper.writeValue( sw, hostusers );
	            json = sw.toString();
	        }
	        catch( Exception e )
	        {
	            
	        }

	        // process queued results
	        while( !hostresult.isEmpty() )
	        {
	            DeferredResult<String> result = hostresult.remove();
	            result.setResult( json );
	        }
	        hostresult.clear();
}
	 private void processDeferredJoinResults()
	    {
	        // convert username list to json
	        String json = "";
	        try
	        {
	            StringWriter sw = new StringWriter();
	            objectMapper.writeValue( sw, joinusers );
	            json = sw.toString();
	        }
	        catch( Exception e )
	        {
	            
	        }

	        // process queued results
	        while( !joinresult.isEmpty() )
	        {
	            DeferredResult<String> result = joinresult.remove();
	            result.setResult( json );
	        }
	        joinresult.clear();
}
}
