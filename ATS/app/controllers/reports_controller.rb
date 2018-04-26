class ReportsController < ApplicationController
    
    def index
    
    end
    
    def generate_report
        @grad_year = params[:graduation_year]
        @term = params[:term]
        @grad_school = params[:graduate_school]
        
        if @grad_year != '' #term and grad_school are empty
            @students = Student.where({year_graduated: @grad_year})
            
            report = ODFReport::Report.new("#{Rails.root}/app/reports/students.odt") do |r|
                
                r.add_table("TABLE_1", @students) do |t|
                    t.add_column(:first_name) { |student| "#{student.first_name}" }
                    t.add_column(:last_name) { |student| "#{student.last_name}" }
                    t.add_column(:primary_email) { |student| "#{student.primary_email}" }
                    t.add_column(:cell_number) { |student| "#{student.cell_number}" }
                end
            end
            #report.generate("./documents/students_report.odt")
            send_data report.generate, type: 'application/vnd.oasis.opendocument.text', 
                                        disposition: 'attachment', 
                                        filename: 'students.odt'
            
        elsif @term != '' #grad_year and grad_school are empty
        
        elsif @grad_school != '' #grad_year and term are empty
        
        elsif @grad_year != '' && @term != '' #only grad_school is empty
        
        elsif @grad_year != '' && @grad_school != '' #only term is empty
        
        elsif @term != '' && @grad_school != '' #only grad_year is empty
        
        end
    end
    
end