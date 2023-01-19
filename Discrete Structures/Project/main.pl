%? -------------------------------------------------------------------------- */
%?                           % Muhammad Umar Waseem                           */
%? -------------------------------------------------------------------------- */
%? -------------------------------------------------------------------------- */
%?                      % Discrete Structures Section - A                     */
%? -------------------------------------------------------------------------- */
%? -------------------------------------------------------------------------- */
%?                                  % i200762                                 */
%? -------------------------------------------------------------------------- */

%! -------------------------------------------------------------------------- */
%                                  %! Rules                                 */
%! --------------------------------------------------------------------------*/



%- 2 -> check if two student have the same section for a given course

sameSection(Student1, Student2, Course):-
    student(RollNumber1, Student1),
    student(RollNumber2, Student2),
    section(RollNumber1, Section1),
    section(RollNumber2, Section2),
    courseSection(Course, Section),
    Section1 = Section,
    Section2 = Section.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- 3 -> check if the two courses given have exam at same time 

sameTime(Course1, Course2):-
    examTime(Day,StartTime1,EndTime1,Course1,_Room1),
    examTime(Day,StartTime2,EndTime2,Course2,_Room2),
    StartTime1 = StartTime2,
    EndTime1 = EndTime2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-4 -> Check if a student has more than one roll number assigned

moreRollNum(Student):-
    student(RollNum, Student),
    student(RollNum1, Student),
    RollNum1 \= RollNum.        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%- 5->Check if the two courses given in the query, have the exam in the same room at the same time.

sameRoom(Course1, Course2):-
    examTime(Day, Start1, End1, Course1, Room1),
    examTime(Day, Start2, End2, Course2, Room2),
    Room1 = Room2,
    Start1 = Start2,
    End1 = End2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- 6 -> Check if the given instructor is teaching any of the sections of the given course name

teachingAnySection(Name, CourseID1):-
    courseSection(CourseID1, Section1),
    instructor(Email, Name),
    teaches(Email, Section2),
    courseSection(CourseID2, Section2),
    CourseID1 = CourseID2,
    Section1 = Section2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- 7 -> Check if the given instructor teaches two different courses

% get instructor's email from the given name and check if the instructor teaches two different courses
teachesTwo(InstructorName):-
    instructor(Email, InstructorName),
    teaches(Email, CourseID1),
    teaches(Email, CourseID2),
    CourseID1 = CourseID2.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- 8 -> check if the exams in the given rooms can be switched having the same capacity

switching(Room1, Room2):-
    capacity(Room1, Cap1),
    capacity(Room2, Cap2),
    Cap1 = Cap2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%! -------------------------------------------------------------------------- */
%!                         % ! Facts - Knowledge Base                         */
%! -------------------------------------------------------------------------- */


