class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update]

  # POST /surveys
  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      render json: @survey, serializer: SurveySerializer, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # GET /surveys/:id
  def show
    render json: @survey, serializer: SurveySerializer
  end

  # PUT /surveys/:id
  def update
    if @survey.update(survey_params)
      render json: @survey, serializer: SurveySerializer
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name, :description, components: [])
  end
end
