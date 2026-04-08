
create database onlinelearning;
use onlinelearning;
create table student(
student_ID varchar(25) primary key,
username varchar(25) not null,
password varchar(8) not null
);
create table student_email(
email varchar(30) not null,
student_ID varchar(25),
primary key(student_ID,email)
);
alter table student_email add constraint fk_15 foreign key(student_ID) references student(student_ID) on delete cascade on update cascade;
create table instructor(
instructor_ID varchar(25) primary key,
username varchar(25) not null,
password varchar(8) not null,
experience varchar(10) ,
education varchar(20) not null
);
create table instructor_email(
email varchar(30) not null,
instructor_ID varchar(25),
primary key(instructor_ID,email)
);
alter table instructor_email add constraint fk_16 foreign key(instructor_ID) references instructor(instructor_ID) on delete cascade on update cascade;
create table course(
course_ID varchar(25) primary key,
course_title varchar(100) not null,
unique(course_title),
description varchar(50) not null,
duration varchar(20) not null,
category varchar(30) not null
);
create table lesson(
lesson_ID varchar(25) primary key,
lesson_title varchar(100) not null,
unique(lesson_title),
description varchar(50) not null,
content varchar(20) not null,
course_ID varchar(25) not null
);
alter table lesson add constraint fk_5 foreign key(course_ID) references course(course_ID) on delete cascade on update cascade;
create table quiz(
quiz_ID varchar(25) primary key,
quiz_title varchar(40) not null,
unique(quiz_title),
description varchar(50) not null,
lesson_ID varchar(25)
);
alter table quiz add constraint fk_6 foreign key(lesson_ID) references lesson(lesson_ID) on delete set null on update cascade;
create table quiz_questions(
question varchar(100) not null,
quiz_ID varchar(25),
primary key(quiz_ID,question)
);
alter table quiz_questions add constraint fk_17 foreign key(quiz_ID) references quiz(quiz_ID) on delete cascade on update cascade;
create table answer_key(
answer varchar(25) not null,
quiz_ID varchar(25),
primary key(quiz_ID,answer)
);
alter table answer_key add constraint fk_18 foreign key(quiz_ID) references quiz(quiz_ID) on delete cascade on update cascade;
create table assignment(
assignment_ID varchar(25) primary key,
assignment_title varchar(40) not null,
unique(assignment_title),
description varchar(50) not null,
due_date date not null,
lesson_ID varchar(25)
);
alter table assignment add constraint fk_7 foreign key(lesson_ID) references lesson(lesson_ID) on delete set null on update cascade;
create table grade(
grade_ID varchar(25) primary key,
grade_letter char(1) not null,
course_ID varchar(25),
student_ID varchar(25)
);
alter table grade add constraint fk_9 foreign key(course_ID) references course(course_ID) on delete set null on update cascade;
alter table grade add constraint fk_12 foreign key(student_ID) references student(student_ID) on delete set null on update cascade;
create table discussion(
discussion_ID varchar(25) primary key,
discussion_title varchar(40) not null,
unique(discussion_title),
description varchar(50) not null,
post_comment_and_replies varchar(40) ,
lesson_ID varchar(25)
);
alter table discussion add constraint fk_8 foreign key(lesson_ID) references lesson(lesson_ID) on delete set null on update cascade;
create table announcement(
announcement_ID varchar(25) primary key,
announcement_title varchar(40) not null,
unique(announcement_title),
description varchar(50) not null,
date_posted date not null,
course_ID varchar(25)
);
alter table announcement add constraint fk_10 foreign key(course_ID) references course(course_ID) on delete set null on update cascade;
create table notification(
notification_ID varchar(25) primary key,
message varchar(100) not null,
date_sent date not null,
student_ID varchar(25)
);
alter table notification add constraint fk_11 foreign key(student_ID) references student(student_ID) on delete set null on update cascade;
create table report(
report_ID varchar(25) primary key,
progress char(5) not null,
grade_summary char(1) not null,
course_ID varchar(25),
student_ID varchar(25)
);
alter table report add constraint fk_13 foreign key(course_ID) references course(course_ID) on delete set null on update cascade;
alter table report add constraint fk_14 foreign key(student_ID) references student(student_ID) on delete set null on update cascade;
create table enrollment(
course_ID varchar(25),
student_ID varchar(25),
primary key(course_ID,student_ID)
);
alter table enrollment add constraint fk_1 foreign key(course_ID) references course(course_ID) on delete cascade on update cascade;
alter table enrollment add constraint fk_2 foreign key(student_ID) references student(student_ID) on delete cascade on update cascade;
create table course_faculty(
course_ID varchar(25),
instructor_ID varchar(25),
primary key(course_ID,instructor_ID)
);
alter table course_faculty add constraint fk_3 foreign key(course_ID) references course(course_ID) on delete cascade on update cascade;
alter table course_faculty add constraint fk_4 foreign key(instructor_ID) references instructor(instructor_ID) on delete cascade on update cascade;

