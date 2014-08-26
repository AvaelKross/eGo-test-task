class GeneratorController < ApplicationController

  def generator_form
  end

  def generate
    result = Generator.generate(params[:users_count].to_i,params[:records_count].to_i,params[:comments_count].to_i,params[:comments_depth].to_i)
    redirect_to :root, notice: result
  end

  def clean
    Comment.destroy_all
    Record.destroy_all
    User.destroy_all
    redirect_to :root, notice: 'successfully cleaned up!'
  end

end