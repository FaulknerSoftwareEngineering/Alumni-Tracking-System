class IndexController < ApplicationController
    skip_before_action :require_login, only: [:index, :contact_support]
end
