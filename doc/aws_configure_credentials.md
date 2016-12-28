# AWS Credentials

You will need to make sure that you have your AWS credentials stored in 
`~/.aws/credentials`. This will most likely look something like

```
[default]
aws_access_key_id = AKID1234567890
aws_secret_access_key = MY-SECRET-KEY
```

If you have installed the command line interface, you can configure your system 
easily using

```
$ aws configure
```

More details with regard to this can be found 
[here](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html).

Verify your credentials by listing your running EC2 instances using

```
aws ec2 describe-instances
```
