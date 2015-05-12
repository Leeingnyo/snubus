class Edge < ActiveRecord::Base
  def self.get_duration(line, start_stop, end_stop)
    return 0 if start_stop == end_stop
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
  
  def self.get_stop_list(line, start_stop, end_stop)
    return [start_stop] if start_stop == end_stop
    iter_stop = start_stop
    stop_list = [start_stop]
    edge = Edge.find_by(:line_id => line, :from => start_stop)
    while edge do
      iter_stop = edge.to
      stop_list.push(iter_stop)
      if iter_stop == end_stop
        return stop_list
      end
      edge = Edge.find_by(:line_id => line, :edge_index => edge.edge_index + 1)
    end
    return nil
  end
end
