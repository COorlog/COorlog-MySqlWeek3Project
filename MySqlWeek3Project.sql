show databases;

drop database social_media;
create database if not exists social_media;
use social_media;


create table if not exists user_profile(
user_id varchar(20) not null,
email_address varchar(30) not null,
pw varchar(30) not null,
primary key (user_id)
);

create table if not exists posts( 
post_id int not null auto_increment,
content varchar(250) not null,
date_created datetime default current_timestamp,
user_id varchar(20) not null, 
primary key (post_id),
foreign key (user_id) references user_profile (user_id)
);

create table if not exists comments( 
comment_id int not null auto_increment,
post_id int not null,
user_id varchar(20) not null,
content varchar(250) not null,
date_created datetime default current_timestamp,
primary key (comment_id),
foreign key (user_id) references user_profile (user_id),
foreign key (post_id) references posts(post_id)
);

insert into user_profile (user_id,email_address,pw) values ('Corg505','joe.shmoe@yahoo.com','password1');
insert into posts (content,user_id) values ('Is hot outside','Corg505');
insert into comments(post_id,user_id,content) values ('1','Corg505','I agree!');

use social_media;
select * from posts, comments;