INSERT INTO STUDENT VALUES
	('BSCS1141','Lamia Dar','PASS1231'),
	('BSCS1142','Sami Danish','PASS1232'),
	('BSCS1143','Ruqayya Basit','PASS1233'),
	('BSCS1144','Nour Aslam','PASS1234'),
	('BSCS1145','Jawad Niazi','PASS1235'),
	('BSCS1146','Leila Sultan','PASS1236'),
	('BSCS1147','Rashid Karim','PASS1237'),
	('BSCS1148','Farah Jameel','PASS1238'),
	('BSCS1149','Idris Abbas','PASS1239'),
	('BSCS1410','Huda Saleem','PASS1210'),
	('BSCS1411','Ibrahim Zahid','PASS1211'),
	('BSCS1412','Lina Mustafa','PASS1212'),
	('BSCS1413','Tariq Nawaz','PASS1213'),
	('BSCS1414','Yara Tariq','PASS1214'),
	('BSCS1415','Aziz Hashmi','PASS1215'),
	('BSCS1416','Samira Saeed','PASS1216'),
	('BSCS1417','Imran Raza','PASS1317'),
	('BSCS1418','Nadia Chaudhry','PASS1318'),
	('BSCS1419','Anas Mirza','PASS1319'),
	('BSCS1420','Salma Javed','PASS1320'),
	('BSCS1421','Zayd Kamal','PASS1321'),
	('BSCS1422','Rania Khan','PASS1322'),
	('BSCS1423','Ismail Rizvi','PASS1323'),
	('BSCS1424','Noor Abbasi','PASS2324'),
	('BSCS1425','Musa Khalid','PASS2325'),
	('BSCS1426','Khadija Shahid','PASS2326'),
	('BSCS1427','Bilal Siddiqui','PASS2327'),
	('BSCS1428','Hamza Shah','PASS2328'),
	('BSCS1429','Maryam Qureshi','PASS2329'),
	('BSCS1430','Yusuf Rahman','PASS1230'),
	('BSCS1431','Sara Ansari','PASS2331'),
	('BSCS1432','Omar Farooq','PASS2332'),
	('BSCS1433','Layla Ahmed','PASS2333'),
	('BSCS1434','Hassan Syed','PASS2334'),
	('BSCS1435','Zainab Malik','PASS2335');


