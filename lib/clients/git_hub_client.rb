class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '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'

  def initialize
    @client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
  end

  def create_gist(params)
    @client.create_gist(params)
  end
end