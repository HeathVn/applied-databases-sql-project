
CALL register_patient("Lamar Garza","1974-01-07","female","Business analyst","White","Single","908-4292 Ut Rd.",9856,"Prudential");
CALL register_patient("Quon Evans","1966-12-24","female","Artist","White","Single","128-8040 Ante Street",2721,"State Farm");
CALL register_patient("Ishmael Whitfield","1983-07-21","male","Entrepreneur","German","Married","7858 Tellus Road",9827,"Nationwide");
CALL register_patient("Rhiannon Mcintyre","1964-11-27","male","Computer Scientists","German","Single","Ap #907-8227 Enim. Avenue",5794,"MetLife");
CALL register_patient("Kerry Holmes","1950-08-12","male","Computer Scientists","Black/African-American","Single","Ap #421-1372 Parturient Street",7094,"MetLife");
CALL register_patient("Xavier Vincent","1998-07-19","female","Computer Scientists","Mexican","Single","Ap #324-8870 Vestibulum, Avenue",2676,"MetLife");
CALL register_patient("Tanner Yates","1987-02-03","female","Entrepreneur","German","Married","590-724 Libero Street",NULL,NULL);
CALL register_patient("Bevis Mitchell","1963-05-26","female","Computer Scientists","White","Single","P.O. Box 940, 9177 Integer St.",9553,"Prudential");
CALL register_patient("Henry Weeks","2000-11-17","female","Entrepreneur","Native American","Married","P.O. Box 871, 7617 Justo St.",7387,"State Farm");
CALL register_patient("Ivy Raymond","1996-01-05","female","Marketer","German","Married","835 Sapien, Rd.",NULL, NULL);
CALL register_patient("Rinah Gutierrez","1974-03-06","female","Marketer","Mexican","Single","4206 Sapien Rd.",NULL,NULL);
CALL register_patient("Yuli Dorsey","1978-11-17","female","Artist","German","Single","535-8983 Nulla Street",8962,"Prudential");
CALL register_patient("Clark Bolton","2005-05-28","male","Computer Scientists","White","Single","1830 Nunc St.",2739,"MetLife");
CALL register_patient("Deacon Good","2003-06-16","female","Computer Scientists","German","Married","Ap #185-5273 Donec Rd.",9722,"State Farm");
CALL register_patient("Kylynn Griffin","1990-04-24","male","Marketer","German","Single","990-6303 Mi Street",3377,"MetLife");
  
INSERT INTO specialty_assignments(specialty,facility)
VALUES ('Physical Therapist', 'Ambulance'),
       ('Surgical Tech', 'Ambulance'),
       ('Nurse', 'Ambulance'),
       ('Medical Administration Staff', 'Ambulance'),
       ('Medical Administration Staff', 'Ambulance'),
       ('Internal Medicine', 'ICU'),
       ('Pain Medicine', 'ICU'),
       ('Nurse', 'ICU');
       
       
CALL hire_employee("Summer Frye","(484) 859-3466",1,"Saturday");
CALL hire_employee("Howard Mckay","(391) 554-1487",3,"Monday");
CALL hire_employee("Mercedes Wilson","(327) 442-4849",2,"Thursday");
CALL hire_employee("Kadeem Schwartz","(248) 593-2014",3,"Tuesday");
CALL hire_employee("Darryl Hewitt","(511) 377-8395",4,"Friday");
CALL hire_employee("Colby Morton","(361) 613-8246",4,"Tuesday");
CALL hire_employee("Rhiannon Sparks","(824) 433-5758",7,"Tuesday");
CALL hire_employee("Kane Baird","(756) 321-1462",6,"Sunday");
CALL hire_employee("Dominic Mcleod","(733) 582-8762",2,"Thursday");
CALL hire_employee("Michelle Frederick","(604) 731-3744",4,"Thursday");
CALL hire_employee("Gil Hardin","(662) 401-8524",4,"Saturday");
CALL hire_employee("Austin Noel","(545) 811-3364",1,"Tuesday");
CALL hire_employee("Samuel Velazquez","(559) 338-0267",1,"Thursday");
CALL hire_employee("Briar Rich","(343) 495-4882",5,"Saturday");
CALL hire_employee("Rebekah Long","(764) 597-2498",3,"Saturday");
CALL hire_employee("Briar Mendoza","(733) 463-6452",2,"Sunday");
CALL hire_employee("Carson Bailey","(321) 227-4365",8,"Thursday");
CALL hire_employee("Piper Riggs","(267) 422-5417",1,"Monday");
CALL hire_employee("Keane Briggs","(691) 115-7825",2,"Wednesday");
CALL hire_employee("Asher Mercado","(137) 546-6905",2,"Wednesday");
CALL hire_employee("Anastasia Baird","(133) 907-6283",3,"Saturday");
CALL hire_employee("Maya Tillman","(215) 731-9248",6,"Friday");
CALL hire_employee("Kiona Barrett","(693) 810-9315",8,"Saturday");
CALL hire_employee("Randall Mckay","(224) 592-6222",2,"Sunday");
CALL hire_employee("Justin Chan","(773) 781-7008",4,"Wednesday");
CALL hire_employee("Justin Koch","(677) 365-8331",2,"Sunday");
CALL hire_employee("Sebastian Horn","(723) 196-7782",5,"Friday");
CALL hire_employee("Xander Higgins","(617) 639-4831",6,"Thursday");
CALL hire_employee("Jada Robinson","(868) 673-1777",7,"Tuesday");
CALL hire_employee("Yardley Fowler","(853) 843-3189",1,"Friday");
CALL hire_employee("Camden Sexton","(340) 997-7431",3,"Friday");
CALL hire_employee("Shaine Hinton","(313) 381-8079",5,"Sunday");
CALL hire_employee("Bell Marquez","(331) 356-1321",7,"Tuesday");
CALL hire_employee("Sebastian Nolan","(971) 368-5514",7,"Tuesday");
CALL hire_employee("Jacob Travis","(415) 750-3847",1,"Saturday");
CALL hire_employee("Lynn Long","(737) 615-5212",6,"Saturday");
CALL hire_employee("Jane Acevedo","(429) 215-2828",2,"Thursday");
CALL hire_employee("Ira Dean","(739) 674-7572",7,"Friday");
CALL hire_employee("Fuller Blackwell","(744) 177-4753",1,"Friday");
CALL hire_employee("Dane Spencer","(684) 960-5172",3,"Monday");  
        
INSERT INTO availability_status (`date`,beds,staffing,critical_rooms,urgent_rooms,stable_rooms,supplies)
VALUES (NOW(),500,40,200,150,150,500);

INSERT INTO diagnosis_responsibility(diagnosis_name,specialty_id)
VALUES ('Urgent',6),
       ('Clear',8);



CALL add_diagnosis('Urgent', 'Yes','Broken Left Leg', 'Pain when pressure is placed on leg','X-Ray', 'Leg needs 2 months rest', 'Pain and calcium meds', 10);
CALL add_diagnosis('Clear', 'No','Redness and swelling in both eyes', 'Watery Swollen eyes','Eye exam', NULL , 'Eye drops', 1);
CALL add_diagnosis('Critical', 'Yes','Cardiac Arrest', 'Fainting','ECG', NULL , 'Epinephrine', 3);
CALL add_diagnosis('Urgent', 'Yes','Broken Arm', 'Pain with lateral arm movement','X-Ray', '2 months with arm in arm band', 'Pain and calcium meds', 10);
CALL add_diagnosis('Urgent', 'Yes','Broken Wrist', 'Pain with wrist rotation','X-Ray', '1 months with in wrist wrap', 'Pain and calcium meds', 5);

