class HiController < ApplicationController
  def index
      @stud = 'Я - студент Василь ПУПКІН!'
      @message = 'Моє повідомлення {} прийшло з Контролера'
  end
end