INSERT INTO instructor VALUES
('I1101','Noura Tariq','14561231','11_Years','BSCS'),
('I1102','Lamia Anwar','24561232','12_Years','MSCS'),
('I1103','Azhar Hamid','34561233','13_Years','BSCS'),
('I1104','Mina Parvez','44561234','14_Years','MSAI'),
('I1105','Nasir Baig','54561235','15_Years','BSCS'),
('I1106','Zahra Hashim','64561236','16_Years','MSSE'),
('I1107','Amin Dar','74561237','17_Years','BSDS'),
('I1108','Tahir Aslam','84561238','18_Years','MSCS'),
('I1109','Hania Basit','94561239','19_Years','BSDS'),
('I1110','Raheem Danish','10456120','10_Years','MSCS'),
('I1111','Sadia Khan','11456123','11_Years','BSDS'),
('I1112','Adnan Jameel','12456122','12_Years','PhD'),
('I1113','Hiba Khalid','13456113','13_Years','MSIT'),
('I1114','Rania Sultan','14456114','14_Years','BSCS'),
('I1115','Asad Nawaz','15456115','15_Years','MSAI'),
('I1116','Alya Saleem','16456316','16_Years','BSCS'),
('I1117','Mahmoud Zahid','17456317','17_Years','MSCS'),
('I1118','Rihana Mustafa','18456318','18_Years','BSAI'),
('I1119','Amir Tariq','19452319','19_Years','MSAI'),
('I1120','Anaya Karim','20452320','20_Years','PhD'),
('I1121','Yasir Saeed','21612321','11_Years','PhD'),
('I1122','Sumaya Hashmi','22412322','7_Years','PhD'),
('I1123','Idris Mirza','23456323','23_Years','MSCS'),
('I1124','Laila Chaudhry','24456324','8_Years','PhD'),
('I1125','Samir Abbas','25612325','25_Years','MSCS'),
('I1126','Zaid Javed','26412326','26_Year','BSAI'),
('I1127','Iman Rizvi','27452327','19_Years','BSSE'),
('I1128','Mariam Shah','28456328','12_Years','MSAI'),
('I1129','Salim Siddiqui','29456329','2_Years','PhD'),
('I1130','Lina Hussain','30452330','3_Years','PhD'),
('I1131','Ibrahim Ansari','31412331','11_Years','MSSE'),
('I1132','Nadia Rahman','32452332','2_Years','MSSE'),
('I1133','Ayaan Farooq','33456333','3_Years','MSDS'),
('I1134','Rania Ahmed','34456134','4_Years','MSCS'),
('I1135','Khalid Sheikh','35612335','5_Years','MSDS'),
('I1136','Zara Malik','36456336','6_Years','BSSE'),
('I1137','Faisal Qureshi','37456337','7_Years','BSIT'),
('I1138','Safiya Ali','38456338','8_Years','BSCS'),
('I1139','Jamal Khan','39452339','9_Years','BSIT'),
('I1140','Amira Hassan','40456120','10_Years','BSCS');
alter table course modify description varchar(550);
INSERT INTO course (course_ID, course_title, description, duration, category) VALUES
('C1','Introduction to Computer Science','Fundamental concepts and principles in computer science','10 weeks','COMPUTER SCIENCE' ),
('C2','Data Structures and Algorithms','Study of fundamental data structures and algorithms essential for software development','10 weeks','COMPUTER SCIENCE' ),
('C3','Database Management Systems','Introduction to database systems and their management in computing environments','10 weeks','COMPUTER SCIENCE' ),
('C4','Operating Systems','Principles and operation of modern computer operating systems','10 weeks','COMPUTER SCIENCE' ),
('C5','Software Engineering Principles','Principles and practices for developing high-quality software systems','10 weeks','SOFTWARE ENGINEERING' ),
('C6','Artificial Intelligence Foundations','Introduction to foundational concepts and techniques in artificial intelligence','10 weeks','ARTIFICIAL INTELLIGENCE' ),
('C7','Machine Learning Algorithms','Study of algorithms and models used in machine learning applications','10 weeks','ARTIFICIAL INTELLIGENCE' ),
('C8','Data Science for Beginners','Introduction to data science concepts and tools for beginners','10 weeks','DATA SCIENCE' ),
('C9','Web Development and Design','Principles and practices of developing and designing websites and web applications','10 weeks','COMPUTER SCIENCE' ),
('C10','Mobile Application Development','Techniques and tools for developing applications on mobile platforms','10 weeks','COMPUTER SCIENCE' ),
('C11','Natural Language Processing','Study of computational techniques for processing human language','10 weeks','ARTIFICIAL INTELLIGENCE' ),
('C12','Deep Learning and Neural Networks','Exploration of deep learning techniques and neural network architectures','10 weeks','ARTIFICIAL INTELLIGENCE' ),
('C13','Cloud Computing','Introduction to cloud computing principles and services','10 weeks','COMPUTER SCIENCE' ),
('C14','Big Data Analytics','Techniques and tools for analyzing large datasets to extract insights','10 weeks','DATA SCIENCE' ),
('C15','Software Testing and Quality Assurance','Principles and practices for ensuring software quality and reliability','10 weeks','SOFTWARE ENGINEERING' ),
('C16','Computer Vision and Image Processing','Techniques for processing and analyzing visual information using computers','10 weeks','ARTIFICIAL INTELLIGENCE' ),
('C17','Cybersecurity Fundamentals','Introduction to fundamental concepts and practices in cybersecurity','10 weeks','CROSS DISCIPLINARY' ),
('C18','Human-Computer Interaction','Study of interactions between humans and computers and designing user interfaces','10 weeks','COMPUTER SCIENCE' ),
('C19','Blockchain Technology','Introduction to blockchain principles and applications beyond cryptocurrencies','10 weeks','CROSS DISCIPLINARY' ),
('C20','Advanced Topics in AI and Machine Learning','Advanced study of topics and current trends in artificial intelligence and machine learning','10 weeks','ARTIFICIAL INTELLIGENCE' );

insert into course_faculty values
('C1','I1138'),
('C2','I1140'),
('C3','I1132'),
('C4','I1125'),
('C5','I1131'),
('C6','I1115'),
('C7','I1118'),
('C8','I1111'),
('C9','I1112'),
('C10','I1122'),
('C11','I1119'),
('C12','I1104'),
('C13','I1120'),
('C15','I1106'),
('C17','I1137'),
('C20','I1104');

insert into enrollment values
	('C1','BSCS1423'),
	('C2','BSCS1143'),
	('C3','BSCS1428'),
	('C4','BSCS1427'),
	('C5','BSCS1412'),
	('C6','BSCS1418'),
	('C7','BSCS1415'),
	('C8','BSCS1420'),
	('C9','BSCS1425'),
	('C10','BSCS1149'),
	('C11','BSCS1146'),
	('C12','BSCS1142'),
	('C13','BSCS1417'),
	('C15','BSCS1421'),
	('C16','BSCS1410'),
	('C17','BSCS1144'),
	('C18','BSCS1429'),
	('C19','BSCS1432'),
	('C20','BSCS1430');

