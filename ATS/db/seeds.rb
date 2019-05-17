# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
roles = Role.create(
	[
		{ name: 'VPAA' , colleges_visible: false, departments_visible: false}, 
		{ name: 'College Dean', colleges_visible: false, departments_visible: false}, 
		{ name: 'Department Chair', colleges_visible: false, departments_visible: false}, 
		{ name: 'Administrative Assistant', colleges_visible: true, departments_visible: true}, 
		{ name: 'System Admin', colleges_visible: false, departments_visible: false}
	]
)

VPAA = Role.find_by_name("VPAA")
College_Dean = Role.find_by_name("College Dean")
Department_Chair = Role.find_by_name("Department Chair")
AA = Role.find_by_name("Administrative Assistants")
System_Admin = Role.find_by_name("System Admin")
users = User.create(
	[
		{email: 'ethan.widen@faulkner.edu', name: 'Ethan Widen', role_id: System_Admin.id}, 
		{email: 'shammond@faulkner.edu', name: 'Susan Hammond', role_id: System_Admin.id},
		{email: 'drampersad@faulkner.edu', name: 'Dave Rampersad', role_id: 1},
		{email: 'jarrington@faulkner.edu', name: 'Jeff Arrington', role_id: 2},
		{email: 'sgleaves@faulkner.edu', name: 'Scott Gleaves', role_id: 2},
		{email: 'lcowell@faulkner.edu', name: 'Leslie Cowell', role_id: 2},
		{email: 'dkhadanga@faulkner.edu', name: 'Dave Khadanga', role_id: 2},
		{email: 'jjewell@faulkner.edu', name: 'Jason Jewell', role_id: 3},
		{email: 'spaulk@faulkner.edu', name: 'Sharon Paulk', role_id: 3},
		{email: 'jwright.edu', name: 'Jonathan Wright', role_id: 3},
		{email: 'imkpong-ruffin@faulkner.edu', name: 'Idong Mkpong-Ruffin', role_id: 3}
	]
)

degree_types = [{name: "Bachelors of Business Administration"},
	{name: "Bachelors of Science"},
	{name: "Bachelors of Arts"},
	{name: "Bachelors of Music Education"},
	{name: "Associate of Arts"},
	{name: "Associate of Science"},
	{name: "Masters of Arts"},
	{name: "Masters of Science"},
	{name: "Minor"},
	{name: "PhD"},
	{name: "Bachelors of Criminal Justice"},
	{name: "B.S. in Business"},
	{name: "B.S. in Human Resource Management"},
	{name: "Masters of Justice Administration"},
	{name: "M.Ed."},
	{name: "MBA"},
	{name: "M.S. in Business"}
];

DegreeType.create(degree_types)

colleges = [{name: "College of Arts and Sciences"},
	{name: "College of Bible"},
	{name: "College of Business"},
	{name: "College of Education"},
];

College.create(colleges)


AS = College.find_by(name: "College of Arts and Sciences")
Bib = College.find_by(name: "College of Bible")
Bus = College.find_by(name: "College of Business")
Edu = College.find_by(name: "College of Education")
UserCollege.create(user: User.find_by(name: 'Jeff Arrington'), college: AS)
UserCollege.create(user: User.find_by(name: 'Scott Gleaves'), college: Bib)
UserCollege.create(user: User.find_by(name: 'Leslie Cowell'), college: Edu)
UserCollege.create(user: User.find_by(name: 'Dave Khadanga'), college: Bus)


departments = [{name:  "Computer Science", college_id: AS.id},
	{name:  "Criminal Justice/Legal Studies", college_id: AS.id},
	{name:  "English", college_id: AS.id},
	{name:  "Humanities", college_id: AS.id},
	{name:  "Mathematics", college_id: AS.id},
	{name:  "Music", college_id: AS.id},
	{name:  "Kinesiology and Exercise Science", college_id: AS.id},
	{name:  "Natural and Physical Sciences", college_id: AS.id},
	{name:  "Social and Behavioral Sciences", college_id: AS.id},
	{name:  "Biblical Studies", college_id: Bib.id},
	{name:  "Vocational Christian Ministry", college_id: Bib.id},
	{name:  "Business", college_id: Bus.id},
	{name:  "Education", college_id: Edu.id},
]

Department.create(departments)

BS = DegreeType.find_by_name("Bachelors of Science")
BA = DegreeType.find_by_name("Bachelors of Arts")
ASdeg = DegreeType.find_by_name("Associate of Science")
MS = DegreeType.find_by_name("Masters of Science")
MA = DegreeType.find_by_name("Masters of Arts")
PHD = DegreeType.find_by_name("PhD")
Minor = DegreeType.find_by_name("Minor")
CSdept = Department.find_by_name("Computer Science")
CJdept = Department.find_by_name("Criminal Justice/Legal Studies")
Engdept = Department.find_by_name("English")
Humdept = Department.find_by_name("Humanities")
Musdept = Department.find_by_name("Music")
Busdept = Department.find_by_name("Business")
Edudept = Department.find_by_name("Education")
Bibdept = Department.find_by_name("Biblical Studies")
Kindept = Department.find_by_name("Kinesiology and Exercise Science")
Scidept = Department.find_by_name("Natural and Physical Sciences")
Socdept = Department.find_by_name("Social and Behavioral Sciences")
Mathdept = Department.find_by(name: "Mathematics")

