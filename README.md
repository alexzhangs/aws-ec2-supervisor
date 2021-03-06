# aws-ec2-supervisor

**This repo is deprecated. It's function has been moved to [xsh-lib/aws](https://github.com/xsh-lib/aws) `/functions/gist/ec2/linux/installer/supervisor`.**

Install supervisor on AWS EC2 instance.

## Get code

```
$ git clone https://github.com/alexzhangs/aws-ec2-supervisor.git
```

## Install supervisor

Below installation need to be run under the root user.

Install the latest version of supervisor:

```
# bash aws-ec2-supervisor/aws-ec2-supervisor-install.sh
```

Install the latest version of supervisor, and plus an additional init.d
script, so can use `service supervisord <start|stop>` to control
supervisor daemon.

```
# bash aws-ec2-supervisor/aws-ec2-supervisor-install.sh -i
```

Install a specific version of supervisor:

```
# bash aws-ec2-supervisor/aws-ec2-supervisor-install.sh -v 4.0.3
```

## Troubleshooting

1. Check supervisor log:

```
tail -f /tmp/supervisord.log
```
