class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render 'new'
    end

  end
  def show
    @test = Test.find(params[:id])
    @questions = Question.where(test_id: @test.id)
    session[:test] = params[:id]

  end

  def edit
    @test = Test.find(params[:id])

  end
  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render 'edit'
    end
  end


  def destroy
    @test = Test.destroy(params[:id])

    redirect_to tests_url
  end


  private
  def test_params
    params.require(:test).permit(:name, :description)


  end
end
