package ttt.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Columns;
@Entity
@Table(name = "users")
public class Users implements Serializable {

	
	    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		@Id
	    @GeneratedValue
	    private Integer id;
       
	
		 @Column (nullable=false,unique=true)
	    private String username;
	
	
		@Column (nullable=false)
		private String password;
		 @Column (nullable=false)
	    private String email_id;
        
		
		 @OneToMany(cascade={CascadeType.ALL})
		 @JoinTable(name="played_games")
		 private List<Games> played_games;
		 
		 
		 @OneToMany(cascade={CascadeType.ALL})
		 @JoinTable(name="saved_games")
		 private List<Games> saved_games;
		 
		 
		 
	    public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public List<Games> getPlayed_games() {
			return played_games;
		}
		public void setPlayed_games(List<Games> played_games) {
			this.played_games = played_games;
		}
		public List<Games> getSaved_games() {
			return saved_games;
		}
		public void setSaved_games(List<Games> saved_games) {
			this.saved_games = saved_games;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
	
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getEmail_id() {
			return email_id;
		}
		public void setEmail_id(String email_id) {
			this.email_id = email_id;
		}
	
	
}
