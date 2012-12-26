class OnlineTestsController < ApplicationController
  # GET /online_tests
  # GET /online_tests.json

  before_filter :authorize

  def index
    @online_tests = OnlineTest.order('created_at desc').paginate(:per_page=>15,:page=>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @online_tests }
      format.js
    end
  end

  # GET /online_tests/1
  # GET /online_tests/1.json
  def show
    @online_test = OnlineTest.find(params[:id])
    @takers=@online_test.test_questions.first.candidate_answers.length
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @online_test }
    end
  end

  # GET /online_tests/new
  # GET /online_tests/new.json
  def new
    @online_test = OnlineTest.new
    @tags = Question.tag_counts_on(:tags)
    @hide=false
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @online_test }
    end
  end

  # GET /online_tests/1/edit
  def edit
    @online_test = OnlineTest.find(params[:id])
    @tags = Question.tag_counts_on(:tags)
    @hide=false
    if @online_test.test_questions.first.candidate_answers.length!=0
      @hide=true
    end


  end

  # POST /online_tests
  # POST /online_tests.json
  def create
    @online_test = OnlineTest.new(params[:online_test])
    @online_test.open=true

    @test_questions=TestQuestion.generate_test_questions(@online_test)
    @tags= Question.tag_counts_on(:tags)

    if @test_questions.count<@online_test.no_of_questions
      render action: "new"
      flash[:error]="Required number of questions unavailable"
    else
      @online_test.save
      redirect_to @online_test, notice: 'Online test was successfully created.'
    end
  end

  # PUT /online_tests/1
  # PUT /online_tests/1.json
  def update
    @tags= Question.tag_counts_on(:tags)
    @online_test = OnlineTest.find(params[:id])
    @online_test.update_attributes(params[:online_test])
    if !params["online_test"][:tag_list].nil?
      @test_questions=TestQuestion.generate_test_questions(@online_test)
    else
      @test_questions=@online_test.questions
    end
    if @test_questions.count<@online_test.no_of_questions
        render action: "edit"
        flash[:error]="Required number of Questions unavailable!"
    else
      redirect_to @online_test
      flash[:notice]= 'Online test was successfully updated.'
    end
  end

  def close
    test=OnlineTest.find(params[:id])
    test.open=false
    test.save
    redirect_to test, notice: 'Online Test was closed successfully'
  end

  # DELETE /online_tests/1
  # DELETE /online_tests/1.json
  def destroy
    @online_test = OnlineTest.find(params[:id])
    @online_test.destroy

    respond_to do |format|
      format.html { redirect_to online_tests_url }
      format.json { head :no_content }
    end
  end

  def tag_cloud
    @tags = Question.tag_counts_on(:tags)
  end
end
