create database EX;
use ex;

create table data(
	id int primary key auto_increment,
    category varchar(50),
    item varchar(30),
	amount int 
);

insert  into data (category,item,amount)values
('fruit' , 'apple' ,100),
('fruit' , 'orange' ,150),
('vegetable' ,'carrot' ,50),
('fruit' , 'banana' ,120),
('vegetable' , 'lettuce' ,80),
('fruit' , 'apple' ,200),
('meat' , 'beef' ,300),
('meat' , 'pork' ,250);

select 
	category,
    count(category) as count,
    sum(amount) as sum_amount
from data
group by category
order by sum_amount desc;
