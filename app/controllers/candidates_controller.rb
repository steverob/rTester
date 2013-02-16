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

    if params["teammate_1_name"]!=""&&params["teammate_1_pid"]!=""
     teammate_1=Candidate.new(:name=>params["teammate_1_name"],:roll_no=>params["teammate_1_pid"],:college=>params["teammate_1_college"])
    else
      teammate_1=Candidate.new(roll_no: "temp1")
    end
    if params["teammate_2_name"]!=""&&params["teammate_2_pid"]!=""
     teammate_2=Candidate.new(:name=>params["teammate_2_name"],:roll_no=>params["teammate_2_pid"],:college=>params["teammate_2_college"])
    else
      teammate_2=Candidate.new(roll_no: "temp2")
    end
    respond_to do |format|
      if @candidate.save&&teammate_1.save&&teammate_2.save
        session[:candidate_id]=@candidate.id
        @candidate.team_id=@candidate.id
        if teammate_1.name!=nil
          teammate_1.team_id=@candidate.id
          teammate_1.save
        else
          teammate_1.destroy
        end
        if teammate_2.name!=nil
          teammate_2.team_id=@candidate.id
          teammate_2.save
        else
          teammate_2.destroy
        end
        @candidate.save

        TestQuestion.generate_candidate_questions(@candidate.id,session[:test_id])
        Result.generate_result(@candidate.id,session[:test_id])
        flash[:notice]='Successfully entered the Test!'
        format.html { redirect_to instructions_path }
      else
        @candidate.destroy if @candidate.valid?
        teammate_1.destroy if teammate_1.valid?
        teammate_2.destroy if teammate_2.valid?
        flash[:alert]="Either your or one of your teammate's ID has already been registered!"
        format.html { redirect_to action: "new",id: session[:test_id] }
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
