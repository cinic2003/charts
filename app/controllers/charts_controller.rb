class ChartsController < ApplicationController

  def index
    @pie = open_flash_chart_object(500, 500, '/chart_data/get_pie')
    @graph = open_flash_chart_object(700, 350, '/chart_data/get_graph')
    @line = open_flash_chart_object(800, 300, '/chart_data/get_line')
    @line_dot = open_flash_chart_object(800, 350, '/chart_data/get_linedot')
    @hollowdot = open_flash_chart_object(700, 400, '/chart_data/get_hollowdot')

    @charts = []
    @charts << @pie << @graph << @line << @line_dot << @hollowdot
    @charts = @charts.paginate :per_page => 2, :page => params[:page]
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

  def hbar
    @hbar = open_flash_chart_object(800, 400, '/chart_data/get_hbar')
  end

end