degrees = [{name: "Computer Science", department_id: CSdept.id, degree_type_id: BS.id},
	{name: "Computer Information Science", department_id: CSdept.id, degree_type_id: BS.id},
	{name: "Informatics", department_id: CSdept.id, degree_type_id: BS.id},
	{name: "Computer Information Science", department_id: CSdept.id, degree_type_id: ASdeg.id},
	{name: "Criminal Justice", department_id: CJdept.id, degree_type_id: BS.id},
	{name: "Legal Studies", department_id: CJdept.id, degree_type_id: BS.id},
	{name: "Bachelors of Criminal Justice", department_id: CJdept.id, degree_type_id: DegreeType.find_by_name("Bachelors of Criminal Justice").id},
	{name: "Justice Administration", department_id: CJdept.id, degree_type_id: DegreeType.find_by_name("Masters of Justice Administration").id},
	{name: "Criminal Justice/AS", department_id: CJdept.id, degree_type_id: MS.id},
	{name: "Legal Studies/AS", department_id: CJdept.id, degree_type_id: MS.id},
	{name: "Criminalistics", department_id: CJdept.id, degree_type_id: MS.id},
	{name: "English", department_id: Engdept.id, degree_type_id: BA.id},
	{name: "Humanities", department_id: Humdept.id, degree_type_id: BA.id},
	{name: "Humanities/MA", department_id: Humdept.id, degree_type_id: MA.id},
	{name: "Humanities/PhD", department_id: Humdept.id, degree_type_id: PHD.id},
	{name: "Liberal Arts", department_id: Humdept.id, degree_type_id: BA.id},
	{name: "Liberal Arts/AA", department_id: Humdept.id, degree_type_id: DegreeType.find_by_name("Associate of Arts").id},
	{name: "Liberal Arts/AS", department_id: Humdept.id, degree_type_id: ASdeg.id},
	{name: "Music (Vocal)", department_id: Musdept.id, degree_type_id: BA.id},
	{name: "Music (Instrumental)", department_id: Musdept.id, degree_type_id: BA.id},
	{name: "Music", department_id: Musdept.id, degree_type_id: Minor.id},
	{name: "Mathematics", department_id: Department.find_by_name("Mathematics").id, degree_type_id: BS.id},
	{name: "Exercise Science", department_id: Kindept.id, degree_type_id: BS.id},
	{name: "Physical Education", department_id: Kindept.id, degree_type_id: BS.id},
	{name: "Sports Management", department_id: Kindept.id, degree_type_id: BS.id},
	{name: "Biology/BS", department_id: Scidept.id, degree_type_id: BS.id},
	{name: "Biology/BA", department_id: Scidept.id, degree_type_id: BA.id},
	{name: "BioChemistry", department_id: Scidept.id, degree_type_id: BS.id},
	{name: "Science", department_id: Scidept.id, degree_type_id: MS.id},
	{name: "History", department_id: Socdept.id, degree_type_id: BS.id},
	{name: "Social Science", department_id: Socdept.id, degree_type_id: BS.id},
	{name: "History (Min)", department_id: Socdept.id, degree_type_id: Minor.id},
	{name: "Political Science (Min)", department_id: Socdept.id, degree_type_id: Minor.id},
	{name: "Sociology (Min)", department_id: Socdept.id, degree_type_id: Minor.id},
	{name: "Psychology (Min)", department_id: Socdept.id, degree_type_id: Minor.id},
	{name: "Counseling (Min)", department_id: Socdept.id, degree_type_id: Minor.id},
	{name: "General/Clinical Psychology", department_id: Socdept.id, degree_type_id: BS.id},
	{name: "Industrial/Organizational Psychology", department_id: Socdept.id, degree_type_id: BS.id},
	{name: "Forensic Psychology", department_id: Socdept.id, degree_type_id: BS.id},
	{name: "Sports Psychology", department_id: Socdept.id, degree_type_id: BS.id},
	{name: "Health and Rehabilitation Psychology", department_id: Socdept.id, degree_type_id: BS.id},
	{name: "Health and Rehabilitation Psychology (pre-OT)", department_id: Socdept.id, degree_type_id: BS.id},
	{name: "Accounting", department_id: Busdept.id, degree_type_id: BS.id},
	{name: "Business Administration", department_id: Busdept.id, degree_type_id: BS.id},
	{name: "Management", department_id: Busdept.id, degree_type_id: BS.id},
	{name: "Management Information Systems", department_id: Busdept.id, degree_type_id: BS.id},		
	{name: "Bachelors of Business Administration", department_id: Busdept.id, 
	degree_type_id: DegreeType.find_by_name("Bachelors of Business Administration").id},
	{name: "Masters of Business Administration", department_id: Busdept.id, degree_type_id: DegreeType.find_by_name("MBA").id},
	{name: "B.S. in Business", department_id: Busdept.id, degree_type_id: DegreeType.find_by_name("B.S. in Business").id},
	{name: "M.S. in Business", department_id: Busdept.id, degree_type_id: DegreeType.find_by_name("M.S. in Business").id},
	{name: "Human Resource Management", department_id: Busdept.id, degree_type_id: BS.id},
	{name: "Biblical Studies", department_id: Bibdept.id, degree_type_id: BA.id},
	{name: "Biblical Studies/MA", department_id: Bibdept.id, degree_type_id: MA.id},
	{name: "Christian Ministry", department_id: Bibdept.id, degree_type_id: MA.id},
	{name: "Christian Counseling and Family Ministry", department_id: Bibdept.id, degree_type_id: MA.id},
	{name: "Master of Philosphy", department_id: Bibdept.id, degree_type_id: MA.id},
	{name: "Bibilical Studies/PhD", department_id: Bibdept.id, degree_type_id: PHD.id},
	{name: "Collaborative Education", department_id: Edudept.id, degree_type_id: BS.id},
	{name: "Early Childhood Education", department_id: Edudept.id, degree_type_id: BS.id},
	{name: "Elementary Education", department_id: Edudept.id, degree_type_id: BS.id},
	{name: "Counseling", department_id: Edudept.id, degree_type_id: MS.id},
	{name: "School Counseling", department_id: Edudept.id, degree_type_id: MS.id},
	{name: "Teaching", department_id: Edudept.id, degree_type_id: MA.id},
	{name: "M.Ed.", department_id: Edudept.id, degree_type_id: DegreeType.find_by_name("M.Ed.").id},

]
Degree.create(degrees)

UserDepartment.create(user: User.find_by(name:'Idong Mkpong-Ruffin'), 
	department: CSdept)
UserDepartment.create(user: User.find_by(name:"Jason Jewell"), 
	department: Humdept)