student("18I-0429" , "Mohammad Usman Chaudhary" ) . 
student("18I-0641" , "Moeiz Ali" ) . 
student("18I-0712" , "Maryam Hussain" ) . 
student("18I-0745" , "Awais Ahmed" ) . 
student("18I-1582" , "Haseeb Arshad" ) . 
student("19I-0406" , "Shoaib Asghar" ) . 
student("19I-0417" , "Muhammad Ali" ) . 
student("19I-0423" , "Abdul Wasay Rizwani" ) . 
student("19I-0426" , "Maryam Naveed" ) . 
student("19I-0434" , "Sourav Malani" ) . 
student("19I-0435" , "Syed Aun Abbas" ) . 
student("19I-0441" , "Husnain Rasul Qadri" ) . 
student("19I-0453" , "Waqas Arshad" ) . 
student("19I-0455" , "Muhammad Usman" ) . 
student("19I-0456" , "Abdul Moeed Kashif" ) . 
student("19I-0457" , "Abdullah Malik" ) . 
student("19I-0466" , "Muhammad Aftab Ali Khan" ) . 
student("19I-0468" , "Khajasta Zainab" ) . 
student("19I-0476" , "Abdullah" ) . 
student("19I-0496" , "Muhammad Saad Bin Sagheer" ) . 
student("19I-0498" , "Masroor Ahmed" ) . 
student("19I-0500" , "Abdul Manan Akram" ) . 
student("19I-0524" , "Muhammad Awais Azhar" ) . 
student("19I-0525" , "Oheed Bin Imran" ) . 
student("19I-0528" , "Nayyar Shoaib Malik" ) . 
student("19I-0531" , "Abuzar" ) . 
student("19I-0544" , "Syed Mustafa" ) . 
student("19I-0548" , "Azka Iftikhar" ) . 
student("19I-0554" , "Uzair Tariq Balghari" ) . 
student("19I-0576" , "Muhammad Iqbal Manzoor" ) . 
student("19I-0594" , "Umar Mansoor" ) . 
student("19I-0599" , "Saroosh Hammad" ) . 
student("19I-0613" , "Tamia Waheed" ) . 
student("19I-0633" , "Momin Mahmud Jalib" ) . 
student("19I-0634" , "Faria Eman" ) . 
student("19I-0641" , "Muhammad Talha Zeb Khan" ) . 
student("19I-0655" , "Eman Saleem" ) . 
student("19I-0683" , "Basit Ali" ) . 
student("19I-0685" , "Qurat Ul Ain Binte Muhammad Zakir" ) . 
student("19I-0693" , "Umar Draz" ) . 
student("19I-0695" , "Abdullah Bin Faiz" ) . 
student("19I-0699" , "Mubrra Asma" ) . 
student("19I-0717" , "Hassam Saeed" ) . 
student("19I-0736" , "Faiq Asif" ) . 
student("19I-0740" , "Muhammad Haris" ) . 
student("19I-1911" , "Abdullah Faisal" ) . 
student("19I-1964" , "Mohammad Mustafa Khalid" ) . 
student("19I-2012" , "Abdullah Shahzad" ) . 
student("19I-2013" , "Muhammad Faizan Khan" ) . 
student("19I-2048" , "Ahsan Qamar" ) . 
student("18I-0553" , "Zain Ali" ) . 
student("18I-0629" , "Muhammad Abdullah" ) . 
student("18I-1653" , "Hamza Khalid Khan" ) . 
student("19I-0416" , "Muhammad Haashir Ismail" ) . 
student("19I-0443" , "Aveen Noor" ) . 
student("19I-0458" , "Hamza Mehmood" ) . 
student("19I-0461" , "Mohammad Saim Aslam" ) . 
student("19I-0493" , "Usama Khatab" ) . 
student("19I-0501" , "Summama Shakeel" ) . 
student("19I-0506" , "Ahmad Aslam Khan" ) . 
student("19I-0526" , "Muhammad Bilal Saleem" ) . 
student("19I-0529" , "Hayiqa Fatima" ) . 
student("19I-0533" , "Ali Qumail" ) . 
student("19I-0541" , "Kashif Kamran" ) . 
student("19I-0550" , "Kanza Latif" ) . 
student("19I-0553" , "Adeen Ayub" ) . 
student("19I-0556" , "Haider Ali Khan" ) . 
student("19I-0564" , "Azhar Ali" ) . 
student("19I-0571" , "Haroon Ayaz" ) . 
student("19I-0574" , "Musa Anwaar" ) . 
student("19I-0588" , "Muhammad Afnan Akram" ) . 
student("19I-0595" , "Asim Umar" ) . 
student("19I-0619" , "Muhammad Huzaifa Siddiqui" ) . 
student("19I-0627" , "Muhammad Afrasyab Afzal" ) . 
student("19I-0632" , "Munem Bari Hashmi" ) . 
student("19I-0651" , "Navira Munir" ) . 
student("19I-0654" , "Zainab Azeem" ) . 
student("19I-0662" , "Asim Ali" ) . 
student("19I-0678" , "Ammar Ahmad" ) . 
student("19I-0691" , "Hrithik Dev Jeevan" ) . 
student("19I-0692" , "Muhammad Moiz Sajid" ) . 
student("19I-0701" , "Muhammad Shah Hussain Khan" ) . 
student("19I-0704" , "Muhammad Awais Tahir" ) . 
student("19I-0706" , "Muhammad Umar Farooq" ) . 
student("19I-0724" , "Rafia Zubair" ) . 
student("19I-0729" , "Muhammad Hamza" ) . 
student("19I-0730" , "Haroon Riasat" ) . 
student("19I-0734" , "Adnan Khan" ) . 
student("19I-0741" , "Zohaib Adnan" ) . 
student("19I-1742" , "Adnan Yousaf" ) . 
student("19I-1969" , "Noor Ul Ain Arshad" ) . 
student("19I-1973" , "Hassan Ali Ansari" ) . 
student("19I-1981" , "Ahsan Mehmood" ) . 
student("19I-1983" , "Ayesha Zafar" ) . 
student("19I-1989" , "Awais Mohammad" ) . 
student("19I-1995" , "Muhammad Zakee" ) . 
student("19I-2009" , "Muhammad Rizwan" ) . 
student("19I-2015" , "Sardar Muneeb Hassan Khan" ) . 
student("19I-2150" , "Adil Ali" ) . 
student("19I-2157" , "Hammad Umar" ) . 
student("19I-2162" , "Faraya Baig" ) . 
student("19I-2167" , "Asawira Imaan" ) . 
student("19I-2168" , "Muhammad Maaz Munir" ) . 
student("19I-2170" , "Ahmad Ali" ) . 
student("19I-2175" , "Muhammad Abubakr Humayun" ) . 
student("17I-0292" , "Ahmad Nawaz" ) . 
student("18I-0682" , "Ibrahim Shafiq" ) . 
student("18I-0727" , "Muhammad Asim Altaf" ) . 
student("18I-0728" , "Sohaib Shahidulhaq" ) . 
student("19I-0401" , "Syed Haider Ali Zaidi" ) . 
student("19I-0414" , "Muhammad Zain" ) . 
student("19I-0418" , "Wasiq Majeed" ) . 
student("19I-0420" , "Muhammad Talha Masood" ) . 
student("19I-0437" , "Muhammad Momin Bin Tariq" ) . 
student("19I-0445" , "Gulsher Khan" ) . 
student("19I-0454" , "Aamna Kamran" ) . 
student("19I-0490" , "Raja Salar Abbas" ) . 
student("19I-0495" , "Usman Shafique" ) . 
student("19I-0502" , "Vara Ali" ) . 
student("19I-0505" , "Muddassir Lateef" ) . 
student("19I-0536" , "Syed Muhammad Danial" ) . 
student("19I-0555" , "Safa Zaid Malik" ) . 
student("19I-0569" , "Asim Kamran" ) . 
student("19I-0572" , "Ali Ahmad Jan" ) . 
student("19I-0573" , "Umais Nisar" ) . 
student("19I-0578" , "Mohammad Hamzah Bilal" ) . 
student("19I-0597" , "Azka Ali" ) . 
student("19I-0607" , "Muhammad Ibrahim Aamer" ) . 
student("19I-0609" , "Labeeb Ul Hassan" ) . 
student("19I-0610" , "Syed Mohammad Abdur Rafay" ) . 
student("19I-0625" , "Mohammad Maaz" ) . 
student("19I-0663" , "Abdul Samie" ) . 
student("19I-0684" , "Syed Muhammad Ali Musa Raza" ) . 
student("19I-0690" , "Muhammad Ameen" ) . 
student("19I-0715" , "Yusuf Noor" ) . 
student("19I-0725" , "Eysha Fatima" ) . 
student("19I-0733" , "Zain Hafeez" ) . 
student("19I-0749" , "Shayan Amir Zuberi" ) . 
student("19I-1873" , "Ijaz Ahmad" ) . 
student("19I-1967" , "Fatima Noor" ) . 
student("19I-1970" , "Hafiz Muhammad Khizar Rasheed" ) . 
student("19I-1975" , "Hammad Hameed" ) . 
student("19I-1980" , "Saif Ullah Shah" ) . 
student("19I-1984" , "Muhammad Bilal" ) . 
student("19I-1998" , "Shanzay Asad" ) . 
student("19I-2024" , "Zaryab Shahzad" ) . 
student("19I-2029" , "Sillah Babar" ) . 
student("19I-2042" , "Haseebullah" ) . 
student("19I-2047" , "Noveen Fatima" ) . 
student("19I-2156" , "Naeem Mustafa" ) . 
student("19I-2184" , "Muhammad Umer Ahsan" ) . 
student("19I-2200" , "Muhammad Huzaifa" ) . 
student("18I-0431" , "Muhammad Haseeb Shaukat" ) . 
student("19I-0413" , "Malik Talha Saeed" ) . 
student("19I-0469" , "Muhammad Zahid" ) . 
student("19I-0477" , "Anna Ahmed" ) . 
student("19I-0478" , "Maria Hassan" ) . 
student("19I-0479" , "Tabarak Sikander" ) . 
student("19I-0484" , "Hamza Rehan" ) . 
student("19I-0485" , "Waleed Mukhtar" ) . 
student("19I-0489" , "Muhammad Shoaib Azhar" ) . 
student("19I-0507" , "Muhammad Fozan" ) . 
student("19I-0515" , "Hanzla Sibghat" ) . 
student("19I-0521" , "Muhammad Umer" ) . 
student("19I-0527" , "Syed Abdullah Nasir" ) . 
student("19I-0534" , "Uswa Nasir" ) . 
student("19I-0535" , "Muhammad Shayan Tariq" ) . 
student("19I-0538" , "Zain Ul Abidin" ) . 
student("19I-0543" , "Usama Hameed Awan" ) . 
student("19I-0557" , "Muhammad Usama Shafique" ) . 
student("19I-0559" , "Muhammad Rizwan Khan" ) . 
student("19I-0568" , "Abdul Rehman Sheikh" ) . 
student("19I-0582" , "Hammad Ahmed" ) . 
student("19I-0600" , "Atif Munir" ) . 
student("19I-0606" , "Waqas Ahmad" ) . 
student("19I-0614" , "Iqra Manzoor" ) . 
student("19I-0615" , "Saad Ahmad Jilani" ) . 
student("19I-0616" , "Muhammad Abdullah Bilal" ) . 
student("19I-0623" , "Hasnain Tariq" ) . 
student("19I-0635" , "Syeda Narmeen Bukhari" ) . 
student("19I-0636" , "Muhammad Bilal" ) . 
student("19I-0650" , "Muhammad Aqeel Afzal" ) . 
student("19I-0656" , "Mahnoor Fazal" ) . 
student("19I-0666" , "Muhammad Umaid Khakwani" ) . 
student("19I-0677" , "Ghulam Mustafa Zafar" ) . 
student("19I-0700" , "Hamza Nasir" ) . 
student("19I-0708" , "Muhammad Ahmad" ) . 
student("19I-0721" , "Sumen Jamil" ) . 
student("19I-0745" , "Ibrahim Razzaque Bhatti" ) . 
student("19I-1982" , "Abid Hussain" ) . 
student("19I-1986" , "Talha Rashid" ) . 
student("19I-2003" , "Hamza Iftikhar Abbasi" ) . 
student("19I-2008" , "Anas Hameed" ) . 
student("19I-2011" , "Hamza Bin Khalid" ) . 
student("19I-2016" , "Bilal Saeed Malik" ) . 
student("19I-2043" , "Hunaid Sohail Mirza" ) . 
student("19I-2155" , "Muhammad Bilal Ali" ) . 
student("18I-0729" , "Maaz Naeem" ) . 
student("18I-0743" , "Ikram Ullah Khan" ) . 
student("18I-1590" , "Armish Munir" ) . 
student("19I-0405" , "Abdul Ahad" ) . 
student("19I-0410" , "Muhammad Uzair" ) . 
student("19I-0411" , "Rohan Saeed Butt" ) . 
student("19I-0419" , "Muhammad Nauman Ahmed Khan" ) . 
student("19I-0425" , "Abdullah Usman" ) . 
student("19I-0438" , "Fatima Asim" ) . 
student("19I-0446" , "Muhammad Hammad" ) . 
student("19I-0450" , "Aliyan Shahid Satti" ) . 
student("19I-0452" , "Muhammad Daud Nasir" ) . 
student("19I-0471" , "Fakhiha Rameen" ) . 
student("19I-0473" , "Wahaj Rahman" ) . 
student("19I-0481" , "Muhammad Faisal Sher" ) . 
student("19I-0497" , "Ahmed Rohan" ) . 
student("19I-0508" , "Ibrahim" ) . 
student("19I-0511" , "Muhammad Hassan Rana" ) . 
student("19I-0513" , "Muhammad Abdullah Akram" ) . 
student("19I-0517" , "Umair Afzal" ) . 
student("19I-0551" , "Usama Khan" ) . 
student("19I-0558" , "Muhammad Zohaib" ) . 
student("19I-0565" , "Abdul Hamid" ) . 
student("19I-0570" , "Muhammad Sameer Khan" ) . 
student("19I-0577" , "Mujtaba Ali" ) . 
student("19I-0584" , "Mirza Abdur Rahman" ) . 
student("19I-0598" , "Muaaz Ahmad" ) . 
student("19I-0601" , "Muhammad Momin Irfan" ) . 
student("19I-0605" , "Muhammad Hamza Tariq" ) . 
student("19I-0611" , "Abdul Mannan Chughtai" ) . 
student("19I-0620" , "Talha Zain" ) . 
student("19I-0621" , "Muhammad Talha Iqbal" ) . 
student("19I-0626" , "Adeeba Khan" ) . 
student("19I-0647" , "Muqeet Ullah Ghazi" ) . 
student("19I-0659" , "Asad Tariq" ) . 
student("19I-0665" , "Zainab Kayani" ) . 
student("19I-0681" , "Syed Taha Rizwan" ) . 
student("19I-0707" , "Sameet Ikram" ) . 
student("19I-0712" , "Tayyab Khan Satti" ) . 
student("19I-0723" , "Hassan Ahmed Qayyum" ) . 
student("19I-0726" , "Malaika Waheed" ) . 
student("19I-0739" , "Hassan Ali Khan" ) . 
student("19I-0744" , "Sobia Noor Fatima" ) . 
student("19I-2021" , "Muhammad Talha Khan" ) . 
student("19I-2036" , "Hammad Khan" ) . 
student("19I-2153" , "Aneeza Sajjad Mazari" ) . 
student("19I-2173" , "Waleed Khalid Kayani" ) . 
student("19I-2178" , "Minahil Irshad" ) . 
student("19I-2179" , "Abdullah Abbasi" ) . 
student("19I-2187" , "Chaudhary Muhammad Asfandyar Sabri" ) . 
student("19I-2196" , "Fawaz Ahmed Dar" ) . 
student("18I-0435" , "Muhammad Bilal Khalid" ) . 
student("18I-0558" , "Ghasmir Ahmad" ) . 
student("18I-0735" , "Shahmeer Babar Gill" ) . 
student("19I-0402" , "Muhammad Usman Malik" ) . 
student("19I-0403" , "Muhammad Usama Umar" ) . 
student("19I-0404" , "Hadia Noor" ) . 
student("19I-0409" , "Husam Ali" ) . 
student("19I-0439" , "Wazima Tariq" ) . 
student("19I-0459" , "Muhammad Qasim Jamal" ) . 
student("19I-0465" , "Mirza Usman Baig" ) . 
student("19I-0472" , "Mehmood Amjad" ) . 
student("19I-0474" , "Saad Ullah Khan" ) . 
student("19I-0475" , "Haseeb Ramzan" ) . 
student("19I-0491" , "Rasib Zaman" ) . 
student("19I-0492" , "Ahmad Ul Wahhab" ) . 
student("19I-0494" , "Muhammad Saqib" ) . 
student("19I-0504" , "Amjad Arshad" ) . 
student("19I-0510" , "Minhal Zafar" ) . 
student("19I-0542" , "Mohammad Shazil Mahmood" ) . 
student("19I-0545" , "Ahmed Ali" ) . 
student("19I-0552" , "Muhammad Taimoor" ) . 
student("19I-0560" , "Hassan Saif" ) . 
student("19I-0561" , "Muhammad" ) . 
student("19I-0580" , "Ahmed Bilal" ) . 
student("19I-0581" , "Moattar Zeest Rana" ) . 
student("19I-0602" , "Neha Naveed" ) . 
student("19I-0639" , "Haziq Ali" ) . 
student("19I-0640" , "Muhammad Kashif Niazi" ) . 
student("19I-0670" , "Muhammad Bilal" ) . 
student("19I-0698" , "Muhammad Ibtehaj Ali" ) . 
student("19I-0703" , "Hyder Ali Memon" ) . 
student("19I-0727" , "Talal Ahmed" ) . 
student("19I-0737" , "Hajira Uzair" ) . 
student("19I-0738" , "Tehreem Fatima" ) . 
student("19I-0742" , "Abeeha Fatima" ) . 
student("19I-1971" , "Syed Sabih Ahmed Zaidi" ) . 
student("19I-1976" , "Faizan Ul Hassan Mehdi" ) . 
student("19I-1977" , "Meshal Cheema" ) . 
student("19I-1978" , "Amna Shafiq" ) . 
student("19I-2006" , "Wazir Shehryar Ali" ) . 
student("19I-2007" , "Syed Mohammad Sher Ali Shah" ) . 
student("19I-2014" , "Danyal Faheem" ) . 
student("19I-2019" , "Daniyal Ahmad Bin Shafiq" ) . 
student("19I-2026" , "Hammas Ahmed Awan" ) . 
student("19I-2027" , "Faizan Shabbir" ) . 
student("19I-2030" , "Muhammad Waasay Shaheer Iqbal Malik" ) . 
student("19I-2152" , "Muhammad Shaheer" ) . 
student("19I-2154" , "Mahrukh Sohail" ) . 
student("19I-2172" , "Hanan Ali" ) . 
student("19I-2177" , "Hammad Khalid" ) . 
student("19I-2193" , "Husnain Zahid" ) . 
student("19I-2194" , "Faiez Malik" ) . 
student("19I-2199" , "Syed Muhammad Abubakr" ) . 
student("17I-0121" , "Muhammad Owais Qarni" ) . 
student("18I-0608" , "Muhammad Haris Anwar" ) . 
student("18I-0620" , "Ahmer Ejaz" ) . 
student("18I-1581" , "Khubaib Abid" ) . 
student("18I-1588" , "Wajahat Karim" ) . 
student("18I-1659" , "Abdul Ahad Bin Abid" ) . 
student("18I-1661" , "Ahmad Arif" ) . 
student("19I-0408" , "Idrees Zohrab" ) . 
student("19I-0412" , "Fizzah Ilyas" ) . 
student("19I-0421" , "Kashfa Farooq" ) . 
student("19I-0422" , "Syed Muhammad Ibtisam" ) . 
student("19I-0428" , "Syed Hamza Hassan" ) . 
student("19I-0431" , "Muhammad Bin Awais" ) . 
student("19I-0436" , "Fajr Naveed" ) . 
student("19I-0440" , "Iman Tariq" ) . 
student("19I-0444" , "Afsheen Ahmad" ) . 
student("19I-0447" , "Hira Khalid" ) . 
student("19I-0448" , "Omar Khan" ) . 
student("19I-0509" , "Aaema Zainab Pirzada" ) . 
student("19I-0512" , "Nisar Mehmood" ) . 
student("19I-0514" , "Naveed Ahmed" ) . 
student("19I-0585" , "Muhammad Mashaf Uz Zaman" ) . 
student("19I-0596" , "Ghulam Mohiuddin" ) . 
student("19I-0603" , "Rizwan Habib" ) . 
student("19I-0612" , "Muhammad Ali Akram" ) . 
student("19I-0631" , "Mateen Ahmed Khan" ) . 
student("19I-0642" , "Awais Sabir" ) . 
student("19I-0652" , "Talha Rizwan Malik" ) . 
student("19I-0653" , "Noor Ul Eman" ) . 
student("19I-0657" , "Syed Iftikhar Mehdi" ) . 
student("19I-0660" , "Maaz Tariq" ) . 
student("19I-0667" , "Abdullah Khalid" ) . 
student("19I-0674" , "Muhammad Taimur" ) . 
student("19I-0680" , "Muhammad Anser Qureshi" ) . 
student("19I-0694" , "Kunwar Ahsan Murad" ) . 
student("19I-0719" , "Sajeel Ali Khan Sherwani" ) . 
student("19I-0728" , "Azwar Shariq" ) . 
student("19I-0731" , "Muhammad Musa Ishaq Whyne" ) . 
student("19I-0746" , "Haris Riaz" ) . 
student("19I-1974" , "Muhammad Saad Bajwa" ) . 
student("19I-1987" , "Zain Ul Abideen Arshad" ) . 
student("19I-2002" , "Nile Lazarus" ) . 
student("19I-2045" , "Eman Hassan" ) . 
student("19I-2049" , "Talha" ) . 
student("19I-2176" , "Muhammad Absar Khalid" ) . 
student("19I-2197" , "Bilaluddin Ahmed" ) . 
student("19I-2201" , "Muhammad Khuzaima Sajjad" ) . 
student("19K-0312" , "Ahmed Ibrahim Khan" ) . 
student("19I-1650" , "Umer Javed" ) . 
student("19I-1651" , "Saad Rabbani" ) . 
student("19I-1662" , "Muhammad Talha Tanveer" ) . 
student("19I-1667" , "Suleman Rehman" ) . 
student("19I-1671" , "Muhammad Noman Ilyas" ) . 
student("19I-1682" , "Amna Amin" ) . 
student("19I-1684" , "Abiha Farid" ) . 
student("19I-1685" , "Muhammad Armughan" ) . 
student("19I-1686" , "Syed Muhammad Sajjad Hussain" ) . 
student("19I-1702" , "Fahad Bin Rehan" ) . 
student("19I-1713" , "Muhammad Shah Nehal Ali" ) . 
student("19I-1718" , "Muhammad Abdullah Waseem" ) . 
student("19I-1720" , "Laiba Nadeem" ) . 
student("19I-1725" , "Firza Hussain" ) . 
student("19I-1733" , "Muhammd Tihami Munawar" ) . 
student("19I-1737" , "Shamshad Ali" ) . 
student("19I-1738" , "Ammar Javed" ) . 
student("19I-1748" , "Rana Muaaz Ahmad" ) . 
student("19I-1752" , "Muhammad Abdullah Ali Satti" ) . 
student("19I-1754" , "Dua Ghaffar Rao" ) . 
student("19I-1755" , "Sahil Raja" ) . 
student("19I-1756" , "Muhammad Saad Habib Awan" ) . 
student("19I-1758" , "Saud Ul Huda" ) . 
student("19I-1759" , "Unza Munaf" ) . 
student("19I-1760" , "Manya Imran" ) . 
student("19I-1761" , "Huma Ahmed" ) . 
student("19I-1764" , "Osama Iftikhar" ) . 
student("19I-1769" , "Ammar Asim" ) . 
student("19I-1782" , "Abdullah Akram" ) . 
student("19I-1783" , "Syed Bahadur Ali Shah" ) . 
student("19I-1785" , "Hassan Sohail" ) . 
student("19I-1786" , "Muhammad Usama Azam" ) . 
student("19I-1788" , "Areej Zafar" ) . 
student("19I-1795" , "Umer Sajjad" ) . 
student("19I-1951" , "Khalil Ullah Javed" ) . 
student("19I-1952" , "Azeem Siddique" ) . 
student("19I-1954" , "Muhammad Rafid Imran" ) . 
student("19I-1956" , "Fatima Tahir" ) . 
student("19I-1965" , "Awais Sajid" ) . 
student("19I-1985" , "Sohaib Bin Haroon" ) . 
student("19I-1990" , "Osaid Muhammad Ameer" ) . 
student("19I-1991" , "Asif Mujeeb" ) . 
student("19I-1997" , "Zoha Tariq" ) . 
student("19I-2000" , "Azaz Ul Haq" ) . 
student("19I-2032" , "Hakim Ali" ) . 
student("19I-2033" , "Muhammad Jawad Farooqui" ) . 
student("19I-2034" , "Talha Pasha" ) . 
student("19I-2165" , "Muhammad Abdul Muiz Mumtaz" ) . 
student("19I-2166" , "Humna Mursalin" ) . 
student("19I-2171" , "Muhammad Yaqoob" ) . 
student("19I-2174" , "Nabiha Faisal" ) . 
student("19I-2203" , "Kunwar Sabeeh Ali Khan" ) . 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


