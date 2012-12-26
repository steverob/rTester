class CandidatesController < ApplicationController
  # GET /candidates
  # GET /candidates.json

  # GET /candidates/1
  # GET /candidates/1.json


  # GET /candidates/new
  # GET /candidates/new.json
  def new
    @candidate = Candidate.new
    session[:test_id]=params[:id]
    @test=OnlineTest.find(session[:test_id])
    if !@test.open
      redirect_to :controller=>"test_center",:action=>"closed"
    end

  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(params[:candidate])
    respond_to do |format|
      if @candidate.save
        session[:candidate_id]=@candidate.id
        TestQuestion.generate_candidate_questions(@candidate.id,session[:test_id])
        Result.generate_result(@candidate.id,session[:test_id])
        flash[:notice]='Successfully entered the Test!'
        format.html { redirect_to :controller=>"test_center",:action=>"instructions" }
      else
        format.html { render action: "new" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidates/1
  # PUT /candidates/1.json
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        flash[:notice]='Successfully updated Details!'
        format.html { redirect_to :controller=>"test_center",:action=>"instructions" }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url }
      format.json { head :no_content }
    end
  end
end
