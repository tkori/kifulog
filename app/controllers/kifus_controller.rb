class KifusController < ApplicationController
  def index
    @kifus = Kifu.all
  end
end
