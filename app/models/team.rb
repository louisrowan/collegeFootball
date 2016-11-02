class Team < ActiveRecord::Base
	has_many :records
	has_many :recruiting_classes, class_name: 'RecruitingClass'
end
