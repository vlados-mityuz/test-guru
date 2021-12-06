class BadgesForUsersServices

  def initialize(test_passage)
    @test_passage = TestPassage.find(test_passage)
    @user = @test_passage.user
    @test = @test_passage.test
    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def call
    @badges.select { |badge| send(badge.badge_type, badge.option) }
  end

  private

  def category?(category)
    all = Test.where(category: category)
    passed = all.tests_passed_by_user(@test_passage.user)
    all.present? && all.ids.uniq.sort == passed.ids.uniq.sort
  end

  def first_try?(test_title)
     @test_passage.success? && TestPassage.where("test_passages.user_id = ? AND test_id = ?", @user, @test).count == 1
  end

  def level?(level)
    all = Test.where(level: level)
    passed = all.tests_passed_by_user(@test_passage.user)
    all.present? && all.ids.uniq.sort == passed.ids.uniq.sort
  end

  def count_tests_success(test_ids)
    @user.test_passages.where(test_id: test_ids).select(&:success?).size
  end
end