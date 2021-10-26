class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  LENGTH_LIMIT = 25

  def short_text
    question.body.truncate(LENGTH_LIMIT)
  end

  def hash_url
    url[/gist.github.com\/(\w+)/, 1]
  end
end
