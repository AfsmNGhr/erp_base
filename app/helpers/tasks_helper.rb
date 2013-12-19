# -*- encoding : utf-8 -*-
require 'net/http'
require 'cgi'


module TasksHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def reps_join_upload_hash(id)
    hh = Hash.new
    Post.connection.select_all("SELECT p.id,date(p.created_at) pd,p.text,p.staff_id FROM (SELECT date(created_at) dd FROM uploads WHERE task_id=#{id} UNION SELECT date(created_at) dd FROM posts WHERE task_id=#{id}) dd LEFT JOIN posts p ON dd.dd=pd WHERE p.task_id=#{id}").each do |row|
      hh[row["pd"]] = [[],[]] if hh[row["pd"]].nil?
      hh[row["pd"]][0].push([row["id"],row["text"],row["staff_id"]])
    end
    Post.connection.select_all("SELECT dd.dd,u.id,date(u.created_at) ud,u.filename,u.staff,u.size FROM (SELECT date(created_at) dd FROM uploads WHERE task_id=#{id} UNION SELECT date(created_at) dd FROM posts WHERE task_id=#{id}) dd LEFT JOIN uploads u ON dd.dd=ud WHERE u.task_id=#{id}").each do |row|
      hh[row["ud"]] = [[],[]] if hh[row["ud"]].nil?
      hh[row["ud"]][1].push([row["id"],row["filename"],row["staff"],row["size"]])
    end
    hh
  end
end