alter table lesson modify lesson_title varchar(250);
alter table lesson modify description varchar(550);
insert into lesson values
('L001', 'Overview of Computer Science', 'Introduction to the history, fields, and future trends in computer science', 'video', 'C1'),
('L002', 'Basic Programming Concepts', 'Fundamentals of programming languages and basic coding exercises', 'video', 'C1'),
('L003', 'Data Types and Variables', 'Understanding different data types and how to use variables in programming', 'video', 'C1'),
('L004', 'Control Structures', 'Learning about loops, conditionals, and control flow in programming', 'video', 'C1'),
('L005', 'Introduction to Algorithms', 'Basic concepts of algorithms and problem-solving techniques', 'video', 'C1'),
('L006', 'Introduction to Data Structures', 'Overview of various data structures and their importance in computing', 'video', 'C2'),
('L007', 'Arrays and Linked Lists', 'Understanding the implementation and application of arrays and linked lists', 'video', 'C2'),
('L008', 'Stacks and Queues', 'Learning about stack and queue data structures and their operations', 'video', 'C2'),
('L009', 'Trees and Graphs', 'Exploring tree and graph data structures and their use cases', 'video', 'C2'),
('L010', 'Sorting and Searching Algorithms', 'Studying different algorithms for sorting and searching data', 'video', 'C2'),
('L011', 'Introduction to Databases', 'Overview of database concepts and types of database management systems', 'video', 'C3'),
('L012', 'SQL Basics', 'Learning the fundamentals of Structured Query Language (SQL)', 'video', 'C3'),
('L013', 'Database Design and ER Models', 'Understanding entity-relationship models and database design principles', 'video', 'C3'),
('L014', 'Normalization and Indexing', 'Techniques for optimizing database performance through normalization and indexing', 'video', 'C3'),
('L015', 'Transactions and Concurrency Control', 'Managing database transactions and ensuring data integrity', 'video', 'C3'),
('L016', 'Overview of Operating Systems', 'Introduction to the basic functions and components of operating systems', 'video', 'C4'),
('L017', 'Process Management', 'Understanding process creation, scheduling, and termination', 'video', 'C4'),
('L018', 'Memory Management', 'Exploring how operating systems manage memory allocation and paging', 'video', 'C4'),
('L019', 'File Systems', 'Learning about file system structures and operations', 'video', 'C4'),
('L020', 'Security and Protection', 'Overview of security mechanisms and protection strategies in operating systems', 'video', 'C4'),
('L021', 'Software Development Life Cycle', 'Introduction to the phases of the software development life cycle', 'video', 'C5'),
('L022', 'Requirements Engineering', 'Techniques for gathering and documenting software requirements', 'video', 'C5'),
('L023', 'Software Design Principles', 'Understanding design patterns and principles for creating robust software', 'video', 'C5'),
('L024', 'Implementation and Coding Standards', 'Best practices for writing clean and maintainable code', 'video', 'C5'),
('L025', 'Testing and Maintenance', 'Methods for software testing and maintaining software systems post-deployment', 'video', 'C5'),
('L026', 'Introduction to AI', 'Overview of artificial intelligence and its applications', 'video', 'C6'),
('L027', 'Search Algorithms', 'Understanding different search strategies in AI', 'video', 'C6'),
('L028', 'Knowledge Representation', 'Techniques for representing knowledge in AI systems', 'video', 'C6'),
('L029', 'Expert Systems', 'Learning about expert systems and their components', 'video', 'C6'),
('L030', 'AI in Games', 'Exploring the use of AI techniques in game development', 'video', 'C6'),
('L031', 'Introduction to Machine Learning', 'Basic concepts and types of machine learning', 'video', 'C7'),
('L032', 'Supervised Learning', 'Techniques and algorithms used in supervised learning', 'video', 'C7'),
('L033', 'Unsupervised Learning', 'Understanding clustering and association algorithms in unsupervised learning', 'video', 'C7'),
('L034', 'Reinforcement Learning', 'Basics of reinforcement learning and its applications', 'video', 'C7'),
('L035', 'Evaluation and Model Selection', 'Techniques for evaluating and selecting machine learning models', 'video', 'C7'),
('L036', 'Introduction to Data Science', 'Overview of data science and its significance in the modern world', 'video', 'C8'),
('L037', 'Data Collection and Cleaning', 'Techniques for collecting and cleaning data for analysis', 'video', 'C8'),
('L038', 'Exploratory Data Analysis', 'Methods for exploring and visualizing data', 'video', 'C8'),
('L039', 'Statistical Analysis', 'Basic statistical methods used in data science', 'video', 'C8'),
('L040', 'Introduction to Machine Learning in data science', 'Overview of machine learning techniques used in data science', 'video', 'C8'),
('L041', 'HTML and CSS Basics', 'Introduction to HTML and CSS for creating web pages', 'video', 'C9'),
('L042', 'JavaScript Fundamentals', 'Learning the basics of JavaScript for interactive web development', 'video', 'C9'),
('L043', 'Responsive Design', 'Techniques for creating responsive web designs that work on various devices', 'video', 'C9'),
('L044', 'Web Frameworks', 'Overview of popular web frameworks like React and Angular', 'video', 'C9'),
('L045', 'Web Performance Optimization', 'Strategies for optimizing the performance of web applications', 'video', 'C9'),
('L046', 'Introduction to Mobile Development', 'Overview of mobile platforms and development environments', 'video', 'C10'),
('L047', 'Basic UI Design', 'Principles of designing user interfaces for mobile applications', 'video', 'C10'),
('L048', 'App Development with Android', 'Learning the basics of Android app development', 'video', 'C10'),
('L049', 'App Development with iOS', 'Introduction to iOS app development using Swift', 'video', 'C10'),
('L050', 'Mobile App Testing and Deployment', 'Techniques for testing and deploying mobile applications', 'video', 'C10'),
('L051', 'Introduction to NLP', 'Overview of natural language processing and its applications', 'video', 'C11'),
('L052', 'Text Preprocessing', 'Techniques for preparing text data for NLP tasks', 'video', 'C11'),
('L053', 'Tokenization and Embeddings', 'Understanding tokenization and word embeddings', 'video', 'C11'),
('L054', 'Sentiment Analysis', 'Methods for analyzing sentiment in text data', 'video', 'C11'),
('L055', 'Machine Translation', 'Overview of machine translation techniques and models', 'video', 'C11'),
('L056', 'Introduction to Deep Learning', 'Overview of deep learning concepts and applications', 'video', 'C12'),
('L057', 'Artificial Neural Networks', 'Understanding the basics of neural networks and their architecture', 'video', 'C12'),
('L058', 'Convolutional Neural Networks (CNNs)', 'Techniques and applications of CNNs in image processing', 'video', 'C12'),
('L059', 'Recurrent Neural Networks (RNNs)', 'Learning about RNNs and their use in sequential data processing', 'video', 'C12'),
('L060', 'Training Deep Learning Models', 'Techniques for training and optimizing deep learning models', 'video', 'C12'),
('L061', 'Introduction to Cloud Computing', 'Overview of cloud computing concepts and services', 'video', 'C13'),
('L062', 'Cloud Service Models', 'Understanding IaaS, PaaS, and SaaS models', 'video', 'C13'),
('L063', 'Cloud Storage and Databases', 'Techniques for storing and managing data in the cloud', 'video', 'C13'),
('L064', 'Cloud Security', 'Strategies for ensuring security in cloud computing environments', 'video', 'C13'),
('L065', 'Cloud Deployment and Management', 'Methods for deploying and managing applications in the cloud', 'video', 'C13'),
('L066', 'Introduction to Big Data', 'Overview of big data concepts and technologies', 'video', 'C14'),
('L067', 'Data Warehousing', 'Techniques for storing and managing large datasets', 'video', 'C14'),
('L068', 'Hadoop and MapReduce', 'Understanding Hadoop architecture and MapReduce programming', 'video', 'C14'),
('L069', 'Spark for Big Data Processing', 'Learning about Apache Spark and its applications in big data', 'video', 'C14'),
('L070', 'Data Visualization Techniques', 'Methods for visualizing and interpreting big data', 'video', 'C14'),
('L071', 'Introduction to Software Testing', 'Overview of software testing principles and practices', 'video', 'C15'),
('L072', 'Test Case Design', 'Techniques for designing effective test cases', 'video', 'C15'),
('L073', 'Automated Testing', 'Understanding the use of automated testing tools and frameworks', 'video', 'C15'),
('L074', 'Performance Testing', 'Methods for testing software performance and scalability', 'video', 'C15'),
('L075', 'Quality Assurance Processes', 'Strategies for ensuring software quality throughout the development lifecycle', 'video', 'C15'),
('L076', 'Introduction to Computer Vision', 'Overview of computer vision concepts and applications', 'video', 'C16'),
('L077', 'Image Acquisition and Preprocessing', 'Techniques for acquiring and preprocessing images', 'video', 'C16'),
('L078', 'Feature Extraction and Detection', 'Methods for extracting and detecting features in images', 'video', 'C16'),
('L079', 'Object Recognition and Tracking', 'Techniques for recognizing and tracking objects in images', 'video', 'C16'),
('L080', 'Deep Learning for Computer Vision', 'Applications of deep learning in computer vision tasks', 'video', 'C16'),
('L081', 'Introduction to Cybersecurity', 'Overview of cybersecurity principles and importance', 'video', 'C17'),
('L082', 'Network Security', 'Techniques for securing computer networks and communication', 'video', 'C17'),
('L083', 'Cryptography Basics', 'Understanding basic cryptographic techniques and their applications', 'video', 'C17'),
('L084', 'Cyber Threats and Vulnerabilities', 'Identifying and mitigating common cyber threats and vulnerabilities', 'video', 'C17'),
('L085', 'Incident Response and Management', 'Strategies for responding to and managing cybersecurity incidents', 'video', 'C17'),
('L086', 'Introduction to HCI', 'Overview of human-computer interaction principles and importance', 'video', 'C18'),
('L087', 'User Interface Design', 'Techniques for designing user-friendly interfaces', 'video', 'C18'),
('L088', 'Usability Testing', 'Methods for evaluating the usability of software and systems', 'video', 'C18'),
('L089', 'Interaction Design', 'Principles of designing interactive systems and experiences', 'video', 'C18'),
('L090', 'Accessibility in HCI', 'Strategies for designing accessible and inclusive user interfaces', 'video', 'C18'),
('L091', 'Introduction to Blockchain', 'Overview of blockchain technology and its applications', 'video', 'C19'),
('L092', 'Cryptographic Foundations', 'Understanding the cryptographic principles underlying blockchain', 'video', 'C19'),
('L093', 'Smart Contracts', 'Learning about smart contracts and their use in blockchain applications', 'video', 'C19'),
('L094', 'Blockchain Platforms', 'Overview of different blockchain platforms and their features', 'video', 'C19'),
('L095', 'Blockchain Security', 'Techniques for ensuring the security and integrity of blockchain systems', 'video', 'C19'),
('L096', 'Recent Advances in AI', 'Overview of recent advancements and trends in artificial intelligence', 'video', 'C20'),
('L097', 'Advanced Machine Learning Techniques', 'Study of advanced algorithms and techniques in machine learning', 'video', 'C20'),
('L098', 'AI for Big Data', 'Techniques for applying AI to big data analytics', 'video', 'C20'),
('L099', 'Ethics in AI', 'Discussion of ethical considerations and challenges in AI development', 'video', 'C20'),
('L100', 'Future Directions in AI Research', 'Exploration of potential future developments and research areas in AI', 'video', 'C20');

