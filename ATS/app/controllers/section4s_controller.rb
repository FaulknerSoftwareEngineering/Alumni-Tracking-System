class Section4sController < ApplicationController
    
    def section4_params
        params.require(:section4).permit(
        :data_collection_proc,
        :location_organization_data_collection,
        :data_to_be_collected,
        :period_of_data_collection,
        :prospective_or_retrospective,
        :anonymous_data,
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
        @section4text = Formtext.where({:section => 4, :human_form => true}).order("sub_section ASC").all
        @section3 = Section3.find_by_form_id @form.id
        @section4 = Section4.find params[:id]
        @section5 = Section5.find_by_form_id @form.id
    end
    
    def update
        @section4 = Section4.find params[:id]
        @section4.update_attributes!(section4_params)
        flash[:success] = "Section 4 was successfully updated."
        redirect_to forms_path
    end
    
end
