package ttt.service;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.async.DeferredResult;

import ttt.model.Game;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GameServices {

	 private static final ObjectMapper objectMapper = new ObjectMapper();
	 List<String> games;
	 List<String> game_positions;
	 Queue<DeferredResult<String>> gameresult;
	 Queue<DeferredResult<String>> posresult;
	 public GameServices()
	 {
		 
		 games=new ArrayList<String>();
		 game_positions=new ArrayList<String>();
		 gameresult=new LinkedList<DeferredResult<String>>();
		 posresult=new LinkedList<DeferredResult<String>>();
		 
	 }
	 
	public List<String> getGames() {
		return games;
	}
	public List<String> getGame_positions() {
		return game_positions;
	}
	 public void addGame( String game )
	    {
	        games.add( game );
	     
	        processDeferredResults();
	    }
	 public void addPosition( String pos )
	    {
	        game_positions.add( pos );
	     
	        processDeferredPosResults();
	    }
	 public void removeGame( String game )
	    {
	        games.remove( game );
	        
	        processDeferredResults();
	    }
	 public void removePos( String pos )
	    {
	        game_positions.remove( pos );
	        
	        processDeferredPosResults();
	    }
	 
	 public void addGameResult( DeferredResult<String> result )
	    {
	        gameresult.add( result );
	    }
	 public void addPosResult( DeferredResult<String> result )
	    {
	        posresult.add( result );
	    }
	 
	 private void processDeferredResults()
	    {
	        // convert username list to json
	        String json = "";
	        try
	        {
	            StringWriter sw = new StringWriter();
	            objectMapper.writeValue( sw, games );
	            json = sw.toString();
	        }
	        catch( Exception e )
	        {
	            
	        }

	        /*// process queued results
	        while( !gameresult.isEmpty() )
	        {
	            DeferredResult<String> result = gameresult.remove();
	            result.setResult( json );
	        }*/
	        for(DeferredResult<String> result: gameresult)
	        {
	        	result.setResult(json);
	        }
	        gameresult.clear();
}
	 private void processDeferredPosResults()
	    {
	        // convert username list to json
	        String json = "";
	        try
	        {
	            StringWriter sw = new StringWriter();
	            objectMapper.writeValue( sw, game_positions );
	            json = sw.toString();
	        }
	        catch( Exception e )
	        {
	            
	        }

	        // process queued results
	        while( !posresult.isEmpty() )
	        {
	            DeferredResult<String> result = posresult.remove();
	            result.setResult( json );
	        }
	        posresult.clear();
}
}
