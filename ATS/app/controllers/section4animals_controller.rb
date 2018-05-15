class Section4animalsController < ApplicationController
    
    def section4animal_params
        params.require(:section4animal).permit(
        :what_data,
        :location_organization_data_collection,
        :procedures_of_data_collection,
        :period_of_data_collection,
        :data_collection_instruments,
        :data_stored_how,
        :length_of_data_retention,
        :who_has_data_access,
        :analysis_methods,
        :results_desseminated
        )
    end
    
    def edit
        @form = Form.find(params[:id])
        @section4animaltext = Formtext.where({:section => 4, :human_form => false}).order("sub_section ASC").all
        @section3 = Section3.find_by_form_id @form.id
        @section4animal = Section4animal.find params[:id]
        @section5 = Section5.find_by_form_id @form.id
    end
    
    def update
        @section4animal = Section4animal.find params[:id]
        @section4animal.update_attributes!(section4_params)
        flash[:success] = "Section 3 was successfully updated."
        redirect_to forms_path
    end
    
end
