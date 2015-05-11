class Edge < ActiveRecord::Base
  def self.get_duration(line, start_stop, end_stop)
    time = 0
    iter_stop = start_stop
    edge = Edge.find_by(:line_id => line, :from => start_stop)
    while edge do
      time += edge.time
      iter_stop = edge.to
      if iter_stop == end_stop
        return time
      end
      edge = Edge.find_by(:line_id => line, :edge_index => edge.edge_index + 1)
    end
    return -1
  end
end
