class BandShow < ApplicationRecord
    belongs_to :band
    belongs_to :show
end