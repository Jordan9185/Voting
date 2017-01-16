class CandidatesController < ApplicationController
	def index
		@Candidates = Candidate.all
	end
end
