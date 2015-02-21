



create sequence hibernate_sequence minvalue 100;
 create table users (
        id integer primary key not null,
        username varchar(255) unique  not null,
        password varchar(255) not null,
        email_id varchar(255) not null
       
    );
    
    create table games (
        id integer primary key not null,
       saved_at timestamp,
         start_time timestamp,
        end_time timestamp,
        tie boolean not null,
        looser integer references users(id),
       player1_id integer references users(id),
       player2_id integer references users(id),
        winner integer references users(id),
        duration integer
        
    );
    
     create table played_games (
       users_id integer references users(id),
        played_games_id integer references games(id)
    );
     
    
    
       
   
 create table saved_games (
        users_id integer references users(id),
        saved_games_id integer references games(id)
    );
     create table Games_player1_pos (
        Games_id integer references games(id),
        player1_pos varchar(255)
    );

    create table Games_player2_pos (
        Games_id integer references games(id),
        player2_pos varchar(255)
    );
    
     create table authorities (
    username   varchar(255)  not null references users(username),
    authority   varchar(255) default 'ROLE_USER'
	);
    insert into users values(1,'cysun','abcd','cysun@localhost.localdomain');
    
    insert into users values(2,'paras','paras','ppatel@gmail.com');
    
    insert into games values(1,null,'2014-05-02 04:05:30.536','2014-05-02 04:25:26.536',false,null,1,null,1,45689);
    insert into games values(2,null,'2014-05-03 09:55:30.356','2014-05-03 10:15:35.800',false,1,1,null,null,78963);
     insert into games values(3,'2014-05-04 04:05:30.536','2014-05-04 04:05:30.258',null,false,null,1,null,null,6598);
     insert into games values(4,null,'2014-05-15 04:05:30.258','2014-05-15 04:05:30.258',false,2,1,2,1,25689);
    
    
    insert into played_games values(1,1);
    insert into played_games values(1,2);
    insert into played_games values(1,4);
    insert into played_games values(2,4);
    
    insert into saved_games values(1,3);
    
    insert into Games_player1_pos values(3,'00');
    insert into Games_player2_pos values(3,'11');
     insert into authorities values('cysun','ROLE_USER');
     insert into authorities values('paras','ROLE_USER');
   
    
   
    
    CREATE FUNCTION insertRole() returns trigger as $testref$
    BEGIN
    IF (TG_OP='INSERT') THEN
      INSERT INTO authorities (username) values (NEW.username);
      return NEW;
    END IF;
    END;
    $testref$ LANGUAGE plpgsql;
    CREATE TRIGGER testref AFTER INSERT ON users
  	FOR EACH ROW 
  	EXECUTE PROCEDURE insertRole();

    select * from authorities