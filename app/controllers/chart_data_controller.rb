class ChartDataController < ApplicationController

  def get_graph
    chart = OpenFlashChart.new("Bar Chart") do |c|
      c << BarGlass.new(:values => (1..10).sort_by{rand})
    end
    render :text => chart.to_json
  end

  def get_pie
    title = Title.new("Pie Chart Example")
    pie = Pie.new
    pie.start_angle = 6 
    pie.animate = true
    pie.tooltip = '#val# of #total#<br>#percent# of 100%'
    pie.colours = ["#d01f3c", "#356aa0", "#C79810"]
    pie.values  = [20,
                  PieValue.new(15, "Bar (15%)"),
                  PieValue.new(65,"Hello (65%)")]
    chart = OpenFlashChart.new
    chart.title = title
    chart.add_element(pie)
    chart.x_axis = nil
    render :text => chart.to_s
  end

  def get_hollow
    data1 = []
    data2 = []
    year = Time.now.year

    31.times do |i|
      x = "#{year}-1-#{i+1}".to_time.to_i
      y = (Math.sin(i+1) * 2.5) + 10
      data1 << ScatterValue.new(x,y)
      data2 << (Math.cos(i+1) * 1.9) + 4
    end
    dot = HollowDot.new
    dot.size = 3
    dot.halo_size = 2
    dot.toolzip = "#date:d M y#<br>Value: #val#"

    line = ScatterLine.new("#DB1750", 3)
    line.values = data1
    line.default_dot_style = dot

    x = XAxis.new
    x.set_range("#{year}-1-1".to_time.to_i, "#{year}-1-31".to_time.to_i)
    x.steps = 86400

    labels = XAxisLabels.new
    labels.text = "#date: l jS, M Y#"
    labels.steps = 86400
    labels.visible_steps = 2
    labels.rotate = 90

    x.labels = labels

    y = YAxis.new
    y.set_range(0, 15, 5)

    chart = OpenFlashChart.new
    title = Title.new(data2.size)

    chart.title = title
    chart.add_element(line)
    chart.x_axis = x
    chart.y_axis = y

    render :text => chart, :layout => false
  end

  def get_hollowdot
    data1 = []
    data2 = []
    year = Time.new.year

    31.times do |i|
      x = "#{year}-1-#{i+1}".to_time.to_i
      y = (Math.sin(i+1) * 2.5) + 10
      data1 << ScatterValue.new(x,y)
      data2 << (Math.cos(i+1) * 1.9) + 4
    end
    
    dot = HollowDot.new
    dot.size = 3
    dot.halo_size = 2
    dot.tooltip = "#date:d M y#<br>Value: #val#"

    line = ScatterLine.new("#DB1750", 3)
    line.values = data1
    line.default_dot_style = dot

    x = XAxis.new
    x.set_range("#{year}-1-1".to_time.to_i, "#{year}-1-31".to_time.to_i)
    x.steps = 86400
    labels = XAxisLabels.new
    labels.text = "#date: l jS, M Y#"
    labels.steps = 86400
    labels.visible_steps = 2
    labels.rotate = 90
    x.labels = labels

    y = YAxis.new
    y.set_range(0,15,5)
    chart = OpenFlashChart.new
    title = Title.new(data2.size)

    chart.title = title
    chart.add_element(line)
    chart.x_axis = x
    chart.y_axis = y
    render :text => chart, :layout => false
  end
  
  def get_dot
    data = []
    10.times do
      data << rand(10)
    end

    line_dot = LineDot.new
    line_dot.text = 'Dot'
    line_dot.width = 5
    line_dot.colour = '#DFC329'
    line_dot.dot_size = 6
    line_dot.values = data
    line_dot.halo_size = 0

    y = YAxis.new
    y.set_range(0, 20, 5)

    x_legend = XLegend.new('X Legend')
    x_legend.set_style('{font-size: 20px; color: #7788877}')

    y_legend = YLegend.new('Y Legend')
    y_legend.set_style('{font-size: 20px; color: #770077}')
    
    title = Title.new('Line Dot')
    chart = OpenFlashChart.new
    chart.set_title(title)
    chart.set_x_legend(x_legend)
    chart.set_Y_legend(y_legend)
    chart.y_axis = y

    chart.add_element(line_dot)

    render :text => chart.to_s
  end

  def get_hbar
    title = Title.new('HBar')
    hbar = HBar.new
    hbar.values = [HBarValue.new(0, 4), HBarValue.new(4,8), HBarValue.new(8,10)]
    chart = OpenFlashChart.new
    chart.set_title(title)
    chart.add_element(hbar)

    x = XAxis.new
    x.set_offset(false)
    x.set_labels(['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'])
    chart.set_x_axis(x)

    y = YAxis.new
    y.set_offset(true)
    y.set_labels(["Make garden","Paint house","Move into house"])
    chart.set_y_axis(y)

    render :text => chart.to_s
  end

  def get_line
    title = Title.new("Multiple Lines")

    data1 = []
    data2 = []
    data3 = []

    10.times do |x|
       data1 << rand(10) + 1
       data2 << rand(10) + 7
       data3 << rand(10) + 4
    end

    line_dot = LineDot.new
    line_dot.text = 'Line Dot'
    line_dot.width = 4
    line_dot.colour = '#DFC329'
    line_dot.dot_size = 5
    line_dot.values = data1

    line_hollow = LineHollow.new
    line_hollow.text = 'Line Hollow'
    line_hollow.width = 1
    line_hollow.colour = '#6363AC'
    line_hollow.dot_size = 5
    line_hollow.values = data2

    line = Line.new
    line.text = 'Line'
    line.width = 1
    line.colour = '#5E4725'
    line.dot_size = 5
    line.values = data3
    
    line2 = Line.new
    line2.text = 'Line2'
    line2.width =2 
    line2.colour = '#6363AC'
    line2.dot_size =3 
    line2.values = data2

    # Added these lines since the previous tutorial
    tmp = []
    x_labels = XAxisLabels.new
    x_labels.set_vertical()

    %w(one two three four five six seven eight nine ten).each do |text|
      tmp << XAxisLabel.new(text, '#0000ff', 20, 'diagonal')
    end

    x_labels.labels = tmp
    x = XAxis.new
    x.set_labels(x_labels)
   # new up to here ...

    y = YAxis.new
    y.set_range(0,20,5)

    x_legend = XLegend.new("X Legend")
    x_legend.set_style('{font-size: 20px; color: #778877}')

    y_legend = YLegend.new("Y Legend")
    y_legend.set_style('{font-size: 20px; color: #770077}')

    chart = OpenFlashChart.new
    chart.set_title(title)
    chart.set_x_legend(x_legend)
    chart.set_y_legend(y_legend)
