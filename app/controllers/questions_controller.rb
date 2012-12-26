class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  before_filter :authorize


  def index
    @tags=Question.tag_counts_on(:tags)
    if !params[:tag_list].nil? && params[:tag_list]!=""
      @questions=Question.tagged_with(params[:tag_list].split(","),:any=>true).paginate(:per_page=>15, :page => params[:page])
    else
      @questions=Question.paginate(:per_page=>15, :page => params[:page]).all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
      format.js
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @answers=@question.answers
    @tags=@question.tag_list.join(",")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    4.times { @question.answers.build }
    @q_tags=@question.tag_list
    @tags=Question.tag_counts_on(:tags)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    @q_tags=@question.tag_list
    @tags=Question.tag_counts_on(:tags)
  end

  # POST /questions
  # POST /questions.json
  def create


    @question = Question.new(params[:question])
    @question.tag_list=params["hidden-tags"]
    @q_tags=@question.tag_list
    @tags=Question.tag_counts_on(:tags)
    if  params["hidden-tags"]==""
        flash[:error]="Enter atleast one tag!"
       render action: "new"
    elsif @question.save
        redirect_to @question, notice: 'Question was successfully created.'
    else
        render action: "new"
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])
    @question.tag_list=params["hidden-tags"]
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def online_test_questions
    @test_questions=TestQuestion.where(:online_test_id=>params[:id])
    @questions=Array.new
    @test_questions.each do |q|
      @questions << q.question
    end
    @questions=@questions.paginate(:page=>params[:page],:per_page=>15)
    @test=OnlineTest.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @questions }
      format.js
    end
  end

end
