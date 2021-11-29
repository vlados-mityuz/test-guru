class Badge < ApplicationRecord
  has_many :users, through: :user_badges

  CATEGORIES = ["All SQL tests completed", "Test passed from the first attempt", "Level 1 compleated" ]

  def rule
    case title
    when CATEGORIES[0]
      "all_sql_tests_completed"
    when CATEGORIES[1]
      "passed_from_first_attempt"
    when CATEGORIES[2]
      "level_completed"
    end
  end

  def all_sql_tests_completed_award?(badge_value)
    badge_value[:all_sql_tests_completed]
  end

  def passed_from_first_attempt_award?(badge_value)
    badge_value[:passed_from_first_attempt]
  end

  def level_completed_award?(badge_value)
    badge_value[:level_completed]
  end
end