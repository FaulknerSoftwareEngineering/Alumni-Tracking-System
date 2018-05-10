class Section2sController < ApplicationController
    
    def section2_params
        params.require(:section2).permit(:abstract_summary, :purpose, :content_area)
    end
    
    def index
        @form = Form.all
    end
    
    def new
        @section2text = Formtext.where({:section => 2, :human_form => false}).order("sub_section ASC").all
    end
    
    def create
        @form = Form.create!()
        @section2 = Section2.create!(section2_params)
        @form.section2 = @section2
        flash[:notice] = "#{@section2.project_name} was successfully created."
        redirect_to forms_path
    end
    
    def edit
        @form = Form.find(params[:id])
        @section2text = Formtext.where({:section => 2, :human_form => false}).order("sub_section ASC").all
        @section1 = Section1.find_by_form_id @form.id
        @section2 = Section2.find params[:id]
        @section3 = Section3.find_by_form_id @form.id
        
    end
    
    def update
        @section2 = Section2.find params[:id]
        @section2.update_attributes!(section2_params)
        flash[:success] = "Section 2 was successfully updated."
        redirect_to forms_path
    end
end
