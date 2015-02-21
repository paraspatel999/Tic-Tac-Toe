
    create table Games_player1_pos (
        Games_id int4 not null,
        player1_pos varchar(255)
    );

    create table Games_player2_pos (
        Games_id int4 not null,
        player2_pos varchar(255)
    );

    create table games (
        id int4 not null,
        duration int4 not null,
        end_time timestamp,
        saved_at timestamp,
        start_time timestamp,
        tie boolean not null,
        looser int4,
        player1_id int4,
        player2_id int4,
        winner int4,
        primary key (id)
    );

    create table played_games (
        users_id int4 not null,
        played_games_id int4 not null
    );

    create table saved_games (
        users_id int4 not null,
        saved_games_id int4 not null
    );

    create table users (
        id int4 not null,
        email_id varchar(255) not null,
        password varchar(255) not null,
        username varchar(255) not null,
        primary key (id)
    );

    alter table played_games 
        add constraint UK_omewfo2j2qtbgq0f8906pf494 unique (played_games_id);

    alter table saved_games 
        add constraint UK_31ksuan1bl98jxhyhu2us43km unique (saved_games_id);

    alter table Games_player1_pos 
        add constraint FK_1qlf6usd2py0sp3otltvdmqxa 
        foreign key (Games_id) 
        references games;

    alter table Games_player2_pos 
        add constraint FK_pc5mnnc68afgwmfhsoqckx1q6 
        foreign key (Games_id) 
        references games;

    alter table games 
        add constraint FK_4xbonytt63gdyxo1pdlvgu37g 
        foreign key (looser) 
        references users;

    alter table games 
        add constraint FK_gf5dddpb3pb14c1057sbdgn43 
        foreign key (player1_id) 
        references users;

    alter table games 
        add constraint FK_bv9atljedlpewpf76urp88mqv 
        foreign key (player2_id) 
        references users;

    alter table games 
        add constraint FK_mjgvpashe8sdwhvk3r7vykft1 
        foreign key (winner) 
        references users;

    alter table played_games 
        add constraint FK_omewfo2j2qtbgq0f8906pf494 
        foreign key (played_games_id) 
        references games;

    alter table played_games 
        add constraint FK_ctomja1l4e5tnasfcs0807pnn 
        foreign key (users_id) 
        references users;

    alter table saved_games 
        add constraint FK_31ksuan1bl98jxhyhu2us43km 
        foreign key (saved_games_id) 
        references games;

    alter table saved_games 
        add constraint FK_3yy5712o95kas4bysxugfpr7a 
        foreign key (users_id) 
        references users;

    create sequence hibernate_sequence;
