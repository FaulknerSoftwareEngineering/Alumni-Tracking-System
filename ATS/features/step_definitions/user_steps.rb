Given(/^the following users exist:$/) do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    table.hashes.each do |user|
        #byebug
        User.create(:email => user[:email],
                    :name => user[:name],
                    :uid => user[:uid],
                    :oauth_token => user[:oauth_token],
                    :oauth_expires_at => user[:oauth_expires_at]
                    )
    end
    #byebug
    # Write code here that turns the phrase above into concrete actions
end