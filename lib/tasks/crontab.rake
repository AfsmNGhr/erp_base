task :check_workobject_reports => :environment do
  @work_obj = Workobject.all
  @work_obj.each do |wo|
    if wo.status=="run" && Post.where("workobject_id=#{wo.id} and date(created_at)=date('now')").count + Upload.where("workobject_id=#{wo.id} and date(created_at)=date('now')").count ==0
      Mailer.not_found_report(wo).deliver
    end
  end
end

task :check_tasks_exire => :environment do
 Task.where("edate=? AND (state='3new' or state='2run')",Time.now.strftime("%Y-%m-%d")).each do |task|
   staff = Staff.find(task.staff_id)
   Mailer.task_expire_notification(task,staff).deliver
 end
end

task :check_tasks_exireds => :environment do
 Task.where("edate=? AND (state='3new' or state='2run')",Time.now.strftime("%Y-%m-%d")).each do |task|
   staff = Staff.find(task.staff_id)
   Mailer.task_expireds_alert(task,staff).deliver
 end
end
