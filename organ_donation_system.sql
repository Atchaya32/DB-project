create database organ_donation_management_system;
-- Donor Table
create table Donor(
    donor_id int Primary key auto_increment,
    name varchar(50) not null,
    age int check(age > 18),
    gender varchar(10) check(gender in('Male','Female','Other')),
    blood_group varchar(5) check(blood_group in('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    contact_info char(10) not null);

-- Organ Table
create table Organ(
    organ_id int primary key auto_increment,
    organ_type varchar(50) not null,
    donor_id int,foreign key(donor_id) references Donor(donor_id) on delete cascade,
    availability_status varchar(20)
);

-- Recipient Table
create table Recipient(
    recipient_id int primary key auto_increment,
    name varchar(50) not null,
    age int check(age>18),
    gender varchar(10) check(gender in('Male','Female','Other')),
    blood_group varchar(5) check(blood_group IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    required_organ varchar(50) not null,
    contact_number varchar(50) not null unique
);

-- Hospital Table
create table Hospital(
    hospital_id int primary key auto_increment,
    hospital_name varchar(100) not null,
    location varchar(50) not null,
    contact_number char(10) not null unique
);

-- Coordinator Table
create table Coordinator(
    coordinator_id int primary key auto_increment,
    name varchar(50) not null,
    email varchar(70)not null unique,
    phone_number char(10) not null unique,
    hospital_id int,
    foreign key(hospital_id) references Hospital(hospital_id) on delete set null
);

-- Transplant Table
create table Transplant(
    transplant_id int primary key auto_increment,
    organ_id int,
    donor_id int,																																													
    recipient_id int,
    hospital_id int,
    transplant_date date not null,
    status varchar(50),
    foreign key(organ_id) references Organ(organ_id) on delete set null,
    foreign key(donor_id) references Donor(donor_id) ON DELETE set null,
    foreign key(recipient_id) references Recipient(recipient_id) on delete set NULL,
    foreign key(hospital_id) references Hospital(hospital_id) on delete set null);
    
-- donar table records
insert into donor values(1,'arjun',25,'male','A+','9876543210');
insert into donor values(2,'priya',30,'female','B+','9876543211');
insert into donor values(3,'rahul',45,'male','O-','9876543212');
insert into donor values(4,'anita',28,'female','AB+','9876543213');
insert into donor values(5,'ravi',35,'male','A-','9876543214');
insert into donor values(6,'sneha',29,'female','O+','9876543215');
insert into donor values(7,'vikas',40,'male','B-','9876543216');
insert into donor values(8,'neha',32,'female','A+','9876543217');
insert into donor values(9,'sachin',50,'male','AB-','9876543218');
insert into donor values(10,'kavya',26,'female','O+','9876543219');
insert into donor values(11,'manoj',36,'male','B+','9876543220');
insert into donor values(12,'pallavi',27,'female','A-','9876543221');
insert into donor values(13,'amit',41,'male','O-','9876543222');
insert into donor values(14,'isha',29,'female','A+','9876543223');
insert into donor values(15,'deepak',31,'male','AB+','9876543224');
insert into donor values(16,'pooja',34,'female','B-','9876543225');
insert into donor values(17,'tarun',38,'male','O+','9876543226');
insert into donor values(18,'divya',26,'female','A-','9876543227');
insert into donor values(19,'harsh',43,'male','AB-','9876543228');
insert into donor values(20,'rani',30,'female','B+','9876543229');
insert into donor values(21,'naveen',35,'male','A+','9876543230');
insert into donor values(22,'meena',28,'female','O-','9876543231');
insert into donor values(23,'vijay',44,'male','A-','9876543232');
insert into donor values(24,'sonal',31,'female','B-','9876543233');
insert into donor values(25,'abhishek',48,'male','AB+','9876543234');
insert into donor values(26,'rupa',29,'female','O+','9876543235');
insert into donor values(27,'arvind',42,'male','B-','9876543236');
insert into donor values(28,'kiran',27,'female','A+','9876543237');
insert into donor values(29,'suresh',39,'male','O-','9876543238');
insert into donor values(30,'lakshmi',33,'female','AB-','9876543239');
select * from donor;

-- organ table records
insert into organ values(1,'kidney',1,'available');
insert into organ values(2,'heart',2,'unavailable');
insert into organ values(3,'liver',3,'available');
insert into organ values(4,'lungs',4,'available');
insert into organ values(5,'pancreas',5,'unavailable');
insert into organ values(6,'intestine',6,'available');
insert into organ values(7,'kidney',7,'available');
insert into organ values(8,'heart',8,'unavailable');
insert into organ values(9,'liver',9,'available');
insert into organ values(10,'lungs',10,'available');
insert into organ values(11,'pancreas',11,'available');
insert into organ values(12,'intestine',12,'available');
insert into organ values(13,'kidney',13,'available');
insert into organ values(14,'heart',14,'available');
insert into organ values(15,'liver',15,'available');
insert into organ values(16,'lungs',16,'available');
insert into organ values(17,'pancreas',17,'available');
insert into organ values(18,'intestine',18,'available');
insert into organ values(19,'kidney',19,'available');
insert into organ values(20,'heart',20,'available');
insert into organ values(21,'liver',21,'available');
insert into organ values(22,'lungs',22,'available');
insert into organ values(23,'pancreas',23,'available');
insert into organ values(24,'intestine',24,'available');
insert into organ values(25,'kidney',25,'available');
insert into organ values(26,'heart',26,'available');
insert into organ values(27,'liver',1,'unavailable');
insert into organ values(28,'lungs',2,'available');
insert into organ values(29,'pancreas',3,'unavailable');
insert into organ values(30,'intestine',4,'available');
select * from organ;

-- recipient tablr records
insert into recipient values(1,'ram',40,'male','A+','kidney','9876511110');
insert into recipient values(2,'seema',35,'female','B+','heart','9876511111');
insert into recipient values(3,'ashok',50,'male','O-','liver','9876511112');
insert into recipient values(4,'rekha',32,'female','AB+','lungs','9876511113');
insert into recipient values(5,'anil',45,'male','A-','pancreas','9876511114');
insert into recipient values(6,'suman',29,'female','O+','intestine','9876511115');
insert into recipient values(7,'sunil',41,'male','B-','kidney','9876511116');
insert into recipient values(8,'neeta',30,'female','A+','heart','9876511117');
insert into recipient values(9,'gopal',52,'male','AB-','liver','9876511118');
insert into recipient values(10,'kiran',28,'female','O+','lungs','9876511119');
insert into recipient values(11,'arun',39,'male','B+','pancreas','9876511120');
insert into recipient values(12,'meera',31,'female','A-','intestine','9876511121');
insert into recipient values(13,'manish',44,'male','O-','kidney','9876511122');
insert into recipient values(14,'sana',30,'female','A+','heart','9876511123');
insert into recipient values(15,'vikram',48,'male','AB+','liver','9876511124');
insert into recipient values(16,'tina',34,'female','B-','lungs','9876511125');
insert into recipient values(17,'varun',38,'male','O+','pancreas','9876511126');
insert into recipient values(18,'riya',27,'female','A-','intestine','9876511127');
insert into recipient values(19,'mahesh',49,'male','AB-','kidney','9876511128');
insert into recipient values(20,'anaya',33,'female','B+','heart','9876511129');
insert into recipient values(21,'siddharth',37,'male','A+','liver','9876511130');
insert into recipient values(22,'pinky',29,'female','O-','lungs','9876511131');
insert into recipient values(23,'yash',46,'male','A-','pancreas','9876511132');
insert into recipient values(24,'shruti',31,'female','B-','intestine','9876511133');
insert into recipient values(25,'karan',50,'male','AB+','kidney','9876511134');
insert into recipient values(26,'neelam',28,'female','O+','heart','9876511135');
insert into recipient values(27,'dev',43,'male','B-','liver','9876511136');
insert into recipient values(28,'khushi',30,'female','A+','lungs','9876511137');
insert into recipient values(29,'rohit',39,'male','O-','pancreas','9876511138');
insert into recipient values(30,'jaya',32,'female','AB-','intestine','9876511139');

-- hospital table records
insert into Hospital values(1,'Apollo Hospital','Chennai','9000011111');
insert into Hospital values(2,'Fortis Hospital','Delhi','9000011112');
insert into Hospital values(3,'AIIMS','Delhi','9000011113');
insert into Hospital values(4,'Manipal Hospital','Bangalore','9000011114');
insert into Hospital values(5,'CMC Hospital','Vellore','9000011115');
insert into Hospital values(6,'Max Hospital','Mumbai','9000011116');
insert into Hospital values(7,'Global Hospital','Hyderabad','9000011117');
insert into Hospital values(8,'Care Hospital','Pune','9000011118');
insert into Hospital values(9,'Sunshine Hospital','Nagpur','9000011119');
insert into Hospital values(10,'KIMS Hospital','Kochi','9000011120');
insert into Hospital values(11,'Ruby Hall Clinic','Pune','9000011121');
insert into Hospital values(12,'Sankara Nethralaya','Chennai','9000011122');
insert into Hospital values(13,'Narayana Health','Bangalore','9000011123');
insert into Hospital values(14,'Lilavati Hospital','Mumbai','9000011124');
insert into Hospital values(15,'Jaslok Hospital','Mumbai','9000011125');
insert into Hospital values(16,'AMRI Hospital','Kolkata','9000011126');
insert into Hospital values(17,'Yashoda Hospital','Hyderabad','9000011127');
insert into Hospital values(18,'Medanta Hospital','Gurgaon','9000011128');
insert into Hospital values(19,'Columbia Asia','Bangalore','9000011129');
insert into Hospital values(20,'Metro Hospital','Noida','9000011130');
insert into Hospital values(21,'Kokilaben Hospital','Mumbai','9000011131');
insert into Hospital values(22,'Sterling Hospital','Ahmedabad','9000011132');
insert into Hospital values(23,'Nanavati Hospital','Mumbai','9000011133');
insert into Hospital values(24,'Seven Hills Hospital','Mumbai','9000011134');
insert into Hospital values(25,'Saifee Hospital','Mumbai','9000011135');
insert into Hospital values(26,'Wockhardt Hospital','Nashik','9000011136');
insert into Hospital values(27,'Breach Candy Hospital','Mumbai','9000011137');
insert into Hospital values(28,'Holy Family Hospital','Mumbai','9000011138');
insert into Hospital values(29,'Hinduja Hospital','Mumbai','9000011139');
insert into Hospital values(30,'SRM Hospital','Chennai','9000011140');
 
-- coordinator table records
insert into Coordinator values(1,'Anjali','anjali@apollo.in','9001110001',1);
insert into Coordinator values(2,'Ravi','ravi@fortis.in','9001110002',2);
insert into Coordinator values(3,'Sneha','sneha@aiims.in','9001110003',3);
insert into Coordinator values(4,'Arjun','arjun@manipal.in','9001110004',4);
insert into Coordinator values(5,'Lakshmi','lakshmi@cmc.in','9001110005',5);
insert into Coordinator values(6,'Vikram','vikram@max.in','9001110006',6);
insert into Coordinator values(7,'Divya','divya@global.in','9001110007',7);
insert into Coordinator values(8,'Nikhil','nikhil@care.in','9001110008',8);
insert into Coordinator values(9,'Pooja','pooja@sunshine.in','9001110009',9);
insert into Coordinator values(10,'Manoj','manoj@kims.in','9001110010',10);
insert into Coordinator values(11,'Rekha','rekha@rubyhall.in','9001110011',11);
insert into Coordinator values(12,'Sundar','sundar@sankara.in','9001110012',12);
insert into Coordinator values(13,'Harsha','harsha@narayana.in','9001110013',13);
insert into Coordinator values(14,'Priya','priya@lilavati.in','9001110014',14);
insert into Coordinator values(15,'Rohan','rohan@jaslok.in','9001110015',15);
insert into Coordinator values(16,'Tanushree','tanushree@amri.in','9001110016',16);
insert into Coordinator values(17,'Kiran','kiran@yashoda.in','9001110017',17);
insert into Coordinator values(18,'Amit','amit@medanta.in','9001110018',18);
insert into Coordinator values(19,'Krishna','krishna@columbia.in','9001110019',19);
insert into Coordinator values(20,'Sakshi','sakshi@metro.in','9001110020',20);
insert into Coordinator values(21,'Rakesh','rakesh@kokilaben.in','9001110021',21);
insert into Coordinator values(22,'Neha','neha@sterling.in','9001110022',22);
insert into Coordinator values(23,'Rajat','rajat@nanavati.in','9001110023',23);
insert into Coordinator values(24,'Maria','maria@sevenhills.in','9001110024',24);
insert into Coordinator values(25,'Isha','isha@saifee.in','9001110025',25);
insert into Coordinator values(26,'Ankit','ankit@wockhardt.in','9001110026',26);
insert into Coordinator values(27,'Simran','simran@breach.in','9001110027',27);
insert into Coordinator values(28,'Rahul','rahul@holyfamily.in','9001110028',28);
insert into Coordinator values(29,'Meena','meena@hinduja.in','9001110029',29);
insert into Coordinator values(30,'Vidhya','vidhya@srm.in','9001110030',30);

-- Transplant table records
insert into Transplant values(1, 12, 5, 27, 14, '2024-01-05', 'Completed');
insert into Transplant values(2, 25, 11, 6, 20, '2024-01-10', 'Scheduled');
insert into Transplant values(3, 3, 7, 15, 10, '2024-01-15', 'Completed');
insert into Transplant values(4, 18, 16, 4, 8, '2024-01-20', 'Completed');
insert into Transplant values(5, 7, 19, 13, 25, '2024-01-25', 'Cancelled');
insert into Transplant values(6, 9, 8, 24, 6, '2024-02-01', 'Completed');
insert into Transplant values(7, 30, 3, 22, 17, '2024-02-05', 'Completed');
insert into Transplant values(8, 16, 2, 7, 5, '2024-02-10', 'Scheduled');
insert into Transplant values(9, 1, 24, 9, 13, '2024-02-15', 'Completed');
insert into Transplant values(10, 21, 30, 2, 27, '2024-02-20', 'Completed');
insert into Transplant values(11, 5, 10, 17, 9, '2024-02-25', 'Pending');
insert into Transplant values(12, 2, 23, 20, 11, '2024-03-01', 'Completed');
insert into Transplant values(13, 11, 6, 3, 29, '2024-03-05', 'Completed');
insert into Transplant values(14, 26, 12, 26, 16, '2024-03-10', 'Scheduled');
insert into Transplant values(15, 13, 20, 25, 21, '2024-03-15', 'Completed');
insert into Transplant values(16, 23, 14, 12, 28, '2024-03-20', 'Completed');
insert into Transplant values(17, 28, 22, 19, 2, '2024-03-25', 'Scheduled');
insert into Transplant values(18, 8, 27, 18, 1, '2024-03-30', 'Completed');
insert into Transplant values(19, 19, 1, 21, 26, '2024-04-04', 'Completed');
insert into Transplant values(20, 17, 4, 28, 7, '2024-04-08', 'Completed');
insert into Transplant values(21, 15, 26, 14, 23, '2024-04-12', 'Pending');
insert into Transplant values(22, 14, 28, 8, 24, '2024-04-16', 'Completed');
insert into Transplant values(23, 6, 25, 23, 30, '2024-04-20', 'Completed');
insert into Transplant values(24, 24, 9, 5, 18, '2024-04-25', 'Completed');
insert into Transplant values(25, 4, 17, 1, 3, '2024-04-30', 'Cancelled');
insert into Transplant values(26, 27, 15, 30, 12, '2024-05-04', 'Completed');
insert into Transplant values(27, 20, 13, 10, 19, '2024-05-08', 'Scheduled');
insert into Transplant values(28, 22, 29, 11, 22, '2024-05-12', 'Completed');
insert into Transplant values(29, 10, 18, 16, 4, '2024-05-16', 'Completed');
insert into Transplant values(30, 29, 21, 29, 15, '2024-05-20', 'Pending');

-- retrive all the table data
select * from donor;
select * from organ;
select * from recipient;
select * from hospital;
select * from coordinator;
select * from transplant;

-- view
 -- Show all currently available organs along with the donor’s name and blood group.
 create view available_organs_view as
select 
    o.organ_id,
    o.organ_type,
    d.name as donor_name,
    d.blood_group,
    o.availability_status
from organ o
join donor d on o.donor_id = d.donor_id
where o.availability_status = 'available';
select * from available_organs_view;

-- Display a summary of all transplants with recipient name, organ type, transplant date, and hospital name.
create view transplant_summary_view as
select 
    t.transplant_id,
    r.name as recipient_name,
    o.organ_type,
    t.transplant_date,
    h.hospital_name,
    t.status
from transplant t
join recipient r on t.recipient_id = r.recipient_id
join organ o on t.organ_id = o.organ_id
join hospital h on t.hospital_id = h.hospital_id;
select * from transplant_summary_view;



-- how can you add a new donor to the database
delimiter //
create procedure add_new_donor(
    in d_name varchar(50),
    in d_age int,
    in d_gender varchar(10),
    in d_blood_group varchar(5),
    in d_contact_info char(10))
begin
    insert into donor(name,age,gender,blood_group,contact_info)
    values(d_name,d_age,d_gender,d_blood_group,d_contact_info);
end //
delimiter ;
call add_new_donor("ragul",30,"male",'O+',8654328765);

-- how can you update the availability status of an organ in the system
delimiter //
create procedure update_organ_status(
    in o_organ_id int,
    in o_new_availability_status varchar(20))
begin
    update organ
    set availability_status = o_new_availability_status
    where organ_id = o_organ_id;
end //
delimiter ;
call update_organ_status(20,'available');

-- if a transplant is cancelled, how can you update the status of the transplant to 'cancelled'?
delimiter //
create procedure cancel_transplant(
    in t_transplant_id int)
begin
    update transplant
    set status = 'Cancelled'
    where transplant_id = t_transplant_id;
end //
delimiter ;

-- how can you retrieve all donors who have a specific blood group
delimiter //
create procedure get_donors_by_bloodgroup(
    in d_blood_group varchar(5))
begin
    select donor_id,name,age,gender,contact_info
    from donor
    where blood_group = d_blood_group;
end //
delimiter ;

-- how can you check if a specific type of organ
delimiter //
create procedure check_organ_availability(
    in o_organ_type varchar(50))
begin
    select organ_id,donor_id,availability_status
    from organ
    where organ_type = o_organ_type and availability_status = 'Available';
end //
delimiter ;

-- How can you list all available organs of a particular type
delimiter //
create procedure list_available_organs(
    in o_organ_type varchar(50))
begin
    select organ_id,donor_id,availability_status
    from organ
    where organ_type=o_organ_type and availability_status ='available';
end //
delimiter ;

-- How can you get all transplant records that took place in a specific hospital
delimiter //
create procedure get_hospital_transplants(
    in n_hospital_name varchar(50))
begin
    select t.transplant_id, t.transplant_date, r.name as recipient_name, o.organ_type
    from transplant t
    join hospital h on t.hospital_id = h.hospital_id
    join recipient r on t.recipient_id = r.recipient_id
    join organ o on t.organ_id = o.organ_id
    where h.hospital_name = n_hospital_name;
end //
delimiter ;

-- How can you retrieve all transplant records that occurred between two given dates
delimiter //
create procedure get_transplants_by_date_range(
    in d_start_date date,
    in d_end_date date
)
begin
    select * from transplant
    where transplant_date between d_start_date and d_end_date;
end //
delimiter ;

-- How can you delete all cancelled transplants older than 1 year
delimiter //
create procedure delete_old_cancelled_transplants()
begin
    delete from transplant
    where status='cancelled'
    and transplant_date<curdate() - interval 1 year;
end //
delimiter ;

-- How can you retrieve the last 5 transplants performed
delimiter //
create procedure get_recent_transplants()
begin
    select *
    from transplant
    order by transplant_date desc
    limit 5;
end //
delimiter ;