#    chart.x_axis = x # Added this line since the previous tutorial
    chart.y_axis = y

    chart.add_element(line_dot)
    chart.add_element(line_hollow)
    chart.add_element(line)
#    chart.add_element(line2)

    render :text => chart.to_s
  end

  def get_bar
    title = Title.new('Multi Bar')
    bar = Bar.new
#    10.times do 
      bar.values = [2,5,1,7,3,8,6,9,3]
#    end
    bar.tooltip = "Title Bar l<br>val = #val#"
    bar.colour = '#47092D'

    bar2 = Bar.new
    bar2.set_tooltip("Spoon {#val#}<br>Title Bar 2")
    bar2.set_colour('#CC2AA3')

    vals = []
    4.times do 
      vals << rand(10)
    end

    tmp = BarValue.new(5)
    tmp.set_colour('#000000')
    tmp.set_tooltip("Spoon {#val#}<br>Title Bar 2 <br>Special data poin")
    vals << tmp
    4.times do 
      vals << rand(10)
    end
    vals = vals.flatten

    bar2.values = vals

    t = Tooltip.new
    t.set_shadow(false)
    t.stroke = 5
    t.colour = '#6E604F'
    t.set_background_colour("#BDB396")
    t.set_title_style("{font-size: 14px; color: #CC2A43;}")
    t.set_body_style("{font-size: 10px; font-weight: bold; color: #000000;}")
    chart = OpenFlashChart.new
    chart.title = title
    chart.add_element(bar)
    chart.add_element(bar2)
    chart.set_tooltip(t)

    render :text => chart.to_s
  end

  def get_linedot
    ss = '{"y_axis": {"steps": 5, "max": 20, "min": 0}, "y_legend": {"text": "MY Y Legend", "style": "{font-size: 20px; color: #770077}"}, "title": {"text": "Multiple Lines"}, "x_legend": {"text": "MY X Legend", "style": "{font-size: 20px; color: #778877}"}, "elements": [{"type": "line_dot", "dot-size": 5, "colour": "#DFC329", "values": [1, 1, 3, 3, 4, 2, 4, 5, 1, 1], "width": 4, "text": "Line Dot"}, {"type": "line_hollow", "dot-size": 5, "colour": "#6363AC", "values": [7, 10, 8, 10, 8, 10, 10, 12, 10, 11], "width": 1, "text": "Line Hollow"}, {"type": "line", "dot-size": 5, "colour": "#5E4725", "values": [14, 14, 16, 14, 16, 17, 18, 15, 17, 16], "width": 1, "text": "Line"}]}'
    render :text => ss
  end

end
