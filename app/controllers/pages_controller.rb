class PagesController < ApplicationController
  def about
    @heading = 'Страница про нас!'
    @text = 'Немного текста' 
  end
end
