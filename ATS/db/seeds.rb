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
		{email: 'zilin.chen@faulkner.edu', name: 'Ian Chen', role_id: System_Admin.id},
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
#	students = [
#	{first_name: 'Baxter', middle_name: 'Macdonald', last_name: 'Park', primary_email: 'ipsum@nonenimcommodo.ca', secondary_email: 'elit@egetvolutpatornare.org', cell_number: '1-659-614-6991', work_number: '1-265-965-1292', home_number: '1-989-248-7403',student_id: 701111, tracked: 'True '},
#	{first_name: 'Rowan', middle_name: 'Nichols', last_name: 'Wiggins', primary_email: 'Cras@dolor.com', secondary_email: 'pharetra.nibh@veliteget.com', cell_number: '1-574-999-6837', work_number: '1-296-643-6094', home_number: '1-906-106-7868', student_id: 701112, tracked: 'True '},
#	{first_name: 'Ainsley', middle_name: 'Cook', last_name: 'Becker', primary_email: 'Nullam@Inlorem.edu', secondary_email: 'id@dictumplacerataugue.com', cell_number: '1-799-390-1712', work_number: '1-856-342-1563', home_number: '1-615-175-9482', student_id: 701113, tracked: 'True '},
#	{first_name: 'Montana', middle_name: 'Potts', last_name: 'Obrien', primary_email: 'senectus.et@felis.ca', secondary_email: 'consectetuer.ipsum@eleifend.ca', cell_number: '1-751-634-2255', work_number: '1-850-919-6041', home_number: '1-162-121-6082', student_id: 701114, tracked: 'True '},
#	{first_name: 'Uriah', middle_name: 'Browning', last_name: 'Orr', primary_email: 'posuere.at.velit@Nullam.org', secondary_email: 'est.congue@tempuseu.net', cell_number: '1-349-959-7477', work_number: '1-565-513-9209', home_number: '1-262-873-6931', student_id: 701115, tracked: 'True '},
#	{first_name: 'Jaime', middle_name: 'Beck', last_name: 'Gilbert', primary_email: 'sociis.natoque.penatibus@magnaet.net', secondary_email: 'Suspendisse.sed.dolor@amet.org', cell_number: '1-553-671-4413', work_number: '1-395-794-7400', home_number: '1-552-853-8460', student_id: 701116, tracked: 'True '},
#	{first_name: 'Carol', middle_name: 'Cooper', last_name: 'Howard', primary_email: 'felis.adipiscing.fringilla@Curae.ca', secondary_email: 'nec@euligulaAenean.com', cell_number: '1-632-899-4188', work_number: '1-399-910-5868', home_number: '1-498-436-5659', student_id: 701117, tracked: ' False'},
#	{first_name: 'Keane', middle_name: 'Cochran', last_name: 'Tucker', primary_email: 'tincidunt.congue.turpis@sitametornare.co.uk', secondary_email: 'cursus.diam@ultriciessem.com', cell_number: '1-361-150-3980', work_number: '1-126-150-1001', home_number: '1-932-763-3460', student_id: 701118, tracked: ' False'},
#	{first_name: 'Stuart', middle_name: 'Mann', last_name: 'Franco', primary_email: 'ipsum.non.arcu@nisi.co.uk', secondary_email: 'aliquet@id.org', cell_number: '1-655-667-1231', work_number: '1-477-453-9473', home_number: '1-816-706-6935', student_id: 701119, tracked: 'True '},
#	{first_name: 'Marvin', middle_name: 'Owen', last_name: 'Watts', primary_email: 'luctus.et.ultrices@in.edu', secondary_email: 'Integer@velitjustonec.net', cell_number: '1-656-754-5245', work_number: '1-119-958-0598', home_number: '1-990-304-4559', student_id: 701120, tracked: ' False'},
#	{first_name: 'Quentin', middle_name: 'Drake', last_name: 'Guy', primary_email: 'amet.diam@orci.org', secondary_email: 'vulputate.risus.a@ametnulla.ca', cell_number: '1-978-156-0804', work_number: '1-546-610-6480', home_number: '1-899-165-2804', student_id: 701121, tracked: ' False'},
#	{first_name: 'Theodore', middle_name: 'Page', last_name: 'Schultz', primary_email: 'sed.dui.Fusce@ProinmiAliquam.ca', secondary_email: 'interdum@vitaealiquameros.org', cell_number: '1-306-303-8145', work_number: '1-288-260-8819', home_number: '1-756-178-6507', student_id: 701122, tracked: ' False'},
#	{first_name: 'Dillon', middle_name: 'Chen', last_name: 'Walsh', primary_email: 'metus@tinciduntaliquamarcu.ca', secondary_email: 'ligula@ipsumprimis.org', cell_number: '1-743-143-2807', work_number: '1-178-826-0372', home_number: '1-421-394-5357', student_id: 701123, tracked: 'True '},
#	{first_name: 'Emily', middle_name: 'Padilla', last_name: 'Becker', primary_email: 'ultricies.sem.magna@pede.net', secondary_email: 'lacus.Quisque.imperdiet@ipsumCurabiturconsequat.org', cell_number: '1-883-211-0176', work_number: '1-790-645-3301', home_number: '1-759-207-5902', student_id: 701124, tracked: 'True '},
#	{first_name: 'Francis', middle_name: 'Ramirez', last_name: 'Levine', primary_email: 'a@tincidunt.org', secondary_email: 'mus.Aenean.eget@sollicitudin.org', cell_number: '1-243-372-4449', work_number: '1-696-830-1721', home_number: '1-665-709-3858', student_id: 701125, tracked: ' False'},
#	{first_name: 'Lyle', middle_name: 'Frye', last_name: 'Juarez', primary_email: 'sociosqu@semperetlacinia.ca', secondary_email: 'Lorem@ultricies.edu', cell_number: '1-285-692-7336', work_number: '1-535-415-2441', home_number: '1-743-225-1638', student_id: 701126, tracked: 'True '},
#	{first_name: 'Christian', middle_name: 'Jacobson', last_name: 'Cruz', primary_email: 'condimentum.Donec.at@Vestibulumanteipsum.co.uk', secondary_email: 'fermentum@arcuSed.com', cell_number: '1-322-853-9008', work_number: '1-128-113-6534', home_number: '1-946-951-9056', student_id: 701127, tracked: ' False'},
#	{first_name: 'Imani', middle_name: 'Joseph', last_name: 'Walsh', primary_email: 'Nullam@dignissimtemporarcu.org', secondary_email: 'neque@anteiaculis.net', cell_number: '1-430-622-0913', work_number: '1-361-727-6997', home_number: '1-704-357-2816', student_id: 701128, tracked: 'True '},
#	{first_name: 'Frances', middle_name: 'Morris', last_name: 'Myers', primary_email: 'interdum.Nunc@risusQuisquelibero.ca', secondary_email: 'et.rutrum.eu@tellus.ca', cell_number: '1-141-762-4082', work_number: '1-985-335-5816', home_number: '1-310-188-0089', student_id: 701129, tracked: ' False'},
#	{first_name: 'Keefe', middle_name: 'Cantrell', last_name: 'Kaufman', primary_email: 'sodales.Mauris@Donecegestas.net', secondary_email: 'dis@auctorodioa.co.uk', cell_number: '1-887-860-0810', work_number: '1-306-919-5832', home_number: '1-370-695-3400', student_id: 701130, tracked: ' False'},
#	{first_name: 'Chester', middle_name: 'Figueroa', last_name: 'Goodwin', primary_email: 'pede@sapienNuncpulvinar.com', secondary_email: 'eu.nulla.at@adipiscing.ca', cell_number: '1-378-933-9779', work_number: '1-456-181-5238', home_number: '1-519-627-2956', student_id: 701131, tracked: ' False'},
#	{first_name: 'Matthew', middle_name: 'Rodriquez', last_name: 'Rivers', primary_email: 'ultrices.Vivamus.rhoncus@necleoMorbi.com', secondary_email: 'ornare@nullaInteger.co.uk', cell_number: '1-259-720-5309', work_number: '1-491-817-9839', home_number: '1-395-150-0755', student_id: 701132, tracked: ' False'},
#	{first_name: 'Brenden', middle_name: 'Moreno', last_name: 'Moore', primary_email: 'ligula.eu@eratnequenon.org', secondary_email: 'rhoncus.Proin@egestas.co.uk', cell_number: '1-640-469-8320', work_number: '1-155-750-4312', home_number: '1-743-148-5296', student_id: 701133, tracked: ' False'},
#	{first_name: 'Dai', middle_name: 'Mckay', last_name: 'Howard', primary_email: 'Maecenas@sem.org', secondary_email: 'dictum.mi@necmaurisblandit.ca', cell_number: '1-798-642-3241', work_number: '1-139-821-7996', home_number: '1-256-958-7487', student_id: 701134, tracked: ' False'}
#	];
#	Student.create(students)
#
#	student_details = [
#	{sex: 'Male', student_id: 701111},
#	{sex: 'Male', student_id: 701112},
#	{sex: 'Male', student_id: 701113},
#	{sex: 'Male', student_id: 701114},
#	{sex: 'Male', student_id: 701115},
#	{sex: 'Male', student_id: 701116},
#	{sex: 'Male', student_id: 701117},
#	{sex: 'Female', student_id: 701118},
#	{sex: 'Female', student_id: 701119},
#	{sex: 'Female', student_id: 701120},
#	{sex: 'Female', student_id: 701121},
#	{sex: 'Female', student_id: 701122},
#	{sex: 'Female', student_id: 701123},
#	{sex: 'Female', student_id: 701124},
#	{sex: 'Female', student_id: 701125},
#	{sex: 'Female', student_id: 701126},
#	{sex: 'Female', student_id: 701127},
#	{sex: 'Female', student_id: 701128},
#	{sex: 'Female', student_id: 701129},
#	{sex: 'Female', student_id: 701130},
#	{sex: 'Female', student_id: 701131},
#	{sex: 'Female', student_id: 701132},
#	{sex: 'Female', student_id: 701133},
#	{sex: 'Female', student_id: 701134}
#	];
#	StudentDetail.create(student_details)
#
#	
#	student_remedials = [
#	{remedial0301: true, remedial0302: true, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701111},
#	{remedial0301: false, remedial0302: true, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701112},
#	{remedial0301: true, remedial0302: false, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701113},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701114},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701115},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701116},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701117},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701118},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701119},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701120},
#	{remedial0301: true, remedial0302: true, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701121},
#	{remedial0301: false, remedial0302: true, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701122},
#	{remedial0301: true, remedial0302: false, remedial0305: true, remedial1335: true, remedial1300: true, student_id: 701123},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701124},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701125},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701126},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701127},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701128},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701129},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701130},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701131},
#	{remedial0301: true, remedial0302: true, remedial0305: false, remedial1335: false, remedial1300: true, student_id: 701132},
#	];
#	StudentRemedial.create(student_remedials)


    
#	addresses = [
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 46109, countryID: '', student_id: 27},
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 36109, countryID: '', student_id: 45},
#	{streetAddressOne: '', city: '', state: 'FL', zipcode: 32229, countryID: '', student_id: 49},
#	{streetAddressOne: '', city: '', state: 'TX', zipcode: 36109, countryID: '', student_id: 45},
#	{streetAddressOne: '', city: '', state: 'FL', zipcode: 36209, countryID: '', student_id: 69},
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 36109, countryID: '', student_id: 19},
#	{streetAddressOne: '', city: '', state: 'FL', zipcode: 36109, countryID: '', student_id: 6},
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 32209, countryID: '', student_id: 79},
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 36109, countryID: '', student_id: 41},
#	{streetAddressOne: '', city: '', state: 'GA', zipcode: 36109, countryID: '', student_id: 12},
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 36109, countryID: '', student_id: 11},
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 36109, countryID: '', student_id: 56},
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 36109, countryID: '', student_id: 34},
#	{streetAddressOne: '', city: '', state: 'GA', zipcode: 46109, countryID: '', student_id: 18},
#	{streetAddressOne: '', city: '', state: 'TN', zipcode: 36109, countryID: '', student_id: 75},
#	{streetAddressOne: '', city: '', state: 'TN', zipcode: 35439, countryID: '', student_id: 31},
#	{streetAddressOne: '', city: '', state: 'AL', zipcode: 36109, countryID: '', student_id: 52},
#	{streetAddressOne: '', city: '', state: 'GA', zipcode: 36109, countryID: '', student_id: 31}
#	];
#	Address.create(addresses)

