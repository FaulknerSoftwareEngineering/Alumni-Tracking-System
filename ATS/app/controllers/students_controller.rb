class StudentsController < ApplicationController
    has_many :employers
    has_many :universities
    has_many :degrees
end
