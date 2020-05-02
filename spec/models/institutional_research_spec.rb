require 'rails_helper'

RSpec.describe InstitutionalResearch, type: :model do
    
  let(:header) {"M_ACMCensusID"}
  let(:row0) {"100001,100001"}
  let(:rows) {[header, row0]}
    
  let(:file_path) {"tmp/test.csv"}
    let!(:csv) do
        CSV.open(file_path, "w") do |csv|
            csv << row.split(",")
        end
    end
end
   describe ".import" do
       it 'imports a csv file without duplicate student ids'
       expect {CSV.import(file)}.empty

after(:each) {File.delete(file_path)}
    
end