instructor("hassan.mustafa@nu.edu.pk","Hassan Mustafa").
instructor("saba.rasheed@nu.edu.pk","Saba Rasheed").
instructor("saba.rasheed@nu.edu.pk","Saba Rasheed").
instructor("noor.ul ain@nu.edu.pk","Noor ul Ain").
instructor("hassan.mustafa@nu.edu.pk","Hassan Mustafa").
instructor("saba.rasheed@nu.edu.pk","Saba Rasheed").
instructor("noor.ul ain@nu.edu.pk","Noor ul Ain").
instructor("noor.ul ain@nu.edu.pk","Noor ul Ain").
instructor("shehreyar.rashid@nu.edu.pk","Shehreyar Rashid").
instructor("shehreyar.rashid@nu.edu.pk","Shehreyar Rashid").
instructor("umair.arshad@nu.edu.pk","Umair Arshad").
instructor("zeeshan.qaiser@nu.edu.pk","Zeeshan Qaiser").
instructor("rohail.gulbaz@nu.edu.pk","Rohail Gulbaz").
instructor("ameen.chilwan@nu.edu.pk","Ameen Chilwan").
instructor("ameen.chilwan@nu.edu.pk","Ameen Chilwan").
instructor("farwa.batool@nu.edu.pk","Farwa Batool").
instructor("shams.farooq@nu.edu.pk","Shams Farooq").
instructor("farwa.batool@nu.edu.pk","Farwa Batool").
instructor("rohail.gulbaz@nu.edu.pk","Rohail Gulbaz").
instructor("khadija.farooq@nu.edu.pk","Khadija Farooq").
instructor("shafaq.riaz@nu.edu.pk","Shafaq Riaz").
instructor("amna.irum@nu.edu.pk","Amna Irum").
instructor("amna.irum@nu.edu.pk","Amna Irum").
instructor("arshad.islam@nu.edu.pk","Arshad Islam").
instructor("khadija.farooq@nu.edu.pk","Khadija Farooq").
instructor("amna.irum@nu.edu.pk","Amna Irum").
instructor("shafaq.riaz@nu.edu.pk","Shafaq Riaz").
instructor("shoaib.mehboob@nu.edu.pk","Shoaib Mehboob").
instructor("shams.farooq@nu.edu.pk","Shams Farooq").
instructor("shams.farooq@nu.edu.pk","Shams Farooq").
instructor("irfan.shah@nu.edu.pk","Irfan Shah").
instructor("irfan.shah@nu.edu.pk","Irfan Shah").
instructor("irfan.shah@nu.edu.pk","Irfan Shah").
instructor("rafia.latif@nu.edu.pk","Rafia Latif").
instructor("irfan.shah@nu.edu.pk","Irfan Shah").
instructor("zunaira.sajid@nu.edu.pk","Zunaira Sajid").
instructor("rafia.latif@nu.edu.pk","Rafia Latif").
instructor("sara.aziz@nu.edu.pk","Sara Aziz").
instructor("sumaira.azhar@nu.edu.pk","Sumaira Azhar").
instructor("sara.aziz@nu.edu.pk","Sara Aziz").
instructor("sara.aziz@nu.edu.pk","Sara Aziz").
instructor("farah.naz@nu.edu.pk","Farah Naz").
instructor("farah.naz@nu.edu.pk","Farah Naz").
instructor("farah.naz@nu.edu.pk","Farah Naz").
instructor("aqeel.shahzad@nu.edu.pk","Aqeel Shahzad").
instructor("aqeel.shahzad@nu.edu.pk","Aqeel Shahzad").
instructor("sahar.arshad@nu.edu.pk","Sahar Arshad").
instructor("sahar.arshad@nu.edu.pk","Sahar Arshad").
instructor("inji.akhtar@nu.edu.pk","Inji Akhtar").
instructor("inji.akhtar@nu.edu.pk","Inji Akhtar").
instructor("danial.hassan@nu.edu.pk","Danial Hassan").
instructor("danial.hassan@nu.edu.pk","Danial Hassan").




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


