module QuoteGetter
  include HTTParty

  def quote

    @response = HTTParty.get('https://api.github.com/zen',   headers: {"User-Agent" => "stack overflow", "Authorization" => "token #{ENV['API_KEY']}"})
    @quotes = ["Knock, knock", "Josh and Kelsey are awesome and are killing this challenge!"]
    ratelimit = @response.headers["x-ratelimit-remaining"].to_i
    if ratelimit > 0
      @response.parsed_response
    else
      @quotes.sample
    end
  end
end

