# frozen_string_literal: true

class BaseballComment < ApplicationRecord
  belongs_to :user
  belongs_to :baseball
  validates :comment, presence: true
end