course("CS218","Data Structures (CS)").
course("CS218","Data Structures (AI)").
course("CS218","Data Structures (DS)").
course("CS218","Data Structures (CySec)").
course("DS201","Fundamentals of Data Science (DS)").
course("CY201","Networks and Cyber Security 1 (CySec)").
course("EE229","Computer Organization & Assembly Language (CS)").
course("CS211","Discrete Structures (CS)").
course("CS211","Discrete Structures (CySec)").
course("EE227","Digital Logic Design (AI)").
course("EE227","Digital Logic Design (DS)").
course("MT104","Linear Algebra (CS)").
course("MT104","Linear Algebra (DS)").
course("MT104","Linear Algebra (AI)").
course("MT104","Linear Algebra (CySec)").
course("SS118","Psychology (AI)").
course("SS118","Psychology (DS)").
course("MG220","Marketing Management").
course("MG223","Fundamentals of Management").


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



courseSection("CS218","A").
courseSection("CS218","B").
courseSection("CS218","C").
courseSection("CS218","D").
courseSection("CS218","E").
courseSection("CS218","F").
courseSection("CS218","G").
courseSection("CS218","J").
courseSection("CS218","K").
courseSection("CS218","L").
courseSection("CS218","M").
courseSection("DS201","N").
courseSection("CY201","M").
courseSection("EE229","A").
courseSection("EE229","B").
courseSection("EE229","C").
courseSection("EE229","D").
courseSection("EE229","E").
courseSection("EE229","F").
courseSection("EE229","G").
courseSection("CS211","A").
courseSection("CS211","B").
courseSection("CS211","C").
courseSection("CS211","D").
courseSection("CS211","E").
courseSection("CS211","F").
courseSection("CS211","G").
courseSection("CS211","M").
courseSection("EE227","J").
courseSection("EE227","K").
courseSection("EE227","N").
courseSection("MT104","A").
courseSection("MT104","B").
courseSection("MT104","C").
courseSection("MT104","D").
courseSection("MT104","E").
courseSection("MT104","F").
courseSection("MT104","G").
courseSection("MT104","N").
courseSection("MT104","J").
courseSection("MT104","K").
courseSection("MT104","M").
courseSection("SS118","J").
courseSection("SS118","K").
courseSection("SS118","N").
courseSection("MG220","A").
courseSection("MG220","C").
courseSection("MG220","B").
courseSection("MG220","D").
courseSection("MG223","E").
courseSection("MG220","G").
courseSection("MG220","F").
courseSection("MG220","M").



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