alter table quiz modify quiz_title varchar(100);
alter table quiz modify description varchar(250);
 
insert into quiz values
('Quiz1','AI in Games ','test on game development through AI','L030' ),
('Quiz2','Unsupervised Learning','test on clustering and other algoritms in unsupervised learning','L033' ),
('Quiz3','Evaluation and Model Selection','test on concepts of evaluation and model selection','L035' ),
('Quiz4','Data Collection and Cleaning','test on data collection and cleaning','L037' ),
('Quiz5','Statistical Analysis','test on statistical analysis','L039' ),
('Quiz6','Responsive Design ','test on designing responsive website','L043' ),
('Quiz7','Web Performance Optimization','test on perfromance optimization','L045' ),
('Quiz8','App Development with Android ','test on APP development on ANDROID','L048' ),
('Quiz9','App Development with iOS','test on APP development on IOS','L049' ),
('Quiz10','Text Preprocessing ','test on preparing text for NLP','L052' ),
('Quiz11','Sentiment Analysis','tests on methods of analyzing sentiments','L054' ),
('Quiz12','Artificial Neural Networks','test on neural networks','L057' ),
('Quiz13','Training Deep Learning Models','test on model training techniques','L060' ),
('Quiz14','Cloud Storage and Databases ','test on data storage in clouds','L063' ),
('Quiz15','Cloud Security','test on security strategies','L064' ),
('Quiz16','Hadoop and MapReduce','test on concepts of HADOOP and MAP REDUCE','L068' ),
('Quiz17','Data Visualization Techniques','test on data visualization techniques','L070' ),
('Quiz18','Test Case Design','test on designing of test cases','L072' ),
('Quiz19','Performance Testing','test on methods of performance testing ','L074' ),
('Quiz20','Feature Extraction and Detection','test on extraction and detection','L078' ),
('Quiz21','Deep Learning for Computer Vision','test on deep learning','L080'),
('Quiz22','Cryptography Basics','test on basic knowledge of cryptography','L083'),
('Quiz23','Cyber Threats and Vulnerabilities','test on cyber threats identification','L084'),
('Quiz24','User Interface Design','test on designing user-friendly UI','L087'),
('Quiz25','Interaction Design','test on interaction design','L089'),
('Quiz26','Blockchain Platforms','test about blockchain platforms','L094'),
('Quiz27','Blockchain Security','test on security strategies in blockchain','L095'),
('Quiz28','AI for Big Data','test on AI in big data','L098'),
('Quiz29','Ethics in AI','test on AI ethics','L099'),
('Quiz30','Basic Programming Concepts','test basic concepts of programming','L002'),
('Quiz31','Control Structures','test concepts about control structures','L004'),
('Quiz32','Stacks and Queues','test on implementation of stacks and queues','L008'),
('Quiz33','Trees and Graphs','test on trees and graphing','L009'),
('Quiz34','Database Design and ER Models','test on erd and designing','L013'),
('Quiz35','Normalization and Indexing','test on normalization','L014'),
('Quiz36','Overview of Operating Systems','test on OS basics','L016'),
('Quiz37','Requirements Engineering','test on techniqiues of requirement enginnering','L022'),
('Quiz38','Testing and Maintenance','test on testing and maintainence methods','L025'),
('Quiz39','Search Algorithms ','test on AI search algorithms','L027');

