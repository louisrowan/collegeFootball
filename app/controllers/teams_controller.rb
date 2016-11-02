class TeamsController < ApplicationController

	def index
		@teams = Team.all.joins(:recruiting_classes)
	end

end