section("18I-0429","A").
section("18I-0641","A").
section("18I-0712","A").
section("18I-0745","A").
section("18I-1582","A").
section("19I-0406","A").
section("19I-0417","A").
section("19I-0423","A").
section("19I-0426","A").
section("19I-0434","A").
section("19I-0435","A").
section("19I-0441","A").
section("19I-0453","A").
section("19I-0455","A").
section("19I-0456","A").
section("19I-0457","A").
section("19I-0466","A").
section("19I-0468","A").
section("19I-0476","A").
section("19I-0496","A").
section("19I-0498","A").
section("19I-0500","A").
section("19I-0524","A").
section("19I-0525","A").
section("19I-0528","A").
section("19I-0531","A").
section("19I-0544","A").
section("19I-0548","A").
section("19I-0554","A").
section("19I-0576","A").
section("19I-0594","A").
section("19I-0599","A").
section("19I-0613","A").
section("19I-0633","A").
section("19I-0634","A").
section("19I-0641","A").
section("19I-0655","A").
section("19I-0683","A").
section("19I-0685","A").
section("19I-0693","A").
section("19I-0695","A").
section("19I-0699","A").
section("19I-0717","A").
section("19I-0736","A").
section("19I-0740","A").
section("19I-1911","A").
section("19I-1964","A").
section("19I-2012","A").
section("19I-2013","A").
section("19I-2048","A").
section("18I-0553","B").
section("18I-0629","B").
section("18I-1653","B").
section("19I-0416","B").
section("19I-0443","B").
section("19I-0458","B").
section("19I-0461","B").
section("19I-0493","B").
section("19I-0501","B").
section("19I-0506","B").
section("19I-0526","B").
section("19I-0529","B").
section("19I-0533","B").
section("19I-0541","B").
section("19I-0550","B").
section("19I-0553","B").
section("19I-0556","B").
section("19I-0564","B").
section("19I-0571","B").
section("19I-0574","B").
section("19I-0588","B").
section("19I-0595","B").
section("19I-0619","B").
section("19I-0627","B").
section("19I-0632","B").
section("19I-0651","B").
section("19I-0654","B").
section("19I-0662","B").
section("19I-0678","B").
section("19I-0691","B").
section("19I-0692","B").
section("19I-0701","B").
section("19I-0704","B").
section("19I-0706","B").
section("19I-0724","B").
section("19I-0729","B").
section("19I-0730","B").
section("19I-0734","B").
section("19I-0741","B").
section("19I-1742","B").
section("19I-1969","B").
section("19I-1973","B").
section("19I-1981","B").
section("19I-1983","B").
section("19I-1989","B").
section("19I-1995","B").
section("19I-2009","B").
section("19I-2015","B").
section("19I-2150","B").
section("19I-2157","B").
section("19I-2162","B").
section("19I-2167","B").
section("19I-2168","B").
section("19I-2170","B").
section("19I-2175","B").
section("17I-0292","C").
section("18I-0682","C").
section("18I-0727","C").
section("18I-0728","C").
section("19I-0401","C").
section("19I-0414","C").
section("19I-0418","C").
section("19I-0420","C").
section("19I-0437","C").
section("19I-0445","C").
section("19I-0454","C").
section("19I-0490","C").
section("19I-0495","C").
section("19I-0502","C").
section("19I-0505","C").
section("19I-0536","C").
section("19I-0555","C").
section("19I-0569","C").
section("19I-0572","C").
section("19I-0573","C").
section("19I-0578","C").
section("19I-0597","C").
section("19I-0607","C").
section("19I-0609","C").
section("19I-0610","C").
section("19I-0625","C").
section("19I-0663","C").
section("19I-0684","C").
section("19I-0690","C").
section("19I-0715","C").
section("19I-0725","C").
section("19I-0733","C").
section("19I-0749","C").
section("19I-1873","C").
section("19I-1967","C").
section("19I-1970","C").
section("19I-1975","C").
section("19I-1980","C").
section("19I-1984","C").
section("19I-1998","C").
section("19I-2024","C").
section("19I-2029","C").
section("19I-2042","C").
section("19I-2047","C").
section("19I-2156","C").
section("19I-2184","C").
section("19I-2200","C").
section("18I-0431","D").
section("19I-0413","D").
section("19I-0469","D").
section("19I-0477","D").
section("19I-0478","D").
section("19I-0479","D").
section("19I-0484","D").
section("19I-0485","D").
section("19I-0489","D").
section("19I-0507","D").
section("19I-0515","D").
section("19I-0521","D").
section("19I-0527","D").
section("19I-0534","D").
section("19I-0535","D").
section("19I-0538","D").
section("19I-0543","D").
section("19I-0557","D").
section("19I-0559","D").
section("19I-0568","D").
section("19I-0582","D").
section("19I-0600","D").
section("19I-0606","D").
section("19I-0614","D").
section("19I-0615","D").
section("19I-0616","D").
section("19I-0623","D").
section("19I-0635","D").
section("19I-0636","D").
section("19I-0650","D").
section("19I-0656","D").
section("19I-0666","D").
section("19I-0677","D").
section("19I-0700","D").
section("19I-0708","D").
section("19I-0721","D").
section("19I-0745","D").
section("19I-1982","D").
section("19I-1986","D").
section("19I-2003","D").
section("19I-2008","D").
section("19I-2011","D").
section("19I-2016","D").
section("19I-2043","D").
section("19I-2155","D").
section("18I-0729","E").
section("18I-0743","E").
section("18I-1590","E").
section("19I-0405","E").
section("19I-0410","E").
section("19I-0411","E").
section("19I-0419","E").
section("19I-0425","E").
section("19I-0438","E").
section("19I-0446","E").
section("19I-0450","E").
section("19I-0452","E").
section("19I-0471","E").
section("19I-0473","E").
section("19I-0481","E").
section("19I-0497","E").
section("19I-0508","E").
section("19I-0511","E").
section("19I-0513","E").
section("19I-0517","E").
section("19I-0551","E").
section("19I-0558","E").
section("19I-0565","E").
section("19I-0570","E").
section("19I-0577","E").
section("19I-0584","E").
section("19I-0598","E").
section("19I-0601","E").
section("19I-0605","E").
section("19I-0611","E").
section("19I-0620","E").
section("19I-0621","E").
section("19I-0626","E").
section("19I-0647","E").
section("19I-0659","E").
section("19I-0665","E").
section("19I-0681","E").
section("19I-0707","E").
section("19I-0712","E").
section("19I-0723","E").
section("19I-0726","E").
section("19I-0739","E").
section("19I-0744","E").
section("19I-2021","E").
section("19I-2036","E").
section("19I-2153","E").
section("19I-2173","E").
section("19I-2178","E").
section("19I-2179","E").
section("19I-2187","E").
section("19I-2196","E").
section("18I-0435","F").
section("18I-0558","F").
section("18I-0735","F").
section("19I-0402","F").
section("19I-0403","F").
section("19I-0404","F").
section("19I-0409","F").
section("19I-0439","F").
section("19I-0459","F").
section("19I-0465","F").
section("19I-0472","F").
section("19I-0474","F").
section("19I-0475","F").
section("19I-0491","F").
section("19I-0492","F").
section("19I-0494","F").
section("19I-0504","F").
section("19I-0510","F").
section("19I-0542","F").
section("19I-0545","F").
section("19I-0552","F").
section("19I-0560","F").
section("19I-0561","F").
section("19I-0580","F").
section("19I-0581","F").
section("19I-0602","F").
section("19I-0639","F").
section("19I-0640","F").
section("19I-0670","F").
section("19I-0698","F").
section("19I-0703","F").
section("19I-0727","F").
section("19I-0737","F").
section("19I-0738","F").
section("19I-0742","F").
section("19I-1971","F").
section("19I-1976","F").
section("19I-1977","F").
section("19I-1978","F").
section("19I-2006","F").
section("19I-2007","F").
section("19I-2014","F").
section("19I-2019","F").
section("19I-2026","F").
section("19I-2027","F").
section("19I-2030","F").
section("19I-2152","F").
section("19I-2154","F").
section("19I-2172","F").
section("19I-2177","F").
section("19I-2193","F").
section("19I-2194","F").
section("19I-2199","F").
section("17I-0121","G").
section("18I-0608","G").
section("18I-0620","G").
section("18I-1581","G").
section("18I-1588","G").
section("18I-1659","G").
section("18I-1661","G").
section("19I-0408","G").
section("19I-0412","G").
section("19I-0421","G").
section("19I-0422","G").
section("19I-0428","G").
section("19I-0431","G").
section("19I-0436","G").
section("19I-0440","G").
section("19I-0444","G").
section("19I-0447","G").
section("19I-0448","G").
section("19I-0509","G").
section("19I-0512","G").
section("19I-0514","G").
section("19I-0585","G").
section("19I-0596","G").
section("19I-0603","G").
section("19I-0612","G").
section("19I-0631","G").
section("19I-0642","G").
section("19I-0652","G").
section("19I-0653","G").
section("19I-0657","G").
section("19I-0660","G").
section("19I-0667","G").
section("19I-0674","G").
section("19I-0680","G").
section("19I-0694","G").
section("19I-0719","G").
section("19I-0728","G").
section("19I-0731","G").
section("19I-0746","G").
section("19I-1974","G").
section("19I-1987","G").
section("19I-2002","G").
section("19I-2045","G").
section("19I-2049","G").
section("19I-2176","G").
section("19I-2197","G").
section("19I-2201","G").
section("19K-0312","G").
section("19I-1650","M").
section("19I-1651","M").
section("19I-1662","M").
section("19I-1667","M").
section("19I-1671","M").
section("19I-1682","M").
section("19I-1684","M").
section("19I-1685","M").
section("19I-1686","M").
section("19I-1702","M").
section("19I-1713","M").
section("19I-1718","M").
section("19I-1720","M").
section("19I-1725","M").
section("19I-1733","M").
section("19I-1737","M").
section("19I-1738","M").
section("19I-1748","M").
section("19I-1752","M").
section("19I-1754","M").
section("19I-1755","M").
section("19I-1756","M").
section("19I-1758","M").
section("19I-1759","M").
section("19I-1760","M").
section("19I-1761","M").
section("19I-1764","M").
section("19I-1769","M").
section("19I-1782","M").
section("19I-1783","M").
section("19I-1785","M").
section("19I-1786","M").
section("19I-1788","M").
section("19I-1795","M").
section("19I-1951","M").
section("19I-1952","M").
section("19I-1954","M").
section("19I-1956","M").
section("19I-1965","M").
section("19I-1985","M").
section("19I-1990","M").
section("19I-1991","M").
section("19I-1997","M").
section("19I-2000","M").
section("19I-2032","M").
section("19I-2033","M").
section("19I-2034","M").
section("19I-2165","M").
section("19I-2166","M").
section("19I-2171","M").
section("19I-2174","M").
section("19I-2203","M").





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





