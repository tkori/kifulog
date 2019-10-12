class KifusController < ApplicationController
  def index
    @kifus = Kifu.all
  end

  def new
    @kifu = Kifu.new
  end
end
