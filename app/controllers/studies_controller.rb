#require 'pry-byebug'
class StudiesController < ApplicationController
  skip_before_action :verify_authenticity_token


  #CRUD
  #READ
  #present the collection for you!
  def index
    @studies = Study.all
    #render json: @studies
  end

  #present a specific element for you
  def show
    @study = Study.find(params[:id])
    render json: @study
  end

  #CREATE
  def create
    @study = Study.new(study_params)
    if @study.save
      StudyMailer.with(study: @study).success_mail.deliver_later
      StudyMailer.test_email.deliver_later
      #Delayed Jobs: StudyMailer.with(study: @study).delay.success_mail
      redirect_to studies_path
    else
      render :new
    end
  end

  #UPDATE
  def update 
    @study = Study.find(params[:id])
    if @study
      @study.update(params)
      render json: {note: 'Study was updated!'}
      #render :json => {:note => 'Study was updated!'}
    else
      render json: {note: 'Couldnt find the study'}
    end
  end

  def destroy 
    @study = Study.find(params[:id])
    if @study
      @study.destroy(study_params)
      render json: {note: 'Study was deleted'}
    else
      render json: {note: 'Study was not deleted'}
    end
  end

  def new
    @study ||= Study.new
    #@study = @study || Study.new
    #@sequence_name ||= seq_name
  end


  private 
  def study_params
    params.require(:study).permit(:name, :age_limit, :drug, :phase, :symptoms, :study_group_id, :my_image)
  end
end