teaches("adnan.tariq@nu.edu.pk","A").
teaches("hassan.mustafa@nu.edu.pk","B").
teaches("saba.rasheed@nu.edu.pk","C").
teaches("saba.rasheed@nu.edu.pk","D").
teaches("noor.ul ain@nu.edu.pk","E").
teaches("hassan.mustafa@nu.edu.pk","F").
teaches("saba.rasheed@nu.edu.pk","G").
teaches("noor.ul ain@nu.edu.pk","J").
teaches("noor.ul ain@nu.edu.pk","K").
teaches("shehreyar.rashid@nu.edu.pk","L").
teaches("shehreyar.rashid@nu.edu.pk","M").
teaches("umair.arshad@nu.edu.pk","N").
teaches("zeeshan.qaiser@nu.edu.pk","M").
teaches("rohail.gulbaz@nu.edu.pk","A").
teaches("ameen.chilwan@nu.edu.pk","B").
teaches("ameen.chilwan@nu.edu.pk","C").
teaches("farwa.batool@nu.edu.pk","D").
teaches("shams.farooq@nu.edu.pk","E").
teaches("farwa.batool@nu.edu.pk","F").
teaches("rohail.gulbaz@nu.edu.pk","G").
teaches("khadija.farooq@nu.edu.pk","A").
teaches("shafaq.riaz@nu.edu.pk","B").
teaches("amna.irum@nu.edu.pk","C").
teaches("amna.irum@nu.edu.pk","D").
teaches("arshad.islam@nu.edu.pk","E").
teaches("khadija.farooq@nu.edu.pk","F").
teaches("amna.irum@nu.edu.pk","G").
teaches("shafaq.riaz@nu.edu.pk","M").
teaches("shoaib.mehboob@nu.edu.pk","J").
teaches("shams.farooq@nu.edu.pk","K").
teaches("shams.farooq@nu.edu.pk","N").
teaches("irfan.shah@nu.edu.pk","A").
teaches("irfan.shah@nu.edu.pk","B").
teaches("irfan.shah@nu.edu.pk","C").
teaches("rafia.latif@nu.edu.pk","D").
teaches("irfan.shah@nu.edu.pk","E").
teaches("zunaira.sajid@nu.edu.pk","F").
teaches("rafia.latif@nu.edu.pk","G").
teaches("sara.aziz@nu.edu.pk","N").
teaches("sumaira.azhar@nu.edu.pk","J").
teaches("sara.aziz@nu.edu.pk","K").
teaches("sara.aziz@nu.edu.pk","M").
teaches("farah.naz@nu.edu.pk","J").
teaches("farah.naz@nu.edu.pk","K").
teaches("farah.naz@nu.edu.pk","N").
teaches("aqeel.shahzad@nu.edu.pk","A").
teaches("aqeel.shahzad@nu.edu.pk","C").
teaches("sahar.arshad@nu.edu.pk","B").
teaches("sahar.arshad@nu.edu.pk","D").
teaches("inji.akhtar@nu.edu.pk","E").
teaches("inji.akhtar@nu.edu.pk","G").
teaches("danial.hassan@nu.edu.pk","F").
teaches("danial.hassan@nu.edu.pk","M").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


