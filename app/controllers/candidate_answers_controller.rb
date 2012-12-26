class CandidateAnswersController < ApplicationController
  # GET /candidate_answers
  # GET /candidate_answers.json
  def index
    @candidate_answers = CandidateAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidate_answers }
    end
  end

  # GET /candidate_answers/1
  # GET /candidate_answers/1.json
  def show
    @candidate_answer = CandidateAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidate_answer }
    end
  end

  # GET /candidate_answers/new
  # GET /candidate_answers/new.json
  def new
    @candidate_answer = CandidateAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidate_answer }
    end
  end

  # GET /candidate_answers/1/edit
  def edit
    @candidate_answer = CandidateAnswer.find(params[:id])
  end

  # POST /candidate_answers
  # POST /candidate_answers.json
  def create
    @candidate_answer = CandidateAnswer.new(params[:candidate_answer])

    respond_to do |format|
      if @candidate_answer.save
        format.html { redirect_to @candidate_answer, notice: 'Candidate answer was successfully created.' }
        format.json { render json: @candidate_answer, status: :created, location: @candidate_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @candidate_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidate_answers/1
  # PUT /candidate_answers/1.json
  def update
    @candidate_answer = CandidateAnswer.find(params[:id])

    respond_to do |format|
      if @candidate_answer.update_attributes(params[:candidate_answer])
        format.html { redirect_to @candidate_answer, notice: 'Candidate answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidate_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_answers/1
  # DELETE /candidate_answers/1.json
  def destroy
    @candidate_answer = CandidateAnswer.find(params[:id])
    @candidate_answer.destroy

    respond_to do |format|
      format.html { redirect_to candidate_answers_url }
      format.json { head :no_content }
    end
  end
end
