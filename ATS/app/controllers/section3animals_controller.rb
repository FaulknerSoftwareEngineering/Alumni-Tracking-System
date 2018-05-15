class Section3animalsController < ApplicationController
    
    def section3animal_params
        params.require(:section3animal).permit(
        :describe_animals,
        :housing_and_transport,
        :ethical_care_in_altered_conditions,
        :protect_humans,
        :justification_for_animals,
        :foreseen_pain,
        :animals_after_study,
        :veterinarian_present,
        :other_helpful_info
        )
    end
    
    def edit
        @form = Form.find(params[:id])
        @section3animaltext = Formtext.where({:section => 3, :human_form => false}).order("sub_section ASC").all
        @section2 = Section2.find_by_form_id @form.id
        @section3animal = Section3animal.find params[:id]
        @section4 = Section4.find_by_form_id @form.id
    end
    
    def update
        @section3animal = Section3animal.find params[:id]
        @section3animal.update_attributes!(section3animal_params)
        flash[:success] = "Section 3 was successfully updated."
        redirect_to forms_path
    end
    
end