capacity("C-301","44").
capacity("C-302","44").
capacity("C-303","32").
capacity("C-304","44").
capacity("C-305","44").
capacity("C-307","44").
capacity("C-308","34").
capacity("C-309","44").
capacity("C-310","44").
capacity("C-311","25").
capacity("C-401","34").
capacity("C-402","44").
capacity("C-403","44").
capacity("C-404","25").
capacity("C-405","44").
capacity("C-408","44").
capacity("C-409","44").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


examTime("1","9:00 AM","10:00 AM","CS211","C-301").
examTime("1","9:00 AM","10:00 AM","CS211","C-302").
examTime("1","9:00 AM","10:00 AM","CS211","C-303").
examTime("1","9:00 AM","10:00 AM","CS211","C-304").
examTime("1","9:00 AM","10:00 AM","CS211","C-305").
examTime("1","9:00 AM","10:00 AM","CS211","C-306").
examTime("1","9:00 AM","10:00 AM","CS211","C-307").
examTime("1","9:00 AM","10:00 AM","CS211","C-308").
examTime("1","9:00 AM","10:00 AM","CS211","C-309").
examTime("1","9:00 AM","10:00 AM","CS211","C-310").
examTime("1","9:00 AM","10:00 AM","CS211","C-311").
examTime("1","9:00 AM","10:00 AM","CS211","C-401").
examTime("1","9:00 AM","10:00 AM","CS211","C-402").
examTime("1","9:00 AM","10:00 AM","CS211","C-403").
examTime("1","9:00 AM","10:00 AM","CS211","C-404").

