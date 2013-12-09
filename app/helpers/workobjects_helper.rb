# -*- encoding : utf-8 -*-
module WorkobjectsHelper
  def color_for_fontbg_hash
    Hash[0,"red",20,"orange",40,"yellow",60,"darkorange",80,"green",100,"lightblue" ]
  end
  def posts_join_upload_hash(id)
    hh = Hash.new
    Post.connection.select_all("SELECT p.id,date(p.created_at) pd,p.text,p.staff_id FROM (SELECT date(created_at) dd FROM uploads WHERE workobject_id=#{id} UNION SELECT date(created_at) dd FROM posts WHERE workobject_id=#{id}) dd LEFT JOIN posts p ON dd.dd=pd WHERE p.workobject_id=#{id}").each do |row|
      hh[row["pd"]] = [[],[]] if hh[row["pd"]].nil?
      hh[row["pd"]][0].push([row["id"],row["text"],row["staff_id"]])
    end
    Post.connection.select_all("SELECT dd.dd,u.id,date(u.created_at) ud,u.filename,u.staff,u.size FROM (SELECT date(created_at) dd FROM uploads WHERE workobject_id=#{id} UNION SELECT date(created_at) dd FROM posts WHERE workobject_id=#{id}) dd LEFT JOIN uploads u ON dd.dd=ud WHERE u.workobject_id=#{id}").each do |row|
      hh[row["ud"]] = [[],[]] if hh[row["ud"]].nil?
      hh[row["ud"]][1].push([row["id"],row["filename"],row["staff"],row["size"]])
    end
    hh
  end

  def workobject_status_list
    [["Договор","dogovor"],["Реализация","run"],["Закрытие","close"]].each {|st| yield st }
  end
  def workobject_status_hash
    { "dogovor" => "Договор", "run" => "Реализация", "close" => "Закрытие" }
  end
end
