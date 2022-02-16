load("json.star", "json")
load("logging.star", "log")

def apply(metric):
   j = json.decode(metric.fields.get("value")) # json 
   metrics=[]
     
   for group in j["storage"]:    #  array of jason elements  to become Metrics
     new_metric = Metric("host_stats")

     new_metric.fields["size"] = int(group["size"])
     new_metric.fields["used"] = int(group["used"])
#     new_metric.fields["usage"] = float(str(group["usage"].replace("%","")))
     new_metric.fields["available"] = int(group["available"])

     new_metric.tags[str("filesystem")]=group["filesystem"]
     new_metric.tags[str("path")]=group["path"]


     new_metric.tags["server_hostname"] = str(j["server_hostname"])
     new_metric.fields["uptime"] = int(j["uptime"])
     new_metric.fields["sessions_max"] = int(j["sessions_max"])
     new_metric.fields["sessions_active"] = int(j["sessions_active"])
     new_metric.fields["sessions_older2h"] = int(j["sessions_older2h"])
     new_metric.fields["sessions_since"] = int(j["sessions_since"])
     new_metric.fields["sessions_5minpeakmax"] = int(j["sessions_5minpeakmax"])
     new_metric.fields["sessions_peakmax"] = int(j["sessions_peakmax"])
     new_metric.fields["cps_active"] = int(j["cps_active"])
     new_metric.fields["cps_5minpeakmax"] = int(j["cps_5minpeakmax"])
     new_metric.fields["cps_peakmax"] = int(j["cps_peakmax"])
     new_metric.fields["cps_max"] = int(j["cps_max"])
     new_metric.fields["cpu_idle"] = 100-float(j["cpu_idle"])
#     new_metric.fields["Event-Date-Timestamp"] = int(j["Event-Date-Timestamp"])



     metrics.append(new_metric)

   return metrics

