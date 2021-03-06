# frozen_string_literal: true

module BaseballCommentsHelper
  def date_format(datetime)
    time_ago_in_words(datetime) + '前'
  end
end
