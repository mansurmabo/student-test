class TestsController < ApplicationController

  def run_test
    @test = Test.find(session[:test])
    @questions = Question.where(test_id: @test.id)
  end

  def test_results

    @test = Test.find(session[:test])
    @questions = Question.where(test_id: @test.id)

    @name = params[:name] + ' ' + params[:surname]
    @group = params[:group]

    @correct_answers = 0
    @all_answers = []
    @result_array = []
    @questions.each do |q|
      answers = Answer.where(question_id: q.id)
      @all_answers << answers
      @result_array << params[q.title]
    end
    @all_answers.each do |all_answer|
      all_answer.each do |answer|
        if answer.is_correct == true
          @result_array.each do |result|
            if answer.title == result
              @correct_answers += 1
            end
          end
        end
      end
    end
    @percent = @correct_answers * 100 / @questions.size

    @result = Result.create!(student: @name, correct: @percent )

  end

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