=begin
	colleges = College.create([{name: 'Arts and Sciences'}, {name: 'Business'}])
	departments = Department.create([{name: 'Computer Science', college_id: 1},{name: 'Mathematics', college_id: 1}])
	degrees = Degree.create([{name: 'CSIS', degree_type_id: 2, department_id: 1},{name: 'English'},{name: 'Business Administration'}])
	user_departments = UserDepartment.create({user_id: 2, department_id: 1})
	user_college = UserCollege.create({user_id: 1, college_id: 1})
	earned_degrees = EarnedDegree.create([{student_id: 1, degree_id: 1}, {student_id: 2, degree_id: 2}, {student_id: 3, degree_id: 1}])
=end

#	earned_degrees = [
#	{degree_id: 38, student_id: 701111},
#	{degree_id: 57, student_id: 701112},
#	{degree_id: 16, student_id: 701113},
#	{degree_id: 2, student_id: 701114},
#	{degree_id: 3, student_id: 701115},
#	{degree_id: 18, student_id: 701116},
#	{degree_id: 14, student_id: 701117},
#	{degree_id: 62, student_id: 701118},
#	{degree_id: 46, student_id: 701119},
#	{degree_id: 5, student_id: 701120},
#	{degree_id: 28, student_id: 701121},
#	{degree_id: 9, student_id: 701122},
#	{degree_id: 63, student_id: 701123},
#	{degree_id: 31, student_id: 701124},
#	{degree_id: 24, student_id: 701125},
#	{degree_id: 57, student_id: 701126},
#	{degree_id: 51, student_id: 701127},
#	{degree_id: 7, student_id: 701128},
#	{degree_id: 7, student_id: 701129},
#	{degree_id: 42, student_id: 701130},
#	{degree_id: 45, student_id: 701131},
#	{degree_id: 35, student_id: 701132},
#	{degree_id: 44, student_id: 701133},
#	{degree_id: 20, student_id: 701134}
#	];
#	EarnedDegree.create(earned_degrees)

end
