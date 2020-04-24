module InstituationalResearchHelper
	def degree_by_gender
		column_chart degree_by_gender_charts_path, library: {
      title: {text: 'Sporters by age'},
      yAxis: {
         title: {
             text: 'Ages count'
         }
      },
      xAxis: {
         title: {
             text: 'Age'
         }
      }
    }
	end
end