package ttt.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;


@Entity
@Table(name = "games")
public class Games implements Serializable{

	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Games()
	{
		
	}
	
	    @Id
	    @GeneratedValue
	    private Integer id;
	  
	    private int duration;
	
         
		 public int getDuration() {
			return duration;
		}
		public void setDuration(int duration) {
			this.duration = duration;
		}

		private Date saved_at;
		 
		 
		 @ManyToOne
			private Users player1;
			
			@ManyToOne
			private Users player2;
			private Date start_time;
		    private Date end_time;
		    
		    @ManyToOne
		    @JoinColumn(name="winner")
		    private Users winner;
		   
		    @ManyToOne
		    @JoinColumn(name="looser")
		    private Users looser;
		    
		    public Date getSaved_at() {
				return saved_at;
			}
		    
		    @ElementCollection
		    
           private List<String> player1_pos;
		    
		    
		    @ElementCollection
           private List<String> player2_pos;


			public List<String> getPos() {
				return player1_pos;
			}
			public void setPos(List<String> player1_pos) {
				this.player1_pos = player1_pos;
			}
			public List<String> getPlayer2_pos() {
				return player2_pos;
			}
			public void setPlayer2_pos(List<String> player2_pos) {
				this.player2_pos = player2_pos;
			}
			public void setSaved_at(Date saved_at) {
				this.saved_at = saved_at;
			}
		public Users getPlayer1() {
				return player1;
			}
			public void setPlayer1(Users player1) {
				this.player1 = player1;
			}
			public Users getPlayer2() {
				return player2;
			}
			public void setPlayer2(Users player2) {
				this.player2 = player2;
			}

		
	    
	    public Users getWinner() {
			return winner;
		}
		public void setWinner(Users winner) {
			this.winner = winner;
		}
		public Users getLooser() {
			return looser;
		}
		public void setLooser(Users looser) {
			this.looser = looser;
		}
		private boolean tie=false;
		public boolean isTie() {
			return tie;
		}
		public void setTie(boolean tie) {
			this.tie = tie;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
	
		public Date getStart_time() {
			return start_time;
		}
		public void setStart_time(Date start_time) {
			this.start_time = start_time;
		}
		public Date getEnd_time() {
			return end_time;
		}
		public void setEnd_time(Date end_time) {
			this.end_time = end_time;
		}
		
		
	    
}
