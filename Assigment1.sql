Create Database KeepNote

use KeepNote

create table Users
(
user_id int primary key,
user_name varchar(20),
user_added_date varchar(10),
user_password varchar(20),
user_mobile varchar(10)
)

create table Note
(
note_id int primary key,
note_title varchar(20),
note_content varchar(50),
note_status varchar(20),
notes_creation_date varchar(10),
user_id int references Users(user_id)
)

create table Category
(
category_id int primary key,
category_name varchar(20),
category_descr varchar(30),
category_creation_date varchar(10),
category_creator int references Users(user_id)
)

create table Reminder
(
reminder_id int primary key,
reminder_name varchar(20),
reminder_descr varchar(30),
reminder_type varchar(20),
reminder_creation_date varchar(10),
reminder_creator int references Users(user_id)
)

create table NoteCategory
(
notecategory_id int primary key,
note_id int references Note(note_id),
category_id int references Category(category_id)
)

create table NoteReminder
(
notereminder_id int primary key,
note_id int references Note(note_id),
reminder_id int references Reminder(reminder_id)
)

Insert into Users values (112233,'Maya','2019-01-02','Maya1214','8012345679'),(112244,'Nair','2019-01-11','Welcome','9023778467')
Insert into Note values (1,'Today Tasks','1.Check emails and reply to them 2.Start the pro..','InProgess','2019-01-21',112233),(2,'Training to plan','1.Application related 2.Technical Related','YetToStart','2019-01-31',112244),(3,'Things to have today','1.Fruits 2.More water','InProgess','2019-01-25',112244)
Insert into Category values (1, 'Official', 'Office related notes','2019-01-21',112233), (2, 'Diet', 'Health Related notes','2019-01-24',112244)
Insert into Reminder values (1,'KT reminder','Session on technical queries','Office Reminder','2019-02-12',112233),(2,'Personal Reminder','Pick Children','Personal Reminders','2019-02-14',112244)
Insert into NoteCategory values (1,1,1),(2,2,1),(3,3,2)
Insert into NoteReminder values (1,3,2),(2,2,1)

select * from Users
select * from Note
select * from Category
select * from Reminder
select * from NoteCategory
select * from NoteReminder

--Write the queries to carry out the below listed operations:

-- 1. Fetch the row from User table with Id=112233 and Password=’Maya1214’.

select * from Users where user_id = 112233 and user_password = 'Maya1214'

--2. Fetch all the rows from Note table with note_creation_date=’01/31/2019’.

select * from Note where notes_creation_date = '2019-01-31'

--3. Fetch all the Categories created after ‘01/22/2019’.

Select * from Category where category_creation_date>'2019-01-22'

--4. Fetch all category details which belongs to note with note id=1.

select * from Category where category_creator = (select user_id from Note where note_id = 1)

--5. Fetch all the Notes from the Note table with userId=112244.

select * from Note where user_id = 112244

--6. Fetch all the Notes from the Note table for category_id=1.

select * from Note where user_id = (select category_creator from Category where category_id =1)

--7. Fetch all the reminder details for note id=2.

select * from Reminder where reminder_creator = (select user_id from Note where note_id = 2)

--8. Write a query to change the note_status to ‘Completed’ with note Id=3.

Update Note set note_status='Completed' where note_id=3

--9. Write a query to set a reminder of type ‘Personal Reminders’ for Note with note id=1. [Find reminder id based upon reminder_type]

Update Reminder set reminder_type = 'Personal Reminders' where reminder_creator = (select user_id from Note where note_id = 1)

--10. Write a query to remove all reminders from Note with note_id=2.

select * from Note
select * from Reminder
delete from Reminder where reminder_creator = (select user_id from Note where note_id = 2)

