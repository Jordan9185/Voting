class CandidatesController < ApplicationController
	before_action :find_candidate, only:[:edit,:update,:destroy,:vote]

	def index
		@Candidates = Candidate.all
	end

	def new
		@Candidate = Candidate.new
	end

	def create
		@Candidate = Candidate.new(candidate_params)

		if @Candidate.save
			redirect_to candidates_path, notice:"Create new candidate success."
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @Candidate.update_attributes(candidate_params)
			redirect_to candidates_path,notice:"Update success!"
		else
			render :edit
		end
	end

	def destroy
		@Candidate.destroy
		redirect_to candidates_path,notice:"Candidate already deleted."
	end

	def vote
		@Candidate.increment(:votes)
		@Candidate.save
		redirect_to candidates_path,notice:"Thanks for vote!"
	end

	private
	def candidate_params
		params.require(:candidate).permit(:name, :age, :party, :politics)
	end

	def find_candidate
		@Candidate = Candidate.find_by(id:params[:id])
	end
end
