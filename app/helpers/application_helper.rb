module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo, project_name)
    link_to(project_name, "http://github.com/#{author}/#{repo}")
  end

  def flash_messages
    flash.map do |key, msg|
      concat(content_tag(:div, msg, :id => key, :class => "flash alert-#{key}"))
    end.join
  end
end