alter table quiz_questions modify question varchar(255) after quiz_id;
alter table answer_key modify answer varchar(255) after quiz_id;

insert into quiz_questions values
('Quiz30','What is the purpose of variables in programming?'),
('Quiz31','What is the role of conditional statements in programming?'),
('Quiz32','Describe how a stack data structure is used in function calls?Also implement any example.'),
('Quiz33','What are some real-world applications of graph data structures?'),
('Quiz34','What are the benefits of using ER diagrams in database design?'),
('Quiz35','Explain the concept of database normalization and its advantages.'),
('Quiz36','What are the main components of an operating system?'),
('Quiz37','How can stakeholders participate effectively in requirements gathering?'),
('Quiz38','Describe the importance of regression testing in software maintenance.'),
('Quiz39','Compare depth-first search and breadth-first search algorithms in AI.'),
('Quiz1','How can machine learning be applied to improve AI behaviors in gaming?'),
('Quiz2','How can clustering algorithms be applied in customer segmentation?'),
('Quiz3','What are the criteria for choosing an appropriate machine learning model?'),
('Quiz4','What are the challenges associated with data cleaning in data science?'),
('Quiz5','What are the key metrics used in descriptive statistics?'),
('Quiz6','Describe the principles of responsive web design.'),
('Quiz7','What are the key factors affecting web application performance?'),
('Quiz8','How can Android intents facilitate communication between app components?'),
('Quiz9','What are the advantages of using Swift for iOS app development?'),
('Quiz10','What steps are involved in pre-processing text data for sentiment analysis, and how do they improve the accuracy of the analysis?'),
('Quiz11','What is the difference between rule-based and machine learning approaches to sentiment analysis, and which approach is more effective in handling nuanced language?'),
('Quiz12','How do convolutional neural networks (CNNs) differ from recurrent neural networks (RNNs) in terms of architecture and application?'),
('Quiz14','What are the advantages and disadvantages of using cloud-based storage solutions like Amazon S3 or Google Cloud Storage for large-scale data storage?'),
('Quiz16','How does the MapReduce programming model work in Hadoop, and what are its advantages in processing large-scale data?'),
('Quiz17','What are the key considerations in choosing a data visualization tool like Tableau or Power BI, and how do they enable effective data storytelling?'),
('Quiz19','What is the difference between load testing and stress testing, and how do they help identify performance bottlenecks in software applications?'),
('Quiz21','What are the key differences between supervised and unsupervised learning in deep learning, and how do they apply to computer vision and natural language processing?'),
('Quiz22','What is the difference between symmetric and asymmetric encryption, and how are they used in secure data transmission?'),
('Quiz24','What are the key principles of user-centered design (UCD), and how do they improve the usability and accessibility of software applications?'),
('Quiz26','What are the key differences between public and private blockchain platforms, and how do they apply to use cases like supply chain management and voting systems?'),
('Quiz28','How do machine learning algorithms like clustering and decision trees apply to big data analytics, and what are their advantages in handling large-scale datasets?'),
('Quiz13','What is the difference between batch training and online training, and which technique is more suitable for large-scale datasets?'),
('Quiz23','What are the key types of cyber threats, and how do they differ in terms of motivation and impact?'),
('Quiz15','What is the difference between encryption and hashing, and how are they used in secure data storage and transmission?'),
('Quiz25','How does human-computer interaction (HCI) influence the design of software interfaces, and what are the key considerations in designing intuitive interfaces?'),
('Quiz18','What are the key principles of test-driven development (TDD), and how do they improve the quality and reliability of software development?'),
('Quiz20','What are the key techniques used in information extraction, and how do they differ from those used in information detection?'),
('Quiz27','How do consensus mechanisms like proof-of-work (PoW) and proof-of-stake (PoS) differ in terms of security and energy efficiency?'),
('Quiz29','What are the key ethical considerations in AI development, and how do they apply to issues like bias, privacy, and explainability?');

