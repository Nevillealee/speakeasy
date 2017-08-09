class Section < ApplicationRecord
    include RankedModel
    belongs_to :course
    has_many :lessons
    ranks :row_order, with_same: :course_id
end
