class Lesson < ApplicationRecord
    include RankedModel
    belongs_to :section
    mount_uploader :video, VideoUploader
    ranks :row_order, with_same: :section_id
        
end
