class ChartsController < ApplicationController

  def index
    @pie = open_flash_chart_object(500, 500, '/chart_data/get_pie')
    @graph = open_flash_chart_object(700, 350, '/chart_data/get_graph')
    @line = open_flash_chart_object(800, 300, '/chart_data/get_line')
    @line_dot = open_flash_chart_object(800, 350, '/chart_data/get_linedot')
    @charts = []
    @charts << @pie << @graph << @line << @line_dot
    @charts = @charts.paginate :per_page => 2, :page => params[:page]
#    WillPaginate::Collection.create(current_page, per_page)
  end

  def pie_chart
    @pie = open_flash_chart_object(500, 500, '/chart_data/get_pie')
  end

  def graph_chart
    @graph = open_flash_chart_object(700, 350, '/chart_data/get_graph')
  end

  def line_chart
    @line = open_flash_chart_object(800, 300, '/chart_data/get_line')
  end

  def line_dot
    @line_dot = open_flash_chart_object(800, 350, '/chart_data/get_linedot')
#    http://pullmonkey.com/projects/open_flash_chart2/lines
  end

end