examTime("1","9:00 AM","10:00 AM","CS218","C-405").
examTime("1","9:00 AM","10:00 AM","CS218","C-408").
examTime("1","9:00 AM","10:00 AM","CS218","C-409").


examTime("1","10:40 AM","11:40 AM","CS461","C-405").
examTime("1","10:40 AM","11:40 AM","CS461","C-408").
examTime("1","10:40 AM","11:40 AM","CS461","C-409").

examTime("3","9:00 AM","10:00 AM","MG220","C-301").
examTime("3","9:00 AM","10:00 AM","MG220","C-302").
examTime("3","9:00 AM","10:00 AM","MG220","C-303").
examTime("3","9:00 AM","10:00 AM","MG220","C-304").
examTime("3","9:00 AM","10:00 AM","MG220","C-305").
examTime("3","9:00 AM","10:00 AM","MG220","C-306").
examTime("3","9:00 AM","10:00 AM","MG220","C-307").
examTime("3","9:00 AM","10:00 AM","MG220","C-308").
examTime("3","9:00 AM","10:00 AM","MG220","C-309").
examTime("3","9:00 AM","10:00 AM","MG220","C-310").
examTime("3","9:00 AM","10:00 AM","MG220","C-311").
examTime("3","9:00 AM","10:00 AM","MG220","C-401").

examTime("3","9:00 AM","10:00 AM","EE227","C-402").
examTime("3","9:00 AM","10:00 AM","EE227","C-403").
examTime("3","9:00 AM","10:00 AM","EE227","C-404").
examTime("3","9:00 AM","10:00 AM","EE227","C-405").
examTime("3","9:00 AM","10:00 AM","EE227","C-408").
examTime("3","9:00 AM","10:00 AM","EE227","C-409").


examTime("4","12:00 PM","13:20 PM","MT104","C-301").
examTime("4","12:00 PM","13:20 PM","MT104","C-302").
examTime("4","12:00 PM","13:20 PM","MT104","C-303").
examTime("4","12:00 PM","13:20 PM","MT104","C-304").
examTime("4","12:00 PM","13:20 PM","MT104","C-305").
examTime("4","12:00 PM","13:20 PM","MT104","C-306").
examTime("4","12:00 PM","13:20 PM","MT104","C-307").
examTime("4","12:00 PM","13:20 PM","MT104","C-308").
examTime("4","12:00 PM","13:20 PM","MT104","C-309").
examTime("4","12:00 PM","13:20 PM","MT104","C-310").
examTime("4","12:00 PM","13:20 PM","MT104","C-311").
examTime("4","12:00 PM","13:20 PM","MT104","C-401").
examTime("4","12:00 PM","13:20 PM","MT104","C-402").
examTime("4","12:00 PM","13:20 PM","MT104","C-403").
examTime("4","12:00 PM","13:20 PM","MT104","C-404").
examTime("4","12:00 PM","13:20 PM","MT104","C-405").
examTime("4","12:00 PM","13:20 PM","MT104","C-408").
examTime("4","12:00 PM","13:20 PM","MT104","C-409").

examTime("5","9:00 AM","10:00 AM","MG223","C-301").
examTime("5","9:00 AM","10:00 AM","MG223","C-302").
examTime("5","9:00 AM","10:00 AM","MG223","C-303").
examTime("5","9:00 AM","10:00 AM","MG223","C-304").
examTime("5","9:00 AM","10:00 AM","MG223","C-305").
examTime("5","9:00 AM","10:00 AM","MG223","C-306").
examTime("5","9:00 AM","10:00 AM","MG223","C-307").
examTime("5","9:00 AM","10:00 AM","MG223","C-308").
examTime("5","9:00 AM","10:00 AM","MG223","C-309").

examTime("5","12:20 PM","13:20 PM","EL229","C-301").
examTime("5","12:20 PM","13:20 PM","EL229","C-302").
examTime("5","12:20 PM","13:20 PM","EL229","C-303").
examTime("5","12:20 PM","13:20 PM","EL229","C-304").
examTime("5","12:20 PM","13:20 PM","EL229","C-305").
examTime("5","12:20 PM","13:20 PM","EL229","C-306").
examTime("5","12:20 PM","13:20 PM","EL229","C-307").
examTime("5","12:20 PM","13:20 PM","EL229","C-308").
examTime("5","12:20 PM","13:20 PM","EL229","C-309").

examTime("5","10:40 PM","11:40 PM","DS201","C-310").
examTime("5","10:40 PM","11:40 PM","DS201","C-311").















