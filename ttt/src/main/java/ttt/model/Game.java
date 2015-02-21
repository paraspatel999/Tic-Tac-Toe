package ttt.model;

import java.util.ArrayList;
import java.util.List;

public class Game {

	
	String host;
	String join;
	List<String> host_position;
	List<String> join_position;
	String result;
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Game()
	{
		host_position=new ArrayList<String>();
		join_position=new ArrayList<String>();
		
	}
	public List<String> getJoin_position() {
		return join_position;
	}
	public void setJoin_position(List<String> join_position) {
		this.join_position = join_position;
	}
	boolean turn;
	public String getHost() {
		return host;
	}
	public String getJoin() {
		return join;
	}
	public void setJoin(String join) {
		this.join = join;
	}
	public void setHost(String user) {
		this.host = user;
	}
	public List<String> getHost_Position() {
		return host_position;
	}
	public void setHost_Position(List<String> position) {
		this.host_position = position;
	}
	public boolean isTurn() {
		return turn;
	}
	public void setTurn(boolean turn) {
		this.turn = turn;
	}
}
