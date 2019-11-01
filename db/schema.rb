# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_08_015436) do

  create_table "addresses", force: :cascade do |t|
    t.string "streetAddressOne"
    t.string "streetAddressTwo"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "countryID"
    t.string "originCountryID"
    t.string "originState"
    t.string "originCountyID"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_addresses_on_student_id"
  end

  create_table "athletes", force: :cascade do |t|
    t.boolean "baseball"
    t.boolean "basketball"
    t.boolean "cheerleader"
    t.boolean "football"
    t.boolean "golf"
    t.boolean "soccer"
    t.boolean "softball"
    t.boolean "volleyball"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_athletes_on_student_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.string "current"
    t.string "effective"
    t.string "firstYear"
    t.string "firstTermUndergrad"
    t.string "attendanceUndergrad"
    t.boolean "termOfficalUndergrad"
    t.string "firstTermGraduate"
    t.string "attendanceGraduate"
    t.boolean "termOfficialGraduate"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degree_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.integer "department_id"
    t.integer "degree_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_type_id"], name: "index_degrees_on_degree_type_id"
    t.index ["department_id"], name: "index_degrees_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "earned_degrees", force: :cascade do |t|
    t.string "season"
    t.string "year_graduated"
    t.string "type"
    t.integer "student_id"
    t.integer "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_earned_degrees_on_degree_id"
    t.index ["student_id"], name: "index_earned_degrees_on_student_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "students_id"
    t.string "contact_name"
    t.index ["students_id"], name: "index_employers_on_students_id"
  end

  create_table "employments", force: :cascade do |t|
    t.string "job_title"
    t.boolean "current_job"
    t.boolean "in_field"
    t.date "start_date"
    t.date "end_date"
    t.integer "employer_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_employments_on_employer_id"
    t.index ["student_id"], name: "index_employments_on_student_id"
  end

  create_table "forms", force: :cascade do |t|
    t.boolean "human"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formtexts", force: :cascade do |t|
    t.integer "section"
    t.integer "sub_section"
    t.boolean "human_form"
    t.text "text_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grad_schools", force: :cascade do |t|
    t.boolean "applied"
    t.boolean "accepted"
    t.string "status"
    t.string "higher_degree_type"
    t.string "higher_degree_name"
    t.integer "student_id"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "graduated"
    t.index ["student_id"], name: "index_grad_schools_on_student_id"
    t.index ["university_id"], name: "index_grad_schools_on_university_id"
  end

  create_table "help_requests", force: :cascade do |t|
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "high_schools", force: :cascade do |t|
    t.string "ceebHS"
    t.string "nameHS"
    t.string "typeHS"
    t.string "gpaHS"
    t.integer "percentageHS", limit: 2
    t.integer "rankHS", limit: 2
    t.integer "sizeHS", limit: 2
    t.string "gradYearHS"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_high_schools_on_student_id"
  end

  create_table "majors", force: :cascade do |t|
    t.string "majorType"
    t.string "majorFullName"
    t.string "advisor"
    t.string "majorShortName"
    t.string "assocMajor"
    t.string "undergradMajorOne"
    t.string "undergradMajorTwo"
    t.string "undergradMajorThree"
    t.string "undergradMinorOne"
    t.string "undergradMinorTwo"
    t.string "graduateMajor"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_majors_on_student_id"
  end

  create_table "researchers", force: :cascade do |t|
    t.text "name"
    t.text "position"
    t.text "email"
    t.text "phone"
    t.text "department"
    t.text "researcher_type"
    t.text "investigator_type"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_researchers_on_form_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.boolean "colleges_visible"
    t.boolean "departments_visible"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "section1s", force: :cascade do |t|
    t.string "project_name"
    t.string "approval_type"
    t.text "expedited_or_exempt_review_just"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_section1s_on_form_id"
  end

  create_table "section2s", force: :cascade do |t|
    t.text "abstract_summary"
    t.text "purpose"
    t.text "content_area"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_section2s_on_form_id"
  end

  create_table "section3animals", force: :cascade do |t|
    t.string "describe_animals"
    t.string "housing_and_transport"
    t.string "ethical_care_in_altered_conditions"
    t.string "protect_humans"
    t.string "justification_for_animals"
    t.string "foreseen_pain"
    t.string "animals_after_study"
    t.string "veterinarian_present"
    t.string "other_helpful_info"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_section3animals_on_form_id"
  end

  create_table "section3s", force: :cascade do |t|
    t.text "intended_population_characteristics"
    t.string "students_or_employees_recruited"
    t.integer "min_participants"
    t.integer "max_participants"
    t.text "vulnerable_groups"
    t.text "vulnerable_groups_other"
    t.text "vulnerable_rationale"
    t.text "protections_in_place"
    t.text "descr_of_all_risk"
    t.text "descr_of_comp"
    t.text "descr_selection_proc"
    t.text "assure_informed_consent"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_section3s_on_form_id"
  end

  create_table "section4animals", force: :cascade do |t|
    t.text "what_data"
    t.text "location_organization_data_collection"
    t.text "procedures_of_data_collection"
    t.text "period_of_data_collection"
    t.text "data_collection_instruments"
    t.text "data_stored_how"
    t.text "length_of_data_retention"
    t.text "who_has_data_access"
    t.text "analysis_methods"
    t.text "results_desseminated"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_section4animals_on_form_id"
  end

  create_table "section4s", force: :cascade do |t|
    t.text "data_collection_proc"
    t.text "location_organization_data_collection"
    t.text "data_to_be_collected"
    t.text "period_of_data_collection"
    t.text "prospective_or_retrospective"
    t.text "anonymous_data"
    t.text "data_collection_instruments"
    t.text "data_stored_how"
    t.text "length_of_data_retention"
    t.text "who_has_data_access"
    t.text "analysis_methods"
    t.text "results_desseminated"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_section4s_on_form_id"
  end

  create_table "section5s", force: :cascade do |t|
    t.text "sources_of_funding"
    t.text "researcher_competency"
    t.text "irb_comments"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_section5s_on_form_id"
  end

  create_table "standardized_tests", force: :cascade do |t|
    t.integer "convertedACT", limit: 1
    t.integer "compositeACT", limit: 1
    t.boolean "officialACT"
    t.integer "englishACT", limit: 1
    t.integer "mathACT", limit: 1
    t.integer "socialACT", limit: 1
    t.integer "naturalACT", limit: 1
    t.integer "toefl", limit: 2
    t.integer "gre", limit: 2
    t.integer "gmat", limit: 2
    t.integer "mat", limit: 2
    t.integer "lsat", limit: 2
    t.integer "compositeSAT", limit: 2
    t.boolean "officialSAT"
    t.integer "mathSAT", limit: 2
    t.integer "readingSAT", limit: 2
    t.integer "writingSAT", limit: 2
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_standardized_tests_on_student_id"
  end

  create_table "student_details", force: :cascade do |t|
    t.string "sex"
    t.string "maritalStatus"
    t.boolean "usCitizen"
    t.string "citizenship"
    t.string "ethnicity"
    t.string "race"
    t.boolean "athlete"
    t.date "dateOfBirth"
    t.string "primaryEmail"
    t.boolean "deceased"
    t.string "churchType"
    t.boolean "graduated"
    t.string "firstName"
    t.string "middleName"
    t.string "lastName"
    t.string "preferredName"
    t.string "title"
    t.string "suffix"
    t.string "level"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_details_on_student_id"
  end

  create_table "student_hours", force: :cascade do |t|
    t.decimal "jslHoursAttempted"
    t.decimal "jslHoursCompleted"
    t.decimal "jslQualityHours"
    t.decimal "jslQualityPoints"
    t.string "doctorateMajor"
    t.decimal "gradHoursAttempted"
    t.decimal "gradHoursCompleted"
    t.decimal "gradQualityHours"
    t.decimal "gradQualityPoints"
    t.boolean "transient"
    t.boolean "transfer"
    t.decimal "undergradTransferQualityHours"
    t.decimal "undergradTransferQualityPoints"
    t.decimal "undergradSemesterHoursAttempted"
    t.decimal "undergradSemesterHoursCompleted"
    t.decimal "undergradQualityHours"
    t.decimal "undergradQualityPoints"
    t.integer "currentHours"
    t.integer "student_id"
    t.date "expectedDegreeDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_hours_on_student_id"
  end

  create_table "student_housings", force: :cascade do |t|
    t.string "campus"
    t.string "program"
    t.string "housingType"
    t.string "housingID"
    t.string "roomNumber"
    t.string "mealPlan"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_housings_on_student_id"
  end

  create_table "student_remedials", force: :cascade do |t|
    t.boolean "remedial0301"
    t.boolean "remedial0302"
    t.boolean "remedial0305"
    t.boolean "remedial1335"
    t.boolean "remedial1300"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_remedials_on_student_id"
  end

  create_table "student_tuitions", force: :cascade do |t|
    t.boolean "tuitionAssistance"
    t.string "source"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_tuitions_on_student_id"
  end

  create_table "student_universities", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_universities_on_student_id"
    t.index ["university_id"], name: "index_student_universities_on_university_id"
  end

  create_table "student_veterans", force: :cascade do |t|
    t.boolean "veteran"
    t.string "chapter"
    t.integer "percent", limit: 2
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_veterans_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "primary_email"
    t.string "secondary_email"
    t.string "cell_number"
    t.string "work_number"
    t.string "home_number"
    t.boolean "tracked"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_students_on_student_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_colleges", force: :cascade do |t|
    t.integer "user_id"
    t.integer "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_user_colleges_on_college_id"
    t.index ["user_id"], name: "index_user_colleges_on_user_id"
  end

  create_table "user_departments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_user_departments_on_department_id"
    t.index ["user_id"], name: "index_user_departments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "email"
    t.string "name"
    t.string "user_image"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.integer "role_id"
    t.integer "google_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "irb_user"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