alter table instructor_email modify email varchar(30) after instructor_ID;

insert into instructor_email values
('I1101','I1101@gmail.com'),
('I1102','I1102@gmail.com'),
('I1103','I1103@gmail.com'),
('I1104','I1104@gmail.com'),
('I1105','I1105@gmail.com'),
('I1106','I1106@gmail.com'),
('I1107','I1107@gmail.com'),
('I1108','I1108@gmail.com'),
('I1109','I1109@gmail.com'),
('I1110','I1110@gmail.com'),
('I1111','I1111@gmail.com'),
('I1112','I1112@gmail.com'),
('I1113','I1113@gmail.com'),
('I1114','I1114@gmail.com'),
('I1115','I1115@gmail.com'),
('I1116','I1116@gmail.com'),
('I1117','I1117@gmail.com'),
('I1118','I1118@gmail.com'),
('I1119','I1119@gmail.com'),
('I1120','I1120@gmail.com'),
('I1121','I1121@gmail.com'),
('I1122','I1122@gmail.com'),
('I1123','I1123@gmail.com'),
('I1124','I1124@gmail.com'),
('I1125','I1125@gmail.com'),
('I1126','I1126@gmail.com'),
('I1127','I1127@gmail.com'),
('I1128','I1128@gmail.com'),
('I1129','I1129@gmail.com'),
('I1130','I1130@gmail.com'),
('I1131','I1131@gmail.com'),
('I1132','I1132@gmail.com'),
('I1133','I1133@gmail.com'),
('I1134','I1134@gmail.com'),
('I1135','I1135@gmail.com'),
('I1136','I1136@gmail.com'),
('I1137','I1137@gmail.com'),
('I1138','I1138@gmail.com'),
('I1139','I1139@gmail.com'),
('I1140','I1140@gmail.com');

