class BadgesForUsersServices

  def initialize(test_passage)
    @test_passage = TestPassage.find(test_passage)
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if badge.send( "#{badge.rule}_award?", badge_value )
    end
  end

  def badge_value
    {
      passed_from_first_attempt: passed_from_first_attempt?,
      all_ruby_advanced_tests_completed: all_sql_advanced_tests_completed?
    }
  end

  def passed_from_first_attempt?
    @test_passage.test_attempts.count <= 1 && @test_passage.successful
  end

  def all_sql_advanced_tests_completed?
    @test.category.title == 'SQL' && @test.category.tests.count == @test_passage.same_categories_tests_passed.count
  end

end