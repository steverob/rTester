class ResultsController < ApplicationController
  # GET /results
  # GET /results.json
  layout "out", :except=>[:index]
  def index
    @test_id=params[:id]
    results_count = Result.where(:online_test_id=>params[:id]).count
    if results_count==0
      flash[:error]="Results not available!"
      redirect_to online_test_path(@test_id)
    else
      Result.calculate_rank(@test_id)
      @results = Result.where(:online_test_id=>params[:id]).order('score desc').paginate(:per_page=>15,:page=>params[:page])
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