###################################
#IRB Form System Form Text Seeding#
###################################
nonhuman_form_text = [
    [0 , 0, "Regular use and care of non-human animals housed by the University is the primary responsibility of the appropriate department or division.  Persons using non-human animals for regular academic instruction, companion, or display purposes must abide by all applicable laws and ethical guidelines for the use and care of animals, even when not bound specifically by NIH-OLAW guidelines and requirements.
Research conducted outside of routine academic instruction, or intended for publication or public dissemination such that it reflects or represents the University, will require approval of the IRB/IACUC before such research is conducted.  The IRB/IACUC also encourages faculty to require students to submit this application for courtesy approval and means of student instruction.  
Research projects funded by “any department, agency, or instrumentality of the United States” or otherwise bound by the current adopted Animal Welfare Act and Animal Welfare Regulations must include assurances that all applicable laws, guidelines, and conditions are met regarding the use and care of applicable animals.  The current act and information is available at: USDA-AWIC."],
    [1, 0, "Project Title"],
    [1, 1, "Requested Approval Type
(Note: Final determination is the decision of the IRB)
“Minimal Risk” is defined by the common rule (45 C.F.R. § 46.102(i)) as: “Minimal risk means that the probability and magnitude of harm or discomfort anticipated in the research are not greater in and of themselves than those ordinarily encountered in daily life or during the performance of routine physical or psychological examinations or tests.”"],
    [1, 2, "Full Board (greater than minimal risk to humans or non-human animals, use of hazardous materials, any greater than minimal risk to society or the environment)"],
    [1, 3, "Expedited Review (less than minimal risk to humans, non-human animals, and the environment)"],
    [1, 4, "Exempt Review* (no risk to humans, non-human animals, society, or the environment)"],
    [1, 5, "Courtesy Review: I/we request the IRB review the project for accuracy and validity of the methods and procedures.  (May be required for exempt projects to be published or which will otherwise publically represent the University.)"],
    [1, 6, "Explanation for justification of Expedited or Exempt Review:"],
    
    [2, 0, "Abstract / Summary *Provide an abstract or project summary outlining the basic tenets of the research project (400 words or less).  A proposal draft may be submitted as an appendix in lieu of this section.
"],
    [2, 1, "Project Purpose Provide a summary of the purpose and details of the project.  The summary should include rationale for the research, hypothesis, goals / objectives, and intended use of the study results.   This should be written in non-technical language understandable by a person unfamiliar with this area of research. 
"],
    [2, 2, "Content Areas List all applicable research content or discipline areas (e.g. biology, chemistry, psychology, education, history, journalism, etc). 
"],

    [3, 0, "Describe the non-human animal subjects to be used in detail.  Include the following in your description if applicable: Age, gender, species, other details relevant to the research."],
    [3, 1, "Describe in detail how the animals will be transported, housed and cared for before, during, and after the research.  If the research involves alterations in food, housing, care, or other areas during the conducting of the research, this should be noted here, and thoroughly described in the next question.  Include descriptions and assurances regarding the food/water, housing, temperature/environment, lighting, sanitation, exercise, socialization, handling, care in transportation, and any other applicable area regarding appropriate use and care of animals."],
    [3, 2, "If there will be any alterations in the routine and applicable use and care of animals in order to conduct research, or as an ancillary effect of conducting the research, this should be thoroughly described here.  Include assurances regarding the ethical care and use of the animals in the altered conditions, and the necessity of such alterations in order to conduct the research.  This may be further described in the risk/benefit section below. "],
    [3, 3, "Describe what protections will be used to protect humans during the course of the use and care of the animals before, during, and after the research.  This may include protections regarding sanitation, safety, and mental health / psychological conditions and protections.  Include any foreseeable potential risk to humans related to the care and use of animals in the process of the research."],
    [3, 4, "Provide justification for the use of non-human animals in the research including all potential risks and benefits to animals, researchers, and to society.  The estimated degree of risk and potential may also be included.  Justify the need to use animals as opposed to other means of conducting the research.  [Note: This question is a key component to the IRB decision making process, and must be balanced with alternative means of conducting the research if applicable.] "],
    [3, 5, "Describe any reasonable foreseen pain, discomfort, or distress that may be experienced by the animal subjects, and justify the necessity of utilizing animals in spite of such.  [Note: The common standard in determining pain, discomfort, or distress where previous research determination has not been established, is where such procedure may be expected to cause pain, discomfort, or distress in humans, it is assumed to be expected to cause such in non-human animals.]"],
    [3, 6, "Describe how the animals will be sold, donated, disposed  of, relocated, or euthanized at the conclusion of the study.  If animals will be euthanized, justify the need to do so, and how the euthenization will be conducted in accordance with all applicable laws and ethical guidelines."],
    [3, 7, "Will a licensed veterinarian be utilized to facilitate or supervise the process?  [Consult the AVMA Guidelines on Euthenasia for more information.]"],
    [3, 8, "What other information may be helpful in determining the justification of the use of non-human animals and the assurance of appropriate care."],
    
    [4, 0, "Describe what data will be collected."],
    [4, 1, "List and describe all locations and organizations where data is to be collected.  If non-human animals housed by other organizations are used, assurance of their appropriate use and care must be provided, as well as approval by the applicable organization."],
    [4, 2, "Describe the procedures of data collection to be used in the project."],
    [4, 3, "How long will the data collection take place? [Note: Longitudinal studies spanning more than a period of one year require annual continuation application and approval.]"],
    [4, 4, "Describe the instruments, equipment, or materials to be used for data collection."],
    [4, 5, "Where and how will data be stored?"],
    [4, 6, "How long will data be retained?  When and how will it be destroyed? (Note: Many discipline standards and publications require retention of data for 7-10 years after completion of project or publication to be made available for other researchers and verification purposes)."],
    [4, 7, "Who will have access to the data until destroyed?  How will it be made available for inspection by other researchers or for verification purposes?"],
    [4, 8, "Describe the methods of analysis and measures (e.g. statistical procedures, qualitative analysis method, etc.)"],
    [4, 9, "How will the results of the research be used and disseminated (e.g. publication, conference presentation, educational dissemination)? "],
    
    [5, 0, "Financial and Conflicts of Interest
List any and all sources of funding for the project, any forms of remuneration to researchers, assistants, or others involved in the research, and any potential financial or other possible conflicts of interests whether financial, personal, or otherwise.  Copies of grant approvals or other relevant documentation may be included as an appendix. "],
    [5, 1, "Qualifications of Researchers
Ethical and federal guidelines require rsesearchers to be competent in the principles of the research they conduct or oversee.  Faculty members with coursework in research ethics and methods and/or who are qualified to teach such generally meet this requirement.  Students taking or having completed such a course may meet this requirement under supervision of the qualified faculty advisor.  Researchers completing an approved training course will meet this requirement in most cases.  See some examples at:  OLAW-EDUCATION for guidance and available resources.   Please provide assurance below regarding the competency of the P.I. and other researchers to conduct research, including that with non-human animal subjects.  Researchers conducting specialized research areas may also be required to verify competency in the specialized area. "],
    [5, 2, "IRB member comments / suggestions:"],
    
    [6, 0, "By signing this application, I/we agree that all information contained herein is true and correct to the best of my/our knowledge.  All applicable information has been disclosed.  Further, assurance is given that research will conducted only within the approval guidelines and parameters, and that all ethical, moral, legal, and discipline specific expectations of conduct will be followed.  Should any relevant portion of the research approval need to be changed, a revised approval will be sought before conducting or continuing research.  
Further, it is acknowledged that IRB approval does in no way release the researchers from guilt, liability, or culpability in legally and ethically conducting research and protection of humans or animals.  Competency of all individuals involved has been verified and assured.  All data analysis and reporting will be conducted with complete and total transparency and accuracy.    

Note: The IRB has the authority to suspend or terminate approval of research that is not being conducted in accordance with the IRB's requirements, legal or ethical guidelines, or that has been associated with unexpected serious harm to humans, animals, or society.
"],
    [6, 1, "Principle Investigator / Faculty Advisor (all student research must list a Faculty Advisor as P.I.)"],
    [6, 2, "Name:"],
    [6, 3, "Position/Title:"],
    [6, 4, "E-mail:"],
    [6, 5, "Phone:"],
    [6, 6, "Department:"],
    [6, 7, "Faculty"],
    [6, 8, "Staff"],
    [6, 9, "Other"],

]

human_form_text = [
    [3, 0, "Describe the intended population and participant characteristics. "],
    [3, 1, "Will Faulkner students or employees be recruited to participate?"],
    [3, 2, "Students"],
    [3, 3, "Employees"],
    [3, 4, "Neither"],
    [3, 5, "How many participants will be sought for this project?"],
    [3, 6, "Minimum"],
    [3, 7, "Maximum"],
    [3, 8, "Will the participants include any of the following a vulnerable or at-risk population groups?"],
    [3, 9, "Children / Minors"],
    [3, 10, "Prisoners "],
    [3, 11, "Institutionalized persons"],
    [3, 12, "Students"],
    [3, 13, "Pregnant women"],
    [3, 14, "Fetuses/Neonates"],
    [3, 15, "Non-English speaking persons"],
    [3, 16, "Educationally challenged persons"],
    [3, 17, "Economically challenged persons"],
    [3, 18, "Other"],
    [3, 19, "Provide rationale for use of vulnerable populations or at-risk participants."],
    [3, 20, "Describe what protections will be in place, including those to avoid potential coercion or undue influence, as well as any debriefing procedures or services. [Note: Vulnerable populations require additional protections be explained in this area related to the additional potential risk]."],
    [3, 21, "Describe all potential risks and benefits to participants and to society.  The estimated degree of risk and potential may also be included.  [Note: This question is a key component to the IRB decision making process!] Risks may include (but are not limited to) deception, coercion, breach of confidentiality, intrapersonal or psychological conflict, invasion of privacy, economic risks, revelation of illegal activity, risk of bodily harm, etc."],
    [3, 22, "List any compensation, inducements, or incentives offered.  Provide justification for their inclusion, and assurance they will not be used as means of coercion.  (Note: Monetary or like-kind inducements greater than what would be considered a 'thank-you', or reimbursement of expenses are generally not approved)."],
    [3, 23, "Describe in detail, the procedure for selecting and recruiting participants.  Include (a) how participant selection will be equitable, (b) how groups will be assigned (if applicable), (c) how the intended participants adequately reflect the population, and (d) any participant characteristics that may result in participants being excluded from participation or final analysis. Recruiting materials (e.g. flyers, e-mail samples) may be included as an appendix."],
    [3, 24, "How will informed consent be assured? [Note: Unless specifically waived by the IRB, Informed Consent is required for all research involving human subjects and must be adequately documented.  Researchers should include copies of any Informed Consent or related forms to be used in conducting the research.]"],

    [4, 0, "Describe the procedures of data collection to be used in the project.  Include means of collecting data through the internet, publically available surveys, etc. if applicable. "],
    [4, 1, "List and describe all locations and organizations where data is to be collected, and how permission will be obtained (if applicable) to access participants.  [Note: In most cases, permission is required to access any participant groups affiliated with any type of organization (institution, school, business, government entity, etc.).  Some require IRB approval prior to gaining access to participants.  Researchers are cautioned to verify requirements and obtain necessary organizational permissions prior to any attempts to recruit participants from other organizations.  Access to participants affiliated with Faulkner may be granted by the IRB.  However, additional administrative approval may be required in some cases.]"],
    [4, 2, "Describe what data will be collected.  Note if data to be collected is archived data, publically available, or any other special characteristics.  "],
    [4, 3, "How long will the data collection take place? [Note: Longitudinal studies spanning more than a period of one year require annual continuation application and approval.]"],
    [4, 4, "Will data be collected as prospective (e.g. surveys to be completed, samples to be collected, interviews to be conducted) or retrospective (e.g. existing data, archival data, historical records), or both.  [For example: A researcher may collect data on people who lived in an area exposed to radiation during the last 10 years (retrospective), recruit a selective sample of those people to collect blood samples and a health assessment (prospective) in the same project.] "],
    [4, 5, "Will the data be collected as anonymous (no means of identifying participants), confidential (only researchers can match participants to data), or other?  Describe any coding used to identify and/or protect participants and data.  "],
    [4, 6, "Describe the instruments to be used for data collection (Include references or website links to published instruments, or copies of unpublished instruments may be included as an appendix). "],
    [4, 7, "Where and how will data be stored?  "],
    [4, 8, "How long will data be retained?  When and how will it be destroyed? (Note: Many discipline standards and publications require retention of data for 7-10 years after completion of project or publication to be made available for other researchers and verification purposes).  "],
    [4, 9, "Who will have access to the data until destroyed?  How will it be made available for inspection by other researchers or for verification purposes? "],
    [4, 10, "Describe the methods of analysis and measures (e.g. statistical procedures, qualitative analysis method, etc.)"],
    [4, 11, "How will the results of the research be used and disseminated (e.g. publication, conference presentation, educational dissemination)?"]
]

human_form_text.each do |section, subsection, text|
  Formtext.create(section: section, sub_section: subsection, human_form: true, text_value: text)
end

nonhuman_form_text.each do |section, subsection, text|
  Formtext.create(section: section, sub_section: subsection, human_form: false, text_value: text)
end
################################
#END OF IRB FORM SYSTEM SEEDING#
################################


if Rails.env.development? || Rails.env.test?
	students = [
	{first_name: 'Baxter', middle_name: 'Macdonald', last_name: 'Park', primary_email: 'ipsum@nonenimcommodo.ca', secondary_email: 'elit@egetvolutpatornare.org', cell_number: '1-659-614-6991', work_number: '1-265-965-1292', home_number: '1-989-248-7403',student_id: 701111, tracked: 'True '},
	{first_name: 'Rowan', middle_name: 'Nichols', last_name: 'Wiggins', primary_email: 'Cras@dolor.com', secondary_email: 'pharetra.nibh@veliteget.com', cell_number: '1-574-999-6837', work_number: '1-296-643-6094', home_number: '1-906-106-7868', student_id: 701112, tracked: 'True '},
	{first_name: 'Ainsley', middle_name: 'Cook', last_name: 'Becker', primary_email: 'Nullam@Inlorem.edu', secondary_email: 'id@dictumplacerataugue.com', cell_number: '1-799-390-1712', work_number: '1-856-342-1563', home_number: '1-615-175-9482', student_id: 701113, tracked: 'True '},
	{first_name: 'Montana', middle_name: 'Potts', last_name: 'Obrien', primary_email: 'senectus.et@felis.ca', secondary_email: 'consectetuer.ipsum@eleifend.ca', cell_number: '1-751-634-2255', work_number: '1-850-919-6041', home_number: '1-162-121-6082', student_id: 701114, tracked: 'True '},
	{first_name: 'Uriah', middle_name: 'Browning', last_name: 'Orr', primary_email: 'posuere.at.velit@Nullam.org', secondary_email: 'est.congue@tempuseu.net', cell_number: '1-349-959-7477', work_number: '1-565-513-9209', home_number: '1-262-873-6931', tracked: 'True '},
	{first_name: 'Jaime', middle_name: 'Beck', last_name: 'Gilbert', primary_email: 'sociis.natoque.penatibus@magnaet.net', secondary_email: 'Suspendisse.sed.dolor@amet.org', cell_number: '1-553-671-4413', work_number: '1-395-794-7400', home_number: '1-552-853-8460', tracked: 'True '},
	{first_name: 'Carol', middle_name: 'Cooper', last_name: 'Howard', primary_email: 'felis.adipiscing.fringilla@Curae.ca', secondary_email: 'nec@euligulaAenean.com', cell_number: '1-632-899-4188', work_number: '1-399-910-5868', home_number: '1-498-436-5659', tracked: ' False'},
	{first_name: 'Keane', middle_name: 'Cochran', last_name: 'Tucker', primary_email: 'tincidunt.congue.turpis@sitametornare.co.uk', secondary_email: 'cursus.diam@ultriciessem.com', cell_number: '1-361-150-3980', work_number: '1-126-150-1001', home_number: '1-932-763-3460', tracked: ' False'},
	{first_name: 'Stuart', middle_name: 'Mann', last_name: 'Franco', primary_email: 'ipsum.non.arcu@nisi.co.uk', secondary_email: 'aliquet@id.org', cell_number: '1-655-667-1231', work_number: '1-477-453-9473', home_number: '1-816-706-6935', tracked: 'True '},
	{first_name: 'Marvin', middle_name: 'Owen', last_name: 'Watts', primary_email: 'luctus.et.ultrices@in.edu', secondary_email: 'Integer@velitjustonec.net', cell_number: '1-656-754-5245', work_number: '1-119-958-0598', home_number: '1-990-304-4559', tracked: ' False'},
	{first_name: 'Quentin', middle_name: 'Drake', last_name: 'Guy', primary_email: 'amet.diam@orci.org', secondary_email: 'vulputate.risus.a@ametnulla.ca', cell_number: '1-978-156-0804', work_number: '1-546-610-6480', home_number: '1-899-165-2804', tracked: ' False'},
	{first_name: 'Theodore', middle_name: 'Page', last_name: 'Schultz', primary_email: 'sed.dui.Fusce@ProinmiAliquam.ca', secondary_email: 'interdum@vitaealiquameros.org', cell_number: '1-306-303-8145', work_number: '1-288-260-8819', home_number: '1-756-178-6507', tracked: ' False'},
	{first_name: 'Dillon', middle_name: 'Chen', last_name: 'Walsh', primary_email: 'metus@tinciduntaliquamarcu.ca', secondary_email: 'ligula@ipsumprimis.org', cell_number: '1-743-143-2807', work_number: '1-178-826-0372', home_number: '1-421-394-5357', tracked: 'True '},
	{first_name: 'Emily', middle_name: 'Padilla', last_name: 'Becker', primary_email: 'ultricies.sem.magna@pede.net', secondary_email: 'lacus.Quisque.imperdiet@ipsumCurabiturconsequat.org', cell_number: '1-883-211-0176', work_number: '1-790-645-3301', home_number: '1-759-207-5902', tracked: 'True '},
	{first_name: 'Francis', middle_name: 'Ramirez', last_name: 'Levine', primary_email: 'a@tincidunt.org', secondary_email: 'mus.Aenean.eget@sollicitudin.org', cell_number: '1-243-372-4449', work_number: '1-696-830-1721', home_number: '1-665-709-3858', tracked: ' False'},
	{first_name: 'Lyle', middle_name: 'Frye', last_name: 'Juarez', primary_email: 'sociosqu@semperetlacinia.ca', secondary_email: 'Lorem@ultricies.edu', cell_number: '1-285-692-7336', work_number: '1-535-415-2441', home_number: '1-743-225-1638', tracked: 'True '},
	{first_name: 'Christian', middle_name: 'Jacobson', last_name: 'Cruz', primary_email: 'condimentum.Donec.at@Vestibulumanteipsum.co.uk', secondary_email: 'fermentum@arcuSed.com', cell_number: '1-322-853-9008', work_number: '1-128-113-6534', home_number: '1-946-951-9056', tracked: ' False'},
	{first_name: 'Imani', middle_name: 'Joseph', last_name: 'Walsh', primary_email: 'Nullam@dignissimtemporarcu.org', secondary_email: 'neque@anteiaculis.net', cell_number: '1-430-622-0913', work_number: '1-361-727-6997', home_number: '1-704-357-2816', tracked: 'True '},
	{first_name: 'Frances', middle_name: 'Morris', last_name: 'Myers', primary_email: 'interdum.Nunc@risusQuisquelibero.ca', secondary_email: 'et.rutrum.eu@tellus.ca', cell_number: '1-141-762-4082', work_number: '1-985-335-5816', home_number: '1-310-188-0089', tracked: ' False'},
	{first_name: 'Keefe', middle_name: 'Cantrell', last_name: 'Kaufman', primary_email: 'sodales.Mauris@Donecegestas.net', secondary_email: 'dis@auctorodioa.co.uk', cell_number: '1-887-860-0810', work_number: '1-306-919-5832', home_number: '1-370-695-3400', tracked: ' False'},
	{first_name: 'Chester', middle_name: 'Figueroa', last_name: 'Goodwin', primary_email: 'pede@sapienNuncpulvinar.com', secondary_email: 'eu.nulla.at@adipiscing.ca', cell_number: '1-378-933-9779', work_number: '1-456-181-5238', home_number: '1-519-627-2956', tracked: ' False'},
	{first_name: 'Matthew', middle_name: 'Rodriquez', last_name: 'Rivers', primary_email: 'ultrices.Vivamus.rhoncus@necleoMorbi.com', secondary_email: 'ornare@nullaInteger.co.uk', cell_number: '1-259-720-5309', work_number: '1-491-817-9839', home_number: '1-395-150-0755', tracked: ' False'},
	{first_name: 'Brenden', middle_name: 'Moreno', last_name: 'Moore', primary_email: 'ligula.eu@eratnequenon.org', secondary_email: 'rhoncus.Proin@egestas.co.uk', cell_number: '1-640-469-8320', work_number: '1-155-750-4312', home_number: '1-743-148-5296', tracked: ' False'},
	{first_name: 'Dai', middle_name: 'Mckay', last_name: 'Howard', primary_email: 'Maecenas@sem.org', secondary_email: 'dictum.mi@necmaurisblandit.ca', cell_number: '1-798-642-3241', work_number: '1-139-821-7996', home_number: '1-256-958-7487', tracked: ' False'},
	{first_name: 'Tucker', middle_name: 'Conley', last_name: 'Newman', primary_email: 'Cras.eu@vitaerisusDuis.org', secondary_email: 'nec@ultrices.org', cell_number: '1-713-699-4457', work_number: '1-507-498-9090', home_number: '1-238-473-9754', tracked: 'True '},
	{first_name: 'Kameko', middle_name: 'Delgado', last_name: 'Petty', primary_email: 'risus@lacusQuisqueimperdiet.ca', secondary_email: 'justo.Praesent@Phasellus.ca', cell_number: '1-920-101-7020', work_number: '1-263-457-8270', home_number: '1-115-967-7165', tracked: ' False'},
	{first_name: 'Ezekiel', middle_name: 'Greene', last_name: 'Fox', primary_email: 'ultrices.Vivamus@liberoDonec.edu', secondary_email: 'sed@sapienAenean.com', cell_number: '1-982-353-0413', work_number: '1-458-753-3868', home_number: '1-801-679-1753', tracked: ' False'},
	{first_name: 'Brett', middle_name: 'Burt', last_name: 'Williamson', primary_email: 'senectus.et@mauriselit.com', secondary_email: 'nunc.sit@et.ca', cell_number: '1-515-252-6781', work_number: '1-466-162-2566', home_number: '1-895-786-5440', tracked: 'True '},
	{first_name: 'Len', middle_name: 'Benson', last_name: 'Hill', primary_email: 'Nullam.lobortis.quam@atarcuVestibulum.co.uk', secondary_email: 'Duis@aliquetProinvelit.com', cell_number: '1-472-471-4386', work_number: '1-351-586-9272', home_number: '1-870-595-5070', tracked: 'True '},
	{first_name: 'Jana', middle_name: 'Potts', last_name: 'Bryant', primary_email: 'placerat@nulla.co.uk', secondary_email: 'feugiat@In.com', cell_number: '1-741-564-6982', work_number: '1-804-142-1566', home_number: '1-237-192-9538', tracked: 'True '},
	{first_name: 'Alea', middle_name: 'Brock', last_name: 'Hensley', primary_email: 'leo.Cras.vehicula@Suspendissealiquet.co.uk', secondary_email: 'libero.mauris.aliquam@facilisiseget.com', cell_number: '1-324-497-0822', work_number: '1-213-476-1318', home_number: '1-653-387-8931', tracked: 'True '},
	{first_name: 'Wynne', middle_name: 'Medina', last_name: 'Long', primary_email: 'varius.ultrices@vitae.ca', secondary_email: 'Sed.pharetra@felisegetvarius.edu', cell_number: '1-356-221-9280', work_number: '1-268-681-3332', home_number: '1-493-117-7621', tracked: 'True '},
	{first_name: 'Kirk', middle_name: 'Russo', last_name: 'Farrell', primary_email: 'dictum@Curabitur.edu', secondary_email: 'scelerisque@ipsumprimis.com', cell_number: '1-945-597-0357', work_number: '1-969-918-5746', home_number: '1-591-691-8001', tracked: 'True '},
	{first_name: 'Karly', middle_name: 'Lyons', last_name: 'Alford', primary_email: 'nonummy@egestasnunc.org', secondary_email: 'semper.pretium.neque@lacusQuisqueimperdiet.ca', cell_number: '1-546-149-2567', work_number: '1-189-237-4109', home_number: '1-666-547-7561', tracked: ' False'},
	{first_name: 'Adam', middle_name: 'Allen', last_name: 'Boyle', primary_email: 'feugiat.Sed@torquentper.co.uk', secondary_email: 'risus@ullamcorpernislarcu.net', cell_number: '1-304-964-7113', work_number: '1-753-977-0636', home_number: '1-116-246-1326', tracked: ' False'},
	{first_name: 'Anne', middle_name: 'Morales', last_name: 'Waller', primary_email: 'tellus.faucibus@sitametrisus.org', secondary_email: 'Nulla@lobortisrisusIn.co.uk', cell_number: '1-178-363-0789', work_number: '1-802-732-3006', home_number: '1-590-633-8429', tracked: 'True '},
	{first_name: 'Irene', middle_name: 'Chambers', last_name: 'Hernandez', primary_email: 'turpis.Nulla@mauris.com', secondary_email: 'Phasellus.nulla.Integer@nonummy.ca', cell_number: '1-167-977-1851', work_number: '1-733-919-0629', home_number: '1-128-715-1162', tracked: ' False'},
	{first_name: 'Allen', middle_name: 'Lynn', last_name: 'Howe', primary_email: 'sed@leoCrasvehicula.ca', secondary_email: 'libero@odioapurus.edu', cell_number: '1-570-317-6730', work_number: '1-564-952-0533', home_number: '1-330-576-3792', tracked: ' False'},
	{first_name: 'Brett', middle_name: 'Kirk', last_name: 'Joyce', primary_email: 'pharetra@erat.org', secondary_email: 'aliquet.molestie@Phasellusfermentumconvallis.net', cell_number: '1-641-789-0757', work_number: '1-816-670-1497', home_number: '1-665-562-5033', tracked: 'True '},
	{first_name: 'Sonya', middle_name: 'Pace', last_name: 'Cooley', primary_email: 'Nunc@posuereenimnisl.co.uk', secondary_email: 'ipsum.Suspendisse@elit.com', cell_number: '1-939-945-9717', work_number: '1-720-973-1195', home_number: '1-257-681-4995', tracked: 'True '},
	{first_name: 'Dalton', middle_name: 'Galloway', last_name: 'Bass', primary_email: 'mauris.sit@ipsumnuncid.net', secondary_email: 'adipiscing.lobortis@magnaLoremipsum.org', cell_number: '1-651-602-5138', work_number: '1-868-116-3438', home_number: '1-618-417-8785', tracked: 'True '},
	{first_name: 'Thaddeus', middle_name: 'Roman', last_name: 'Gillespie', primary_email: 'lorem@orcilobortis.edu', secondary_email: 'quis.tristique@justo.org', cell_number: '1-509-485-0616', work_number: '1-701-365-3490', home_number: '1-632-406-9641', tracked: ' False'},
	{first_name: 'Cara', middle_name: 'Small', last_name: 'Harvey', primary_email: 'pharetra@vehicularisus.ca', secondary_email: 'Nunc@nec.edu', cell_number: '1-344-459-3865', work_number: '1-529-267-3656', home_number: '1-243-727-0571', tracked: ' False'},
	{first_name: 'Simone', middle_name: 'Clayton', last_name: 'Chan', primary_email: 'auctor.ullamcorper.nisl@nibhdolornonummy.ca', secondary_email: 'lacus.Nulla@parturientmontes.co.uk', cell_number: '1-291-757-5637', work_number: '1-784-173-3893', home_number: '1-178-991-1014', tracked: ' False'},
	{first_name: 'Ursula', middle_name: 'Wall', last_name: 'Burch', primary_email: 'interdum.Curabitur.dictum@nisi.net', secondary_email: 'sollicitudin@aliquam.org', cell_number: '1-426-542-9231', work_number: '1-958-668-5508', home_number: '1-618-701-4628', tracked: 'True '},
	{first_name: 'Lynn', middle_name: 'Nash', last_name: 'Figueroa', primary_email: 'nunc.Quisque@sollicitudinadipiscing.net', secondary_email: 'sit.amet@temporaugueac.ca', cell_number: '1-295-980-1196', work_number: '1-974-840-5324', home_number: '1-817-119-7144', tracked: ' False'},
	{first_name: 'Hayden', middle_name: 'Gardner', last_name: 'Watts', primary_email: 'non@sapienCras.com', secondary_email: 'gravida.mauris.ut@posuere.net', cell_number: '1-999-557-9608', work_number: '1-631-379-8056', home_number: '1-528-137-5331', tracked: 'True '},
	{first_name: 'Keelie', middle_name: 'Maddox', last_name: 'Calderon', primary_email: 'nonummy.Fusce@vitae.net', secondary_email: 'commodo.tincidunt@ipsum.com', cell_number: '1-798-143-3663', work_number: '1-960-775-6672', home_number: '1-784-169-0517', tracked: 'True '},
	{first_name: 'Quamar', middle_name: 'Pacheco', last_name: 'Nelson', primary_email: 'nisl.elementum.purus@posuerevulputate.com', secondary_email: 'consectetuer.adipiscing@mollisInteger.edu', cell_number: '1-209-773-3440', work_number: '1-885-297-1817', home_number: '1-976-395-6997', tracked: ' False'},
	{first_name: 'Mallory', middle_name: 'Marsh', last_name: 'Gordon', primary_email: 'lacus.Ut@mollisnec.co.uk', secondary_email: 'sollicitudin.orci.sem@Morbisitamet.co.uk', cell_number: '1-437-975-3885', work_number: '1-112-806-9204', home_number: '1-526-565-5988', tracked: ' False'},
	{first_name: 'Cecilia', middle_name: 'Schwartz', last_name: 'Moreno', primary_email: 'Proin@placerat.com', secondary_email: 'purus@commodoatlibero.net', cell_number: '1-642-299-9168', work_number: '1-826-691-3785', home_number: '1-159-287-6268', tracked: ' False'},
	{first_name: 'Camille', middle_name: 'Morgan', last_name: 'Mendez', primary_email: 'adipiscing.fringilla.porttitor@sagittis.ca', secondary_email: 'elit.pellentesque@amet.org', cell_number: '1-118-480-8089', work_number: '1-222-286-2374', home_number: '1-770-210-2547', tracked: ' False'},
	{first_name: 'Bert', middle_name: 'Monroe', last_name: 'Campbell', primary_email: 'senectus.et.netus@musAenean.ca', secondary_email: 'cursus.purus@lobortis.net', cell_number: '1-915-364-3513', work_number: '1-360-463-3370', home_number: '1-627-900-5665', tracked: ' False'},
	{first_name: 'Felicia', middle_name: 'Hardin', last_name: 'Clay', primary_email: 'imperdiet.ornare.In@ante.net', secondary_email: 'molestie.pharetra@tristiquepharetraQuisque.com', cell_number: '1-215-546-4998', work_number: '1-642-885-1827', home_number: '1-431-287-9966', tracked: 'True '},
	{first_name: 'Ramona', middle_name: 'Juarez', last_name: 'Michael', primary_email: 'dui.nec.urna@ut.org', secondary_email: 'tempus@eu.edu', cell_number: '1-329-196-8157', work_number: '1-942-752-8759', home_number: '1-267-658-8265', tracked: ' False'},
	{first_name: 'Forrest', middle_name: 'Miller', last_name: 'Tucker', primary_email: 'neque.sed@euenim.net', secondary_email: 'magna.et@aliquetProinvelit.co.uk', cell_number: '1-421-133-8111', work_number: '1-278-806-0717', home_number: '1-686-607-9989', tracked: 'True '},
	{first_name: 'Jocelyn', middle_name: 'Briggs', last_name: 'Torres', primary_email: 'non@porttitorerosnec.edu', secondary_email: 'ac@vulputatemauris.ca', cell_number: '1-316-342-0562', work_number: '1-350-519-5453', home_number: '1-346-897-4941', tracked: ' False'},
	{first_name: 'Kirsten', middle_name: 'Huff', last_name: 'Schneider', primary_email: 'per@nec.org', secondary_email: 'feugiat@nisi.ca', cell_number: '1-446-611-6720', work_number: '1-891-176-8820', home_number: '1-357-135-0581', tracked: 'True '},
	{first_name: 'Xena', middle_name: 'Blackwell', last_name: 'Bennett', primary_email: 'nonummy@tellusSuspendisse.net', secondary_email: 'aliquet.sem.ut@adipiscingfringilla.ca', cell_number: '1-221-649-1599', work_number: '1-133-584-6561', home_number: '1-261-663-8031', tracked: ' False'},
	{first_name: 'Jael', middle_name: 'Knowles', last_name: 'Barnes', primary_email: 'neque.non@dui.com', secondary_email: 'in.molestie@hendreritneque.edu', cell_number: '1-725-853-2352', work_number: '1-376-656-2840', home_number: '1-607-264-6892', tracked: 'True '},
	{first_name: 'Thaddeus', middle_name: 'Baldwin', last_name: 'Boyer', primary_email: 'quam@Suspendisse.edu', secondary_email: 'nibh.Phasellus.nulla@idrisusquis.org', cell_number: '1-828-921-5681', work_number: '1-420-285-2520', home_number: '1-795-605-2327', tracked: 'True '},
	{first_name: 'Galvin', middle_name: 'Velasquez', last_name: 'Freeman', primary_email: 'imperdiet.ullamcorper.Duis@viverra.net', secondary_email: 'ultricies.adipiscing@Proinsed.co.uk', cell_number: '1-254-535-5053', work_number: '1-170-435-4907', home_number: '1-389-602-4846', tracked: ' False'},
	{first_name: 'Boris', middle_name: 'Sharp', last_name: 'Hall', primary_email: 'vitae@sociosqu.com', secondary_email: 'metus.Vivamus.euismod@et.ca', cell_number: '1-313-368-0693', work_number: '1-415-102-9031', home_number: '1-557-892-8110', tracked: ' False'},
	{first_name: 'Charlotte', middle_name: 'Garrison', last_name: 'Macdonald', primary_email: 'nec@eleifendvitaeerat.edu', secondary_email: 'Aenean.euismod.mauris@aduiCras.net', cell_number: '1-505-495-5163', work_number: '1-579-209-3765', home_number: '1-707-722-5786', tracked: ' False'},
	{first_name: 'Boris', middle_name: 'Marsh', last_name: 'Rodgers', primary_email: 'ullamcorper.viverra@cursuspurus.co.uk', secondary_email: 'dignissim.magna.a@magnanec.ca', cell_number: '1-920-285-2180', work_number: '1-688-852-9002', home_number: '1-895-656-2472', tracked: ' False'},
	{first_name: 'Kiayada', middle_name: 'Rocha', last_name: 'Hooper', primary_email: 'orci.consectetuer@semperpretium.net', secondary_email: 'lacinia@necanteMaecenas.ca', cell_number: '1-262-717-0558', work_number: '1-898-838-1888', home_number: '1-804-900-2691', tracked: 'True '},
	{first_name: 'Abel', middle_name: 'Webster', last_name: 'Stevens', primary_email: 'mi@ametnullaDonec.net', secondary_email: 'Donec.consectetuer@Nullamut.com', cell_number: '1-536-107-7598', work_number: '1-830-613-1602', home_number: '1-434-135-0492', tracked: 'True '},
	{first_name: 'Kathleen', middle_name: 'Puckett', last_name: 'Perez', primary_email: 'ante@lectusjustoeu.net', secondary_email: 'id.enim@vitae.ca', cell_number: '1-309-971-4248', work_number: '1-270-342-2070', home_number: '1-883-316-0301', tracked: ' False'},
	{first_name: 'Audra', middle_name: 'Wolf', last_name: 'Pena', primary_email: 'lobortis@Morbi.com', secondary_email: 'ipsum.primis@lobortisnisi.edu', cell_number: '1-732-568-4973', work_number: '1-524-322-7807', home_number: '1-376-734-9005', tracked: 'True '},
	{first_name: 'Angelica', middle_name: 'Price', last_name: 'Morrow', primary_email: 'Vivamus.rhoncus.Donec@vitae.net', secondary_email: 'Proin.eget@Duis.ca', cell_number: '1-962-873-2353', work_number: '1-909-975-9591', home_number: '1-580-344-0503', tracked: ' False'},
	{first_name: 'Cullen', middle_name: 'Molina', last_name: 'Talley', primary_email: 'hymenaeos.Mauris.ut@ligulaNullamenim.co.uk', secondary_email: 'neque.venenatis@tinciduntDonecvitae.org', cell_number: '1-799-679-7772', work_number: '1-976-748-7765', home_number: '1-120-968-3197', tracked: 'True '},
	{first_name: 'Wyatt', middle_name: 'Carson', last_name: 'Monroe', primary_email: 'sapien@neque.ca', secondary_email: 'felis.adipiscing.fringilla@ante.net', cell_number: '1-674-859-9993', work_number: '1-952-734-2235', home_number: '1-473-327-9306', tracked: 'True '},
	{first_name: 'Jessica', middle_name: 'Jimenez', last_name: 'Boyle', primary_email: 'risus.Donec.egestas@et.net', secondary_email: 'lacus.Cras.interdum@maurissagittis.edu', cell_number: '1-724-666-1512', work_number: '1-906-497-4693', home_number: '1-345-819-5922', tracked: ' False'},
	{first_name: 'Patrick', middle_name: 'Mcgowan', last_name: 'Hodges', primary_email: 'laoreet.ipsum@congueelit.com', secondary_email: 'Phasellus@SuspendisseeleifendCras.co.uk', cell_number: '1-660-484-4024', work_number: '1-329-472-0443', home_number: '1-872-677-9892', tracked: 'True '},
	{first_name: 'Sierra', middle_name: 'Grimes', last_name: 'Brown', primary_email: 'Nullam.suscipit@diam.org', secondary_email: 'Donec.egestas@maurisaliquameu.net', cell_number: '1-845-364-6565', work_number: '1-652-347-4561', home_number: '1-607-742-6287', tracked: ' False'},
	{first_name: 'Hector', middle_name: 'Levy', last_name: 'Lane', primary_email: 'a.sollicitudin@sapien.co.uk', secondary_email: 'eu.nulla.at@mauris.org', cell_number: '1-120-420-1780', work_number: '1-224-606-0331', home_number: '1-394-515-9563', tracked: ' False'},
	{first_name: 'Audrey', middle_name: 'Keller', last_name: 'Walker', primary_email: 'elit@cursus.com', secondary_email: 'conubia.nostra.per@enimcommodohendrerit.org', cell_number: '1-637-986-5547', work_number: '1-402-439-2434', home_number: '1-173-823-4820', tracked: ' False'},
	{first_name: 'Adara', middle_name: 'Silva', last_name: 'Melendez', primary_email: 'dolor.sit.amet@aliquetdiamSed.com', secondary_email: 'nec.tellus@Pellentesqueultricies.edu', cell_number: '1-730-325-7879', work_number: '1-560-961-8705', home_number: '1-632-358-1335', tracked: ' False'},
	{first_name: 'Ferris', middle_name: 'King', last_name: 'Sparks', primary_email: 'velit.eu.sem@Inscelerisque.net', secondary_email: 'ipsum.Suspendisse.sagittis@commodoauctor.com', cell_number: '1-786-308-0011', work_number: '1-842-199-2597', home_number: '1-136-990-8517', tracked: ' False'},
	{first_name: 'Xerxes', middle_name: 'Morrow', last_name: 'Hayes', primary_email: 'mollis.lectus.pede@morbitristique.com', secondary_email: 'Cras@erat.org', cell_number: '1-383-998-5927', work_number: '1-457-444-1472', home_number: '1-465-259-5768', tracked: ' False'},
	{first_name: 'Grant', middle_name: 'Bullock', last_name: 'Bishop', primary_email: 'Duis.at.lacus@ipsumleo.edu', secondary_email: 'Vivamus.rhoncus.Donec@pedeSuspendisse.co.uk', cell_number: '1-593-387-4891', work_number: '1-637-420-1232', home_number: '1-850-141-0974', tracked: ' False'},
	{first_name: 'Kitra', middle_name: 'Grant', last_name: 'Burns', primary_email: 'Duis@Fusce.com', secondary_email: 'arcu@molestie.ca', cell_number: '1-667-181-1492', work_number: '1-118-225-7566', home_number: '1-818-456-3658', tracked: 'True '},
	{first_name: 'Kristen', middle_name: 'Gonzales', last_name: 'Kane', primary_email: 'enim.diam.vel@Donec.org', secondary_email: 'ligula.Nullam.feugiat@etnuncQuisque.org', cell_number: '1-509-579-7997', work_number: '1-878-971-1455', home_number: '1-721-134-2197', tracked: ' False'},
	{first_name: 'Hollee', middle_name: 'Travis', last_name: 'Wong', primary_email: 'Integer.in@gravida.co.uk', secondary_email: 'nec@disparturientmontes.co.uk', cell_number: '1-636-337-3760', work_number: '1-277-815-2385', home_number: '1-735-470-4745', tracked: ' False'},
	{first_name: 'Dale', middle_name: 'Delacruz', last_name: 'Young', primary_email: 'eu@Aliquamadipiscing.org', secondary_email: 'sit.amet.diam@Fusce.co.uk', cell_number: '1-346-714-0177', work_number: '1-445-808-0602', home_number: '1-242-765-4522', tracked: ' False'},
	{first_name: 'Carol', middle_name: 'Nixon', last_name: 'Kidd', primary_email: 'arcu@fermentumfermentumarcu.edu', secondary_email: 'tellus@penatibuset.net', cell_number: '1-290-558-0494', work_number: '1-880-116-2022', home_number: '1-913-147-0003', tracked: 'True '},
	{first_name: 'Griffin', middle_name: 'Miranda', last_name: 'Rasmussen', primary_email: 'Quisque@adipiscing.org', secondary_email: 'Suspendisse.aliquet.molestie@feugiat.ca', cell_number: '1-231-507-3663', work_number: '1-825-284-5322', home_number: '1-513-528-7092', tracked: ' False'},
	{first_name: 'Gareth', middle_name: 'Dickson', last_name: 'Wilkerson', primary_email: 'facilisis.non.bibendum@adipiscing.com', secondary_email: 'massa.Integer@non.net', cell_number: '1-924-908-8840', work_number: '1-174-560-4536', home_number: '1-371-602-3802', tracked: ' False'},
	{first_name: 'Nasim', middle_name: 'Bentley', last_name: 'Padilla', primary_email: 'nisl@Quisqueimperdieterat.edu', secondary_email: 'et.magnis@ametconsectetuer.ca', cell_number: '1-194-155-6761', work_number: '1-409-352-7213', home_number: '1-550-555-1599', tracked: ' False'},
	{first_name: 'Xaviera', middle_name: 'York', last_name: 'Mckee', primary_email: 'ante.bibendum@elitelit.edu', secondary_email: 'diam@massaSuspendisseeleifend.org', cell_number: '1-212-393-4690', work_number: '1-794-318-7209', home_number: '1-714-493-2063', tracked: 'True '},
	{first_name: 'Meghan', middle_name: 'Peterson', last_name: 'Wilkerson', primary_email: 'parturient.montes@ultricesmauris.org', secondary_email: 'Nulla@ornareliberoat.edu', cell_number: '1-335-526-8780', work_number: '1-702-793-1004', home_number: '1-114-988-1379', tracked: ' False'},
	{first_name: 'Geoffrey', middle_name: 'Mays', last_name: 'Benton', primary_email: 'faucibus@lobortis.org', secondary_email: 'arcu@venenatisa.ca', cell_number: '1-966-454-7643', work_number: '1-119-874-9328', home_number: '1-799-260-1003', tracked: 'True '},
	{first_name: 'Erasmus', middle_name: 'Potts', last_name: 'Gross', primary_email: 'amet.ornare@tristique.edu', secondary_email: 'purus@Nam.com', cell_number: '1-998-236-9754', work_number: '1-457-727-9685', home_number: '1-291-227-6388', tracked: ' False'},
	{first_name: 'Jonah', middle_name: 'Hurley', last_name: 'Jacobson', primary_email: 'lorem.vehicula@sem.ca', secondary_email: 'enim.Sed.nulla@infaucibus.co.uk', cell_number: '1-804-655-2276', work_number: '1-135-474-7913', home_number: '1-768-186-6170', tracked: 'True '},
	{first_name: 'Elvis', middle_name: 'Huber', last_name: 'Middleton', primary_email: 'consequat.nec.mollis@nasceturridiculus.ca', secondary_email: 'nunc.est.mollis@tellusfaucibus.ca', cell_number: '1-517-990-9660', work_number: '1-479-909-1463', home_number: '1-516-833-4441', tracked: ' False'},
	{first_name: 'Hammett', middle_name: 'Neal', last_name: 'Webb', primary_email: 'Integer@ullamcorpervelit.ca', secondary_email: 'Integer@nuncsed.org', cell_number: '1-974-518-8549', work_number: '1-740-941-0564', home_number: '1-820-780-3899', tracked: ' False'},
	{first_name: 'Drew', middle_name: 'Vazquez', last_name: 'Sullivan', primary_email: 'leo@a.ca', secondary_email: 'ligula.tortor.dictum@commodoipsum.com', cell_number: '1-480-594-8913', work_number: '1-256-745-3519', home_number: '1-846-576-6790', tracked: ' False'},
	{first_name: 'Preston', middle_name: 'Singleton', last_name: 'Finley', primary_email: 'pede@asollicitudin.com', secondary_email: 'Aliquam.erat@loremutaliquam.net', cell_number: '1-772-659-0980', work_number: '1-277-108-3188', home_number: '1-692-747-5376', tracked: ' False'},
	{first_name: 'Ali', middle_name: 'Cross', last_name: 'Rush', primary_email: 'aliquet.odio@mi.net', secondary_email: 'Integer@mollisPhasellus.net', cell_number: '1-545-679-8895', work_number: '1-352-453-6212', home_number: '1-202-222-3242', tracked: ' False'},
	{first_name: 'Halla', middle_name: 'Booth', last_name: 'Mcintosh', primary_email: 'faucibus@infaucibus.edu', secondary_email: 'pede.Suspendisse.dui@orci.co.uk', cell_number: '1-301-553-5378', work_number: '1-944-533-1557', home_number: '1-618-639-9246', tracked: ' False'}
	];
	Student.create(students)
<<<<<<< HEAD
	
	student_remedials = [
	{remedial0301: true, remedial0302: true, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701111},
	{remedial0301: false, remedial0302: true, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701112},
	{remedial0301: true, remedial0302: false, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701113},
	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701114}
	];
	StudentRemedial.create(student_remedials)


    
	addresses = [
	{street_address: '', city: '', state: 'AL', zip: 46109, country: '', student_id: 27},
	{street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 45},
	{street_address: '', city: '', state: 'FL', zip: 32229, country: '', student_id: 49},
	{street_address: '', city: '', state: 'TX', zip: 36109, country: '', student_id: 45},
	{street_address: '', city: '', state: 'FL', zip: 36209, country: '', student_id: 69},
	{street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 19},
	{street_address: '', city: '', state: 'FL', zip: 36109, country: '', student_id: 6},
	{street_address: '', city: '', state: 'AL', zip: 32209, country: '', student_id: 79},
	{street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 41},
	{street_address: '', city: '', state: 'GA', zip: 36109, country: '', student_id: 12},
	{street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 11},
	{street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 56},
	{street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 34},
	{street_address: '', city: '', state: 'GA', zip: 46109, country: '', student_id: 18},
	{street_address: '', city: '', state: 'TN', zip: 36109, country: '', student_id: 75},
	{street_address: '', city: '', state: 'TN', zip: 35439, country: '', student_id: 31},
	{street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 52},
	{street_address: '', city: '', state: 'GA', zip: 36109, country: '', student_id: 31}
	];
	Address.create(addresses)
    addresses = [
    {street_address: '', city: '', state: 'AL', zip: 46109, country: '', student_id: 27},
    {street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 45},
    {street_address: '', city: '', state: 'FL', zip: 32229, country: '', student_id: 49},
    {street_address: '', city: '', state: 'TX', zip: 36109, country: '', student_id: 45},
    {street_address: '', city: '', state: 'FL', zip: 36209, country: '', student_id: 69},
    {street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 19},
    {street_address: '', city: '', state: 'FL', zip: 36109, country: '', student_id: 6},
    {street_address: '', city: '', state: 'AL', zip: 32209, country: '', student_id: 79},
    {street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 41},
    {street_address: '', city: '', state: 'GA', zip: 36109, country: '', student_id: 12},
    {street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 11},
    {street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 56},
    {street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 34},
    {street_address: '', city: '', state: 'GA', zip: 46109, country: '', student_id: 18},
    {street_address: '', city: '', state: 'TN', zip: 36109, country: '', student_id: 75},
    {street_address: '', city: '', state: 'TN', zip: 35439, country: '', student_id: 31},
    {street_address: '', city: '', state: 'AL', zip: 36109, country: '', student_id: 52},
    {street_address: '', city: '', state: 'GA', zip: 36109, country: '', student_id: 31}
    ];
    Address.create(addresses)

=begin
	colleges = College.create([{name: 'Arts and Sciences'}, {name: 'Business'}])
	departments = Department.create([{name: 'Computer Science', college_id: 1},{name: 'Mathematics', college_id: 1}])
	degrees = Degree.create([{name: 'CSIS', degree_type_id: 2, department_id: 1},{name: 'English'},{name: 'Business Administration'}])
	user_departments = UserDepartment.create({user_id: 2, department_id: 1})
	user_college = UserCollege.create({user_id: 1, college_id: 1})
	earned_degrees = EarnedDegree.create([{student_id: 1, degree_id: 1}, {student_id: 2, degree_id: 2}, {student_id: 3, degree_id: 1}])
=end

	earned_degrees = [
	{degree_id: 38, student_id: 27},
	{degree_id: 57, student_id: 45},
	{degree_id: 16, student_id: 49},
	{degree_id: 2, student_id: 45},
	{degree_id: 3, student_id: 69},
	{degree_id: 18, student_id: 19},
	{degree_id: 14, student_id: 6},
	{degree_id: 62, student_id: 79},
	{degree_id: 46, student_id: 41},
	{degree_id: 5, student_id: 12},
	{degree_id: 28, student_id: 11},
	{degree_id: 9, student_id: 56},
	{degree_id: 63, student_id: 34},
	{degree_id: 31, student_id: 18},
	{degree_id: 24, student_id: 75},
	{degree_id: 57, student_id: 31},
	{degree_id: 51, student_id: 52},
	{degree_id: 7, student_id: 31},
	{degree_id: 7, student_id: 23},
	{degree_id: 42, student_id: 48},
	{degree_id: 45, student_id: 17},
	{degree_id: 35, student_id: 59},
	{degree_id: 44, student_id: 20},
	{degree_id: 20, student_id: 3},
	{degree_id: 3, student_id: 63},
	{degree_id: 45, student_id: 62},
	{degree_id: 11, student_id: 29},
	{degree_id: 13, student_id: 13},
	{degree_id: 33, student_id: 68},
	{degree_id: 46, student_id: 51},
	{degree_id: 4, student_id: 36},
	{degree_id: 39, student_id: 78},
	{degree_id: 6, student_id: 83},
	{degree_id: 4, student_id: 21},
	{degree_id: 45, student_id: 23},
	{degree_id: 14, student_id: 3},
	{degree_id: 31, student_id: 96},
	{degree_id: 21, student_id: 49},
	{degree_id: 52, student_id: 74},
	{degree_id: 61, student_id: 68},
	{degree_id: 1, student_id: 83},
	{degree_id: 11, student_id: 41},
	{degree_id: 63, student_id: 72},
	{degree_id: 17, student_id: 40},
	{degree_id: 27, student_id: 51},
	{degree_id: 49, student_id: 48},
	{degree_id: 18, student_id: 46},
	{degree_id: 51, student_id: 8},
	{degree_id: 13, student_id: 3},
	{degree_id: 42, student_id: 66},
	{degree_id: 11, student_id: 1},
	{degree_id: 14, student_id: 95},
	{degree_id: 43, student_id: 100},
	{degree_id: 41, student_id: 57},
	{degree_id: 46, student_id: 47},
	{degree_id: 42, student_id: 57},
	{degree_id: 50, student_id: 17},
	{degree_id: 62, student_id: 26},
	{degree_id: 40, student_id: 41},
	{degree_id: 5, student_id: 97},
	{degree_id: 63, student_id: 24},
	{degree_id: 35, student_id: 77},
	{degree_id: 7, student_id: 32},
	{degree_id: 2, student_id: 93},
	{degree_id: 9, student_id: 91},
	{degree_id: 31, student_id: 90},
	{degree_id: 32, student_id: 35},
	{degree_id: 27, student_id: 53},
	{degree_id: 12, student_id: 3},
	{degree_id: 17, student_id: 62},
	{degree_id: 57, student_id: 70},
	{degree_id: 29, student_id: 77},
	{degree_id: 52, student_id: 1},
	{degree_id: 12, student_id: 18},
	{degree_id: 55, student_id: 97},
	{degree_id: 5, student_id: 24},
	{degree_id: 16, student_id: 19},
	{degree_id: 52, student_id: 23},
	{degree_id: 50, student_id: 48},
	{degree_id: 40, student_id: 42},
	{degree_id: 31, student_id: 84},
	{degree_id: 35, student_id: 56},
	{degree_id: 5, student_id: 46},
	{degree_id: 23, student_id: 13},
	{degree_id: 51, student_id: 50},
	{degree_id: 34, student_id: 75},
	{degree_id: 21, student_id: 100},
	{degree_id: 62, student_id: 75},
	{degree_id: 1, student_id: 63},
	{degree_id: 61, student_id: 58},
	{degree_id: 5, student_id: 34},
	{degree_id: 22, student_id: 53},
	{degree_id: 19, student_id: 82},
	{degree_id: 62, student_id: 61},
	{degree_id: 5, student_id: 60},
	{degree_id: 45, student_id: 2},
	{degree_id: 8, student_id: 83},
	{degree_id: 50, student_id: 44},
	{degree_id: 59, student_id: 90},
	{degree_id: 19, student_id: 91}
	];
	EarnedDegree.create(earned_degrees)

end
