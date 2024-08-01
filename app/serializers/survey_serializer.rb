class SurveySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :components
end
