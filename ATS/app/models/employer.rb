=begin
Created by: Javan Rampersad, Christopher Smith
On: 20 Feb 2018
=end
class Employer < ActiveRecord::Base
    def change
        create_table 'employers' do |t|
            t.string 'name'
            t.timestamps
        end
    end
end