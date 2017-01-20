class CandidatesController < ApplicationController
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
		@Candidate = Candidate.find_by(id:params[:id])
	end

	def update
		@Candidate = Candidate.find_by(id:params[:id])

		if @Candidate.update_attributes(candidate_params)
			redirect_to candidates_path,notice:"Update success!"
		else
			render :edit
		end
	end

	def destroy
		@Candidate = Candidate.find_by(id:params[:id])
		@Candidate.destroy
		redirect_to candidates_path,notice:"Candidate already deleted."
	end

	def candidate_params
		params.require(:candidate).permit(:name, :age, :party, :politics)
	end
end