describe student;
describe instructor;
describe instructor_email;
describe course;
describe lesson;
describe course_faculty;
describe enrollment;
describe quiz;
describe quiz_questions;
/*///////////////////////////////////////VIEWS///////////////////////////////////////////*/

/*Total students:*/
select count(student_ID) as total_student from student;

/*Total instructors:*/
select count(instructor_ID) as total_instructor from instructor;


/*find students who have not received any notifications:*/

select username from student 
where student_id not in 
(select student_id from notification);



/*find instructors teaching courses in a specific category (e.g., "ai"):*/

select username from instructor 
where instructor_id in (
    select cf.instructor_id 
    from course as c 
    join course_faculty as cf on c.course_id = cf.course_id 
    where c.category = 'ai'
);
/*find emails of instructors teaching more than 2 courses:*/


select email from instructor_email 
where instructor_id in (
    select instructor_id 
    from course_faculty 
    group by instructor_id 
    having count(course_id) > 2
);

/*find courses with no enrollments:*/

select course_title 
from course 
where course_id not in
 (select course_id from enrollment);

/*find courses that have at least one announcement posted:*/
select course_title  from course 
where course_id in 
(select course_id from announcement);

/*find quizzes with more than 5 questions:*/

select quiz_title 
from quiz 
where quiz_id in (
    select quiz_id 
    from quiz_questions 
    group by quiz_id 
    having count(question) > 5
);
/*find lessons with no quizzes assigned:*/
select lesson_title 
from lesson 
where lesson_id not in
 (select lesson_id from quiz);

/*find assignments with due dates in the next 7 days:*/

select assignment_title 
from assignment 
where due_date between '2025-01-19' and '2025-01-26';

/*find announcements posted in the last 30 days:*/

select announcement_title 
from announcement 
where date_posted >= '2024-12-20';



/*Find lessons with the most quizzes:*/
select l.lesson_title, subquery.total_quizzes
from lesson l
join (
    select lesson_id, count(quiz_id) as total_quizzes
    from quiz
    group by lesson_id
    order by total_quizzes desc
    limit 1
) as subquery on l.lesson_id = subquery.lesson_id;



/* Find students enrolled in courses taught by instructors with more
 than 5 years of experience:*/
select distinct s.student_id, s.username
from student as s
where s.student_id in (
    select e.student_id
    from enrollment as e
    join course_faculty as cf 
    on e.course_id = cf.course_id
    join instructor as i
    on cf.instructor_id = i.instructor_id
    where i.experience > '5'
);

/*Find the students who have the highest grade in each course:*/

select s.student_id, s.username, g.grade_letter, g.course_id
from student as s
join grade as g
 on s.student_id = g.student_id
where g.grade_letter = (
    select max(grade_letter)
    from grade
    where course_id = g.course_id
);


/*/////////////////////////////////CORELATED QUERIES////////////////////////////*/

/*find students with at least one grade of "a":*/
select username 
from student as s 
where exists (
    select 1 
    from grade as g 
    where g.student_id = s.student_id and g.grade_letter = 'a'
);

/*find instructors teaching more than 3 lessons:*/

select username from instructor as i 
where (
    select count(*) 
    from course_faculty as cf 
    join lesson as l on cf.course_id = l.course_id 
    where cf.instructor_id = i.instructor_id
) > 3;


/*find lessons with more quizzes than assignments:*/

select lesson_title 
from lesson l 
where (
    select count(*) 
    from quiz q 
    where q.lesson_id = l.lesson_id
) > (
    select count(*) 
    from assignment a 
    where a.lesson_id = l.lesson_id
);
/*find lessons with no associated discussions:*/

select lesson_title from lesson as l 
where not exists (
    select 1 
    from discussion as d 
    where d.lesson_id = l.lesson_id
);

/*find courses with no announcements posted this month:*/

select course_title from course as c 
where not exists (
    select 1 
    from announcement as a 
    where a.course_id = c.course_id and month(a.date_posted) = month(curdate())
);
/*find quizzes with no answers in the answer key:*/

select quiz_title from quiz as q 
where not exists (
    select 1 
    from answer_key as ak 
    where ak.quiz_id = q.quiz_id
);

/*find students with grades better than the class average for a course:*/

select s.username from student as s 
join grade as g
 on s.student_id = g.student_id 
where g.grade_letter > (
    select avg(g1.grade_letter) 
    from grade as g1 
    where g1.course_id = g.course_id
);
