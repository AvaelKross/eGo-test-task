class GeneratorController < ApplicationController

  def generator_form
  end

  def generate
    result = nil
    time = Benchmark.ms do
      result = Generator.generate(params[:users_count].to_i,params[:records_count].to_i,params[:comments_count].to_i,params[:comments_depth].to_i)
    end
    redirect_to :root, notice: result+", time spent: #{time}"
  end

  def clean
    Comment.delete_all
    Record.delete_all
    User.delete_all
    redirect_to :root, notice: 'successfully cleaned up!'
  end

end