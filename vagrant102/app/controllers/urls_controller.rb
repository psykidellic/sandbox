class UrlsController < ApplicationController
  def new
    @shortened_url = Url.new
  end
end
