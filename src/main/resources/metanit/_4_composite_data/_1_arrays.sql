create table posts(
                      id serial primary key,
                      title varchar(30),
                      body text,
                      tags varchar(10)[]
);

insert into posts(title, body, tags)
values('Post Title', 'Post Text', '{"sql", "postgres", "database", "plsql"}');

/*Однако с помощью индексов мы также можем конкретизировать, какие именно элементы массива мы хотим получить:*/
select tags[0:3] from posts;