Triggers a Docker image rebuild on Docker Hub.
Modify run.d/20-add_cron.sh for cron setting. run ```docker-compose up -d```.

serverless dockerhub trigger.Use Google Script, set trigger time.
```
function dockerhubTriggerFunction(url) {
  //url sample: "https://cloud.docker.com/api/build/v1/source/XXX/trigger/XXX/call/";
  var postData = {
  'build': 'true'
 };
  var headers = {
    'contentType': 'application/json',
  };
  var options = {
    'headers': headers,
    'method' : 'POST',
    'payload': JSON.stringify(postData)
  };

  var response = UrlFetchApp.fetch(url, options);
  var data = JSON.parse(response.getContentText());
  Logger.log(data);
}

function doTrigger() {
  dockerhubTriggerFunction("https://cloud.docker.com/api/build/v1/source/xxxx/trigger/xxxx/call/");
}
```