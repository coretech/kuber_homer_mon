load("json.star", "json")
load("logging.star", "log")

def apply(metric):
   j = json.decode(metric.fields.get("value")) # json 
   metrics=[]
     
   for group in j:    #  array of jason elements  to become Metrics
     new_metric = Metric("fspbx_http")

#     new_metric.fields["size"] = int(group["size"])
#     new_metric.fields["used"] = int(group["used"])
##     new_metric.fields["usage"] = float(str(group["usage"].replace("%","")))
#     new_metric.fields["available"] = int(group["available"])
#     new_metric.tags[str("filesystem")]=group["filesystem"]
#     new_metric.tags[str("path")]=group["path"]
     new_metric.tags["server_hostname"] = str(j["hostname"])
     new_metric.fields["request_time"] = int(j["request_time"])
#     new_metric.fields["status"] = str(j["status"])
     new_metric.tags["status"] = str(j["status"])

#     new_metric.fields["sessions_active"] = int(j["sessions_active"])
#     new_metric.fields["sessions_older2h"] = int(j["sessions_older2h"])
#     new_metric.fields["sessions_since"] = int(j["sessions_since"])
#

     metrics.append(new_metric)

   return metrics

