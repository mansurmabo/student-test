class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @test = Test.find(session[:test])

  end

  def create
    @test = Test.find(session[:test])
    @question = Question.new(question_params)
    if @question.save
      redirect_to test_question_url(@test, @question)
    else
      render 'new'
    end

  end
  def show
    @test = Test.find(session[:test])
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)

    session[:question] = params[:id]
  end

  def edit
    @question = Question.find(params[:id])
    @test = Test.find(session[:test])
  end
  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end


  def destroy
    @question = Question.destroy(params[:id])

    redirect_to tests_url
  end


  private
  def question_params
    params.require(:question).permit(:title, :test_id)


  end
end
