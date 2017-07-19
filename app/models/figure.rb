class Figure < ActiveRecord::Base
  belongs_to :figure
  belongs_to :title
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end
