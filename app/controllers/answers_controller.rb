class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(session[:question])

  end

  def create
    @test = Test.find(session[:test])
    @question = Question.find(session[:question])
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to test_question_answer_url(@test, @question, @answer)
    else
      render 'new'
    end

  end
  def show
    @test = Test.find(session[:test])
    @question = Question.find(session[:question])
    @answer = Answer.find(params[:id])
    @answers = Answer.where(question_id: @question.id)

  end

  def edit
    @answer = Answer.find(params[:id])


  end
  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      redirect_to @answer
    else
      render 'edit'
    end
  end


  def destroy
    @answer = Answer.destroy(params[:id])

    redirect_to tests_url
  end


  private
  def answer_params
    params.require(:answer).permit(:title, :is_correct, :question_id)

  end
end
