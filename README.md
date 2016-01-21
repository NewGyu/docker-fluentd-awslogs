# docker-fluentd-awslogs
CloudWatch Logsに送るFluentdのDockerコンテナ

## このfluentdコンテナの実行方法

```
$ docker run -it -e AWSLOGS_GROUP=personalize/batch/test -e AWSLOGS_STREAM=fuga -e AWS_REGION=ap-northeast-1 -e AWS_ACCESS_KEY_ID=AKIA... -e AWS_SECRET_ACCESS_KEY=Bzd... fluent-awslogs
```

## このコンテナにログを転送する方法
$ docker run --log-driver=fluentd --log-opt fluentd-address=172.17.0.2:22424 busybox echo unko

## 悩み

* fluentd-addressのIPが変わって困る
    * `-p 22424:22424` して、 ``fluentd-address=localhost:22424`` が良さそう
    * でもECSで使おうと思うと各Instanceに絶対にfluentdコンテナが起動していないといかんということになる
    * 早くECSで公式にawslogs対応してくれ！ https://github.com/aws/amazon-ecs-agent/pull/251
