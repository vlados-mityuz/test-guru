class BadgesForUsersServices

  def initialize(test_passage)
    @test_passage = TestPassage.find(test_passage)
    @user = @test_passage.user
    @test = @test_passage.test
    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send(badge.badge_type, badge.option)
    end
  end

  def award_badge!(badge)
    @test_passage.badges_awardings.create!(badge: badge, user: @test_passage.user)
  end

  private

  def category?(category)
    all = Test.where(category: category)
    passed = all.unique_completed_test_ids(all)
    all.present? && all.ids.uniq.sort == passed.ids.uniq.sort
  end

  def first_try?(test_title)
     @test_passage.success? && TestPassage.where("test_passages.user_id = ? AND test_id = ?", @user, @test).count == 1
  end

  def level?(level)
    all = Test.where(level: level)
    passed = all.unique_completed_test_ids(all)
    all.present? && all.ids.uniq.sort == passed.ids.uniq.sort
  end

  def unique_completed_test_ids(tests)
    @user.test_passages.where(passed: true, test: tests)
  end
end