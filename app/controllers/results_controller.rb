class ResultsController < ApplicationController
  # GET /results
  # GET /results.json
  layout "out", :except=>[:index]
  def index
    @test_id=params[:id]
    @results = Result.where(:online_test_id=>params[:id]).order('score desc').paginate(:per_page=>15,:page=>params[:page])
    Result.calculate_rank(@test_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  def print
    @test_id=params[:id]
    @results = Result.where(:online_test_id=>params[:id]).order('score desc')
  end


  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url }
      format.json { head :no_content }
    end
  end
